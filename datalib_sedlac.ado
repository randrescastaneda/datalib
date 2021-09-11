*! v.0.6.           <22dec2017>  <Andres Castaneda>



program define datalib_sedlac, rclass

syntax [anything]							///
[if] [in],		                      	///
[										///
COUNtry(string)							///
Years(numlist)							///
CIRca(numlist)							///
SURvey(string)							///
PERiod(string)							///
NATure(string)							///
Type(string)							///
path(string)							///
APPEND SAVE  							///
prefix(string)							///
sufix(string)							///
filename(string)						///
DISPLAY INFO							///
CLEAR noPPP REPLACE						///
INCppp(string) PLppp(string)			///
CPIppp(string)							///
PPPyear(string)									///
condition1(string)						///
condition2(string)						///
condition3(string)						///
VERMast(string)							///
VERAlt(string)							///
VINTage(string)							///
PROject(string)							///
LANGuage(string)						///
vars(string)							///  option to specify variables
modules(string)           ///  
IGNOREerror								///
noCOHH		     					///
retlist									///
clean		*							/// internal use only
]

local root "${rootdatalib}/sedlac"
local nature "household"

tempfile base aux _sedlacfile
tempname hh
cap file open `hh' using "`root'/_log\log_sedlac.csv", write text append
if ("`ignoreerror'" == "" & _rc != 0) error _rc


* =========================================START================================================
* ======================= 1. Globals for each country ==============	 *
* ==============================================================================================


*_globalbases , nature(`nature')

if ("`country'" == "arg") local countryname "Argentina"
if ("`country'" == "bol") local countryname "Bolivia"
if ("`country'" == "bra") local countryname "Brazil"
if ("`country'" == "chl") local countryname "Chile"
if ("`country'" == "col") local countryname "Colombia"
if ("`country'" == "cri") local countryname "Costa Rica"
if ("`country'" == "dom") local countryname "Dominican Republic"
if ("`country'" == "ecu") local countryname "Ecuador"
if ("`country'" == "slv") local countryname "El Salvador"
if ("`country'" == "gtm") local countryname "Guatemala"
if ("`country'" == "hnd") local countryname "Honduras"
if ("`country'" == "mex") local countryname "Mexico"
if ("`country'" == "nic") local countryname "Nicaragua"
if ("`country'" == "pan") local countryname "Panama"
if ("`country'" == "pry") local countryname "Paraguay"
if ("`country'" == "per") local countryname "Peru"
if ("`country'" == "ury") local countryname "Uruguay"
if ("`country'" == "ven") local countryname "Venezuela"
if ("`country'" == "bhs") local countryname "Bahamas"
if ("`country'" == "blz") local countryname "Belice"
if ("`country'" == "guy") local countryname "Guyana"
if ("`country'" == "hti") local countryname "Haiti"
if ("`country'" == "jam") local countryname "Jamaica"
if ("`country'" == "sur") local countryname "Suriname"
if ("`country'" == "lac") local countryname "LAC"

local pais `"`countryname'"'

* ===================================START========================================
* ======================= 2. Check for Errors ==============	 *
* ===============================================================================



* General conditions

* Vintage OPTION

* Syntax

if ( ( "`country'" != "" | "`years'" != "" | "`survey'" != "") ///
& "`vintage'" != "" ) {
	di in red "You cannot specify country, years, or survey" _con
	di in red "option with the vintage option" _new
	error 198
}

* sections
if ( "`vintage'" != "" ) {
	local folder1 = upper(substr("`vintage'", 1, strpos( "`vintage'", "_v") -1))
	local country = lower(substr("`vintage'", 1, 3))
	local years = substr("`vintage'", 5, 4)
	lstrfun project, regexms("`vintage'", "^.*([0-9][0-9])$", 1)
	return local vintage `vintage'
}

* Circa and years error
if ( "`years'" != "" & "`circa'" != "") {
	di as error "You must specify either circa or years option but not both"
	error 198
}

/* 
* error of year and append | save....
if ((wordcount("`years'") > 1 | substr("`years'",5,1) == "/" ) ///
& ( "`save'" == "" & "`append'" == "")) {
di _new in red "If you select more than two years you must especify the option save, append or both."
error 198
} */

if ( "`vintage'" == "" &  "`country'" == "" ) {
	noi di as error "option country() or vintage required"
	error 198
}


if ( "`project'" == "" ) {
	local prodef = 1      // no survey selected, so datalib will get the default
	local project "03"    // default project version
}
else local prodef = 0


* Type Conditions

if ( "`type'" == "")    local type "sedlac" 
if ("`modules'" == "" & "`type'" != "base")  {
	if (lower("`country'") != "lac") local modules "pov"
	else                             local modules "sedlac"
}

local type = lower("`type'")
return local type `type'
return local modules "`modules'"

* path
if ( "`path'" == "" ) {
	cap mkdir "c:/datalib_data/"
	local path "c:/datalib_data/"
}
else {
	cap mkdir "`path'/"
	local path "`path'/"
}

* survey

if ("`survey'" != "") local survey = lower("`survey'")

local p = strmatch( "`path'","${rootdatalib}*" )
if ( `p' == 1 ) {
	di in red "You have no saving rights to the datalib folder. Path changed to c:/datalib_data/"
	cap mkdir "c:/datalib_data/"
	local path "c:/datalib_data/"
}

*  poverty 

if ( "`modules'" != "" & "`type'" == "base" ) {
	noi di as error `"Option {it:modules()} is not compatible with {it:type(base)}"'
	error 197
}

* Prefix
if ( "`prefix'" != "" ) {
	local prefix "`prefix'_"
}

* Sufix
if ( "`sufix'" != "" ) {
	local sufix "_`sufix'"
}

* local for lack of data base
local lack = 1

* Default versions
if ( "`veralt'" == "" ) local altdef = 1
else local altdef = 0

if ( "`vermast'" == "" ) local mastdef = 1 
else local mastdef = 0

if ( "`survey'" == "" ) local survdef = 1 
else local survdef = 0

if ("`period'" == "") local perdef = 1
else local perdef = 0

if ( "`vintage'" == "" ) local vintdef = 1 
else local vintdef = 0


** PPP year
if ("`pppyear'" == "") local pppyear 2011

if !inlist(`pppyear', 1993, 2005, 2011)  {
	noi disp in red "you must specify 1993, 2005, or 2011 for the PPP year"
	error
}

* option vars

if ("`vars'" != "") {
	if (lower("`modules'") != "all") {
		local vars ""
		noi disp in red _n "NOTE: " in y "option {opt vars} only works with {opt modules(all)}"
	}
	else {
		local idvars "id com pondera psu strata cohh jefe"
		local vars: list idvars | vars
	}
}

* name of all the directories inside the country folder
local dirs1: dir "`root'/`country'" dirs "*"   // SUPER IMPORTANT

* ==============================================================================
* ============ 3. Procedure to create Circa years ==============	 *
* ==============================================================================

if ( "`circa'" != "" & "`years'" == "" ) {
	foreach dir of local dirs1 {
		if regexm(`"`dir'"', `"^([a-zA-Z]+)_([0-9]+)"') local x = regexs(2)
		local ano "`ano' `x' "
	}
	
	noi di in y _new "************** For `countryname' ***********"
	foreach circ in `circa' {
		local yes = 0 					// local to confirm circa year match
		foreach x of numlist 0 1 -1 2 -2 {
			local year = `circ' + (`x')
			if ( regexm( "`ano'", "`year'") == 1) {
				noi di in g "circa year equivalent to " in y "`circ'" in g " is " in y " `year'"
				local years "`years' `year'"
				local yes = 1			// if there is circa match then it will be 1
				continue, break 		// <-- this breaks only the "foreach x of numlist..." loop
			}
		}
		if ( `yes' == 0)  noi di in red "There is not circa year equivalent to " in y "`circ'"
	}
	if ( "`years'" == "" ) {
		disp in red "No circa year was found using five years interval"
		error
	}
	noi di in y "***************************************"
	return local circa `circa' // return circa years 
}  //  end of procedure to create circa years

* ==================================================================================
* =============== 4.start new data base. ==============	 *
* =================================================================================

if ("`retlist'" == "") {
	if ( "`clear'" == "clear") drop _all
	cap count
	if r(N) == 0 {
		qui save `base', replace emptyok
	}
	else {
		noi di as error "you must either start with and empty data base or type the clear option"
		error 4
	}
}

* ==================================================================================
* ======= 5. Loop for YEARS: THIS IS THE MOST IMPORTANT SECTION========	 *
* ===================================================================================

numlist "`years'"
local years = r(numlist)
if wordcount("`years'") > 1 local append "append"		// local for append in case more than one year selected
else local append ""


local c = 0 		 // if circa is specified 
qui foreach year of local years {
	local ++c
	
	* especial case for Bolivia
	if ( "`country'" == "bol" &  `year' == 2003) {
		disp in red "The ECH 2003/2004 of Bolivia is only available for 2004, not for 2003"
		drop _all
		error
	}
	if ( "`country'" == "bol" & `year' == 2004) local year "2003-2004"
	
	local dirs_1: dir "`root'/`country'" dirs "`country'_`year'*" // directories with form arg_2003_ephc
	
	noi if (wordcount(`"`dirs_1'"') == 0) {
		disp as error "No survey for the selected year. " _con
		disp as result "Click" `"{stata datalib_displaysedlac, country(`country') type(sedlac) pro(`project'): here }"' in y "for availability of data for `countryname'"
		error
	}
	
	*************************************************************
	* Select surveys when there is more that one survey per year
	*************************************************************
	
	if (`survdef' == 1) 	{			// if survey is not specified by the user
		
		if (wordcount(`"`dirs_1'"') > 1 ) {
			local nsur = wordcount(`"`dirs_1'"') //  number of surveys
			
			foreach dir_1 of local dirs_1 {
				lstrfun sur, regexms(`"`dir_1'"', `"(^.*)_([a-zA-Z]+[-]?[a-zA-Z]+)$"',2)
				local surveys = ltrim("`surveys' `sur'")			// avoid blanks
			}
			
			noi disp in red "Caution: " in w "`countryname' has `nsur' surveys in `year': " in y `"`surveys'"' _cont
			
			* Conditions for countries
			if ("`country'" == "arg" & `year' == 2003) local survey "ephc"
			if ("`country'" == "col" & inlist(`year', 2000, 2003) ) local survey "ech"
			if ("`country'" == "ecu" & `year' == 2006) local survey "enemdu"
			if ("`country'" == "ecu" & inlist(`year',1995, 1998)) local survey "eped"
			if ("`country'" == "hnd" & `year' == 2004) local survey "ephpm"
			if ("`country'" == "per" & `year' == 2003) local survey "enaho"
			
			noi disp in w ". Default is" in y  " `survey'"
			
		}  //  end of if (wordcount("`dirs_1'") > 1 )
		
		if (wordcount(`"`dirs_1'"') == 1 ) /// lstrfun survey, regexms(`"`dirs_1'"', `"(^.*)(`year'[_]?[a-zA-Z]?[0-9]?_[a-zA-Z]+[-]?[a-zA-Z]*)"',2)
		lstrfun survey, regexms(`dirs_1', `"(^.*)_([a-zA-Z]+[-]?[a-zA-Z]+)$"',2) 
		
	} // end of condition if (`survdef' == 1) -> survey not defined by the user. 
	
	local folder1 "`country'_`year'_`survey'"
	
	return local countryname  `countryname' // return country name
	return local countrycode = upper("`country'") // return country acronym
	
	* Special case: Bolivia
	if ( "`country'" == "bol" &`year' == 2004) {
		noi di in red "Warning: " in ye "Bolivia has one single survey for 2003 and 2004"
		local year `"2003-2004"'
	}
	
	
	**********************************************
	* Optimize for default surveys. 
	**********************************************
	local dir "`root'/`country'/`country'_`year'_`survey'"
	
	* select folders
	if ("`type'" == "sedlac") local folders : dir "`dir'" dirs "*sedlac*" 
	if ("`type'" == "base")   local folders : dir "`dir'" dirs "*m" 
	
	/* TO DELETE
	if (inlist("`type'", "sedlac", "cedlas")) local folders : dir "`dir'" dirs "*sedlac*" 
	if ("`type'" == "base") {
	if ("`project'" == "03") local folders : dir "`dir'" dirs "*m" 
	if ("`project'" == "02") local folders : dir "`dir'" dirs "*base" 
	}
	*/
	
	if ("`vintage'" != "" & `vintdef' == 0) local folders = "`vintage'" // if the loop created a vintage it requires that the vintage was define at the beginning.
	
	* Set temporary names and files for postfiles
	
	
	* local folders: dir "S:\Datalib\sedlac\argentina\arg_2004_ephc" dirs "*"  // do delete
	
	tempname a
	postfile `a' str70 (file country year period survey vermast veralt type project) ///
	using `aux', replace
	
	* Loop with files
	
	foreach folder of local folders {
		
		local folder = lower("`folder'")
		
		if regexm(`"`folder'"', `"(^[a-z]+)_*"')	                            /// 
		local  country_f = regexs(1)
		if regexm(`"`folder'"', `"(^`country_f'_)([0-9]+)_*"')                /// 
		local  years_f   = regexs(2)
		if regexm(`"`folder'"', `"(^.*)_([a-z]+)\-?[a-z0-9]*_v0[1-9]_m(.*)"') /// 
		local  survey_f  = regexs(2)
		if regexm(`"`folder'"', `"[_\-]?([a-z][0-9])_(.*)"') 	                /// 
		local  period_f  = regexs(1)
		if regexm(`"`folder'"', `"(^.*)_v(0[1-9])_m(.*)"')	                  /// 
		local  vermast_f = regexs(2)
		if regexm(`"`folder'"', `"(^.*)m_v(0[1-9])_a(.*)"')	                  /// 
		local  veralt_f  = regexs(2)
		if regexm(`"`folder'"', `"(^.*)_([a-z]+)([\-]?[0-9]?[1-9]?)$"')	      /// 
		local  type_f    = regexs(2)
		if regexm(`"`folder'"', `"(^.*)[_\-]([0-9]+$)"')	                    /// 
		local  project_f = regexs(2)
		
		noi post `a' ("`folder'") ("`country_f'") ("`years_f'")       ///
		("`period_f'") ("`survey_f'") ("`vermast_f'") ("`veralt_f'")  ///
		("`type_f'") ("`project_f'")
	}
	
	postclose `a'
	
	if ("`retlist'" == "retlist") preserve
	drop _all
	use `aux'
	* In case of alternative version
	if regexm("`options'", "alt") {
		keep if regexm(file, "alt$")
	}
	else keep if !regexm(file, "alt$")
	
	if (`altdef'  == 0)     keep if veralt  == "`veralt'"
	if (`mastdef' == 0)     keep if vermast == "`vermast'"
	if (`perdef'  == 0)     keep if period  == "`period'"
	if ("`type'" != "base") keep if project == "`project'"
	
	* Sort considering Project, Period, Alternative and Master version	
	sort project period veralt vermast
	qui count
	if (`r(N)' == 0) {
		** local for lack of data base
		disp as error "the combination before was not found"
		error
	}
	else local lack = 0
	
	local file    = file[`r(N)']
	* local country = country[`r(N)']
	local year    = year[`r(N)']
	local period  = period[`r(N)']
	local survey  = survey[`r(N)']
	local vermast = vermast[`r(N)']
	local veralt  = veralt[`r(N)']
	* local project = project[`r(N)']
	
	* Return information
	return local years `years' 		            
	return local project `project' 	          
	return local vermast `vermast'	          
	return local veralt `veralt' 	            
	return local surveys "`survey'_`period'"  
	return local survname "`survey'"          
	return local period "`period'"            
	
	
	* Macros
	if ("`type'" != "base" ) local folder "`dir'/`file'/Data/Harmonized"
	else                     local folder "`dir'/`file'/Data/Base"
	
	
	** ### Change this when project 02 change to the new convention
	if ("`type'" != "base") {
		foreach module of local modules {	
			
			if (`"`: dir "`folder'" files "*_`module'.dta"'"' == "") {
				noi disp in red _n "Module `module' is not available in " ///
				"`country' `year' `type'"
				local nomodule 1
			}
			
			cap else local data "`data' `: dir "`folder'" files "*_`module'.dta"'"
		}  // end of modules loop
		
		if ("`nomodule'" == "1") error				
	}
	else cap local data: dir "`folder'" files "*base.dta"     // in case base is chosen      
	local derror = _rc
	local data = strtrim(`"`data'"')
	local data: subinstr local data " " ", ", all 
	local data: subinstr local data `"""' "", all 
	
	
	** ### End
	
	
	**********************************************
	* --> Display of survey information
	**********************************************
	
	noi dis as text "{hline}" 
	noi dis as text "{p 4 4 2}{cmd:Country:} " in y "`pais'" as text " {p_end}"
	noi dis as text "{p 4 4 2}{cmd:Year:} "    in y "`year'`period'" as text " {p_end}"
	noi dis as text "{p 4 4 2}{cmd:Survey:} "  in y "`survey'" as text " {p_end}"
	noi dis as text "{p 4 4 2}{cmd:Type:} "    in y "`type'" as text " {p_end}"
	
	if ("`type'" != "base" ) noi dis as text "{p 4 4 2}{cmd:Sedlac Project:} " 	///
	in y "`project'" as text " {p_end}"
	
	noi dis as text "{p 4 4 2}{cmd:Master Version:} "	in y "`vermast'" as text " {p_end}"
	
	if ("`type'" != "base" ) noi dis as text "{p 4 4 2}{cmd:Alternative Version:} " ///
	in y "`veralt'" as text " {p_end}"
	
	noi dis as text "{p 4 4 2}{cmd:Data file name:} " 		in y "`data'" as text " {p_end}"
	
	if ( `derror' == 601) {
		noi di in red " The folder specified above does not exist. Please check.."
		error 601
	}
	else if ( `derror' != 0)  {
		no di in red "Wrong specification..."
		error
	}
	*                                                      <-- end of display
	
	if ( "`data'" == "" ) { // error display
		noi di in red "one or more of the specifications above is not in the folder "
		if (strmatch("`ignoreerror'","ignore*") != 1 ) error 601
		continue, break
	}
	
	local vintage: subinstr local data ".dta" "", all
	local vintagelist "`vintagelist' `vintage' "
	
	return local vintage  "`vintage'"	// return survey and year together
	
	loca file = upper("`file'")
	while regexm("`file'", "(_V)([0-9]+_)") {
		if regexm("`file'", "(_V)([0-9]+_)") ///
		local file = regexr("`file'", "_V[0-9]+_", "_v"+regexs(2))
	}
	
	if regexm("`file'", "([A-Z]+_)([0-9]+_)([A-Z0-9]+)_([A-Z]+)(_v[0-9]+_.*)") ///
	local file = regexs(1) + regexs(2) + regexs(4) + "-" + regexs(3) + regexs(5)
	
	return local surveyid "`file'"
	
	* Display metadata
	use if id == lower("`vintage'") using "${rootdatalib}\SEDLAC\sedlac-links.dta", clear
	count
	if r(N) > 0 {
		local title: display title
		local link: display link
		noi di as text "{p 4 4 2}{cmd:Survey Title:} " ///
		in y "`title'" as text " {p_end}"
		if ("`type'" == "sedlac" ) {
			noi di in smcl "{p 4 4 2}{cmd:Link to DDI:}{browse " ///
			_char(34) "`link'"_char(34)" : Survey metadata (microdata portal)}" _newline
		}
	}
	else {
		if ("`type'" == "sedlac" ) noi di in smcl "{p 4 4 2}{cmd:Link to DDI: }" ///
		as text " No metadata available for this survey" _newline
		
	}
	noi di as text "{hline}"
	
	if ("`retlist'" == "retlist"){
		restore
		exit
	}
	
	
	local ttmp = subinstr("`type'","_"," ",.)
	local type2 = word("`ttmp'",1)
	
	/* The metadata display will be temporaly unable
	
	if ( "`country'" == "bol" & "`year'" == "2003-2004" ) {
	noi  datalib_metadata, country(`country') year(2003) survey(`type2')
	noi  datalib_metadata, country(`country') year(2004) survey(`type2')
	}
	else noi  datalib_metadata, country(`country') year(`year') survey(`type2')
	*/
	
	
	
	
	* Data base used
	qui {
		*** combos in option vars
		
		if ("`type'" != "base") {
			
			local delimit = "-"
			local nmodule: word count `modules'
			local nm = 0
			local hhl = ""
			
			foreach module of local modules {
				local ++nm
				local data03:  dir "`folder'" files "*_`module'.dta"
				local data03 `data03'
				
				if inlist("`module'", "gds", "inf", "reg", "hhd") local hhl = "`hhl'1"
				else local hhl = "`hhl'0"
				
				if (`nm' == 1) use `vars' using "`folder'/`data03'", `clear'	
				else {
					local ms = substr("`hhl'", -2, .) // merge syntax
					if       ("`ms'" == "00") local msyntax "1:1 id com"
					else if  ("`ms'" == "01") local msyntax "m:1 id"
					else if  ("`ms'" == "11") local msyntax "1:1 id"
					else                      local msyntax "1:m id"
					
					merge `msyntax' using "`folder'/`data03'", nogen 
				} // condition for merging datasets
			} // end of modules loop
		} // end of project 03 condition
		
		else {  // this is for BASE
			
			cap use "`folder'/`data'", `clear' // clear mandatory
			if _rc == 4 error 4 			// "no; data in memory would be lost" error
			else if (_rc > 0) continue 		// data requested does not exist
		}
		
		save `_sedlacfile'
		use `_sedlacfile', clear
		cap erase `_sedlacfile'
		label language
		if (!regexm("`r(languages)'", "cedlas")) label language cedlas, rename
		
		if ("`clean'" != "clean") { // option to get the data just as CEDLAS produces it. 
			* renmame original variables
			
			if ("`country'" != "lac") {
				foreach ren in ano pais encuesta tipo {
					cap confirm var `ren'
					if (_rc == 0 ) ren `ren' `ren'_ocaux
				}
				
				if ( "`country'" == "bol" & "`year'" == "2003-2004" ) cap qui gen ano = 2004
				/* use 2004 CPI for Bolivia 2003-2004 	--> ^^^^ */
				
				* create standarized variables for ano, pais, encuesta and tipo
				if ("`period'" != "") local _period = "-`period'"
				else local _period = ""
				gen ano 	= `year'
				gen pais 		= lower("`country'")
				gen tipo 		= "`type'"
				gen encuesta 	= upper("`survey'`_period'")
			}
			else {
				replace encuesta = subinstr(encuesta, "_", "-", .)
			}
			
			
			* if circa is specified 
			if ("`circa'" != "") gen circa = `: word `c' of `circa''
			
			if ( "`circa'" != "" ) {
				cap qui gen circa = `circ'
			}
			
			* make sure we use the right cpi and ppp factor
			foreach v in ipc ppp05 ipc05 ipcf_ppp05 ipcf_ppp11 ipcf_cpi05 ///
			ipc93_sedlac ppp93 ipc05_sedlac ppp05 ipc11_sedlac ppp11 {
				cap confirm new var `v', exact
				if (_rc) cap drop `v'
			}
			
			* condition for individual databases and ppp factor requested
			if ( "`ppp'" != "noppp" & "`type'" != "base" ) {
				* merge cpi's
				cap destring ano, replace force
				* create locals for loops
				if ( "`incppp'" == "" & lower("`country'") != "lac") ///
				local incppp "ipcf ila inla"
				
				if ( "`incppp'" == "" & lower("`country'") == "lac") ///
				local incppp "ipcf ilapcf inlapcf"
				
				if ( "`incppp'" == "all" ) local incppp "ipcf ii ijubi itran ila ilapc ilaho itf icap  ila_m ila_n inla  renta_imp"
				if ("`vars'" != "") local incppp: list vars & incppp
				
				local cpis "ipc_sedlac ipc11_sedlac ppp11 ipc05_sedlac ppp05"
				local plppp "1.9 3.2 5.5 1.25 2.5 4 10 50 13 70"
				local cpippp: list cpippp - cpis    
				
				cap drop _merge
				levelsof pais, local(firstlist) sepa(,)		// First list of countries
				
				sort pais ano encuesta
				replace pais = lower(pais)
				
				merge m:1 pais ano encuesta using "`root'/ipc_sedlac_wb", ///
				keepusing(`cpis' conversion `cpippp') update replace
				drop if !inlist(_merge, 3, 4, 5)				
				drop _merge
				
				levelsof pais, local(secondlist) sepa(,)		// second list of countries
				
				if (`: list firstlist === secondlist' == 0) {
					noi disp in red "there was an error merging CPI data and SEDLAC data"
					exit
				}
				
				local ipc:     word 1 of `cpis'
				local ipcbase: word 2 of `cpis'
				local ppp:     word 3 of `cpis'
				
				* incomes
				foreach inc of local incppp {
					gen `inc'_ppp11 =((`inc'*ipc11_sedlac)/ipc_sedlac)/(ppp11*conversion)
					gen `inc'_ppp05 =((`inc'*ipc05_sedlac)/ipc_sedlac)/(ppp05*conversion)
				}
				
				foreach pl of local plppp {
					gen lp_`=`pl'*100'usd_ppp	= (365/12)*`pl'
					label var lp_`=`pl'*100'usd_ppp "Poverty line at `=char(36)'`pl' usd a day"
				}
			}	
			
			* selected variables 
			
			if ("`cohh'" != "nocohh" & "`type'" != "base" & "`country'" != "lac") ///
			keep if cohh == 1
			count
			* noi disp "No of obs == " r(N) " for year `year'"
			if ( "`append'" == "append") {
				append using `base'
				save `base', replace
			}
			* Add Languages to var and value labels
			if ("`country'" != "lac" & "`type'" != "base" ) ///
			datalib_sedlac_lang `language', project("`project'")
		} // End of clean condition
	} // End of qui brakes
	
	local date : di %tdN/D/CY date("$S_DATE", "DMY")
	local username = c(username)
	cap file write `hh' "`date', $S_TIME, `pais', `year', `survey', `type', `path', `username', household" _n
	
	local surveylist "`surveylist' `survey'`period' "
} // end of years loop

*
return local surveys `surveylist'
return local vintagelist `vintagelist'

* local for lack of data base
if ( "`lack'" == "1") {
	* final work with master version and alternative versiona locals
	if ( "`vermast'" == "") local vermast "Unknown" // If the survey requested does not exist
	if ( "`veralt'" == "") local veralt "Unknown" // If the survey requested does not exist
	
	noi dis as text "{hline}" 
	noi di in red "one or more of the following specifications does NOT exist: "
	noi dis as text "{p 4 4 2}{cmd:Country:} " 				in y "`pais'" as text " {p_end}"
	noi dis as text "{p 4 4 2}{cmd:Year:} " 				in y "`years2'`period'" as text " {p_end}"
	noi dis as text "{p 4 4 2}{cmd:Type:} " 				in y "`type'" as text " {p_end}"
	noi dis as text "{p 4 4 2}{cmd:Sedlac Project:} " 		in y "`project'" as text " {p_end}"
	noi dis as text "{p 4 4 2}{cmd:Master Version:} "		in y "`vermast'" as text " {p_end}"
	noi dis as text "{p 4 4 2}{cmd:Alternative Version:} " 	in y "`veralt'" as text " {p_end}"
	noi dis as text "{hline}" _newline
	if (strmatch("`ignoreerror'","ignore*") != 1 ) error 3
}
cap file close `hh'
end

exit
**********************************************************************************************

* v.0.5.           <15Oct2013>  <Andres Castaneda>
* v.0.4.           <30Sep2013>  <Andres Castaneda>
* v.0.3.           <16May2013>  <Andres Castaneda>
* v.0.2.           <15Mar2013>  <Andres Castaneda>
* v.0.1.           <08Aug2012>  <Andres Castaneda>




if ( "`basicvars'" == "") local idvars "id com cohh ano pais"
else local idvars ""

if ("`modules'" == "poverty") local vars "`idvars' ipcf pondera"

if ("`modules'" == "sedlac") {
	local vars `idvars' id com cohh ano pais id com cohh ano pais          ///
	pondera pondera_i relacion hogar hogarsec edad miembros hombre       ///
	jefe conyuge hijo casado raza propieta habita precaria matpreca      ///
	agua banio cloacas elect heladera lavarropas aire calefaccion_fija   ///
	telefono telefono_fijo celular televisor tv_cable video computadora  ///
	internet_casa auto moto bici alfabeto asiste edu_pub aedu nivel      ///
	strata psu region* urbano migrante pea ocupado desocupa durades      ///
	deseo_emp hstrt hstrp antigue relab empresa categ_lab sector1        ///
	contrato djubila ocuperma dsegsale daguinaldo dvacaciones sindicato  ///
	ip ila wage iasal ictap ipatr iol* cohi inla ijubi icap itran itrane ///
	ii renta_imp itf ipcf lp* p_reg  
}


if ("`vars'" != "") local vars "`idvars' `vars'"

