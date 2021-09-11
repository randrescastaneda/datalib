* v.0.2.           <08Jun2014>  <Andres Castaneda>

program define datalib_lablac, rclass
	
	syntax [anything]							///
	[if] [in],		                      	///
	[										///
	COUNtry(string)							///
	Years(numlist)							///
	CIRca(numlist)							///
	SURvey(string)							///
	PERiod(string)							///
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
	condition1(string)						///
	condition2(string)						///
	condition3(string)						///
	VERMast(string)							///
	VERAlt(string)							///
	VINTage(string)							///
	PROject(string)							///
	LANGuage(string)						///
	vars(string)							///  option to specify variables
	combovars(string)         ///  
	IGNOREerror								///
	noCOHH									///
	retlist									///
	clean									/// internal use only
	]
	
	local root "${rootdatalib}/lablac"
	local nature "labor"
	
	tempfile base
	tempname hh
	cap file open `hh' using "`root'/_log\log_lablac.csv", write text append
	if ("`ignoreerror'" == "" & _rc != 0) error _rc
	
	
	* ===========================START================================================
	* ================= 1. Globals for each country ==============	 *
	* ===============================================================================
	
	
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
	
	local pais `"`countryname'"'
	
	* =========================================START===================================================
	* ======================= 2. Check for Errors ==============	 *
	* ============================================================================================
	
	
	
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
	
	* Type Conditions
	
	if ( "`type'" == "") local type "lablac"
	else local type = lower("`type'")
	if ( !inlist("`type'", "lablac", "blab") ) {
		di in red "you must specify the type of the LABLAC survey" _new
		error 198
	}
	return local type `type'
	
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
	
	if ( "`vars'" == "poverty" & "`type'" == "base" ) {
		noi di as error `"you cannot select the [poverty] variables with the raw (base) data set"'
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
	if ( "`veralt'" == "" ) local altdef = 1 // alternative version not selected, datalib will get the default
	else local altdef = 0
	
	if ( "`vermast'" == "" ) local mastdef = 1 // master version not selected, datalib will get the default
	else local mastdef = 0
	
	if ( "`survey'" == "" ) local survdef = 1 // no survey selected, so datalib will get the default
	else local survdef = 0
	
	if ( "`project'" == "" ) {
		local prodef = 1     // no survey selected, so datalib will get the default
		local project "01"    // default project version
	}
	else local prodef = 0
	
	if "`period'"=="all" local periods "q01 q02 q03 q04"
	else if  "`period'"!="" local periods " `period' "
	if ("`period'" == "") {
		local perdef = 1
		local periods "q04" //  default fourth quarter in order to include Chile by default. 
	}
	else local perdef = 0
	
	
	
	if ( "`vintage'" == "" ) local vintdef = 1 // no vintage selected
	else local vintdef = 0
	
	
	
	* name of all the directories inside the country folder
	local dirs1: dir "`root'/`country'" dirs "*"   // SUPER IMPORTANT
	
	* ==============================================================================
	* ======================= 3. Procedure to create Circa years ==============	 *
	* =============================================================================
	
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
	
	* ==============================================================================
	* ======================= 4.start new data base. ==============	 *
	* ================================================================================
	
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
	
	* ============================================================================
	* =========== 5. Loop for YEARS: THIS IS THE MOST IMPORTANT SECTION============	 *
	* ==============================================================================
	
	
	numlist "`years'"
	local years = r(numlist)
	if wordcount("`years'") > 1 local append "append"		// local for append in case more than one year selected
	else if wordcount("`periods'") > 1 local append "append" // local for append in case more than one period  selected
	else local append ""
	
	
	local c = 0 		 // if circa is specified 
	qui foreach year of local years {
		local ++c
		
		local dirs_1: dir "`root'/`country'" dirs "`country'_`year'*" // directories with form arg_2003_ephc
		
		if (wordcount(`"`dirs_1'"') == 0) {
			disp as error "No survey for the selected year"
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
				if ("`country'" == "bra" & `year' >= 2012) local survey "pme"
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
		
		return local countryname `countryname' // return country name
		return local countrycode = upper("`country'") // return country acronym
		
		* Special case: Bolivia, this is for SEDLAC
		/* if ( "`country'" == "bol" & ( `year' == 2003 | `year' == 2004) ) {
		noi di in red "Warning: " in ye "Bolivia has one single survey for 2003 and 2004"
		local year `"2003-2004"'
		}
		*/
		
		**********************************************
		noi di "* Optimize for default surveys. "
		**********************************************
		local dir "`root'/`country'/`country'_`year'_`survey'"
		
		* select folders
		
		if ("`type'" == "lablac") local folders : dir "`dir'" dirs "*lablac*"  
		if ("`type'" == "blab") local folders : dir "`dir'" dirs "*m" 
		
		
		* After here we can know how many folders are in lablac or blab folder to filter quarter appends  
		* if "`periods'"=="q01 q02 q03 q04"	{
		* if wordcount( `"`folders'"' ) == 3 & ("`period'"=="q04") continue
		* if wordcount( `"`folders'"' ) == 2 & ("`period'"=="q04" | "`period'"=="q03") continue
		* if wordcount( `"`folders'"' ) == 1 & ("`period'"=="q04" | "`period'"=="q03" | "`period'"=="q02") continue
		* }
		
		*"
		if ("`vintage'" != "" & `vintdef' == 0) local folders = "`vintage'" // if the loop created a vintage it requires that the vintage was define at the beginning.
		
		* Set temporary names and files for postfiles
		
		* local folders: dir "S:\Datalib\lablac\argentina\arg_2004_ephc" dirs "*"  // do delete
		
		tempfile aux
		tempname a
		postfile `a' str70 (file country year survey vermast veralt type project) using `aux', replace
		
		* Loop with files
		
		foreach folder of local folders {
			
			local folder = lower("`folder'")
			
			/*country:*/ lstrfun country_f, regexms(`"`folder'"', `"(^[a-z]+)_*"', 1)	
			/*year   :*/ lstrfun years_f,   regexms(`"`folder'"', `"(^`country_f'_)([0-9]+)_*"', 2)
			/*survey :*/ lstrfun survey_f,  regexms(`"`folder'"', `"(^.*)_([a-z]+)\-?[a-z0-9]*_v0[1-9]_m(.*)"', 2)	
			/*vermast:*/ lstrfun vermast_f, regexms(`"`folder'"', `"(^.*)_v(0[1-9])_m(.*)"', 2)	
			/*veralt :*/ lstrfun veralt_f,  regexms(`"`folder'"', `"(^.*)m_v(0[1-9])_a(.*)"', 2)	
			/*type   :*/ lstrfun type_f,    regexms(`"`folder'"', `"(^.*)_([a-z]+)([\-]?[0-9]?[1-9]?)$"', 2)	
			/*project:*/ lstrfun project_f, regexms(`"`folder'"', `"(^.*)[_\-]([0-9]+$)"', 2)	
			
			
			noi post `a' ("`folder'") ("`country_f'") ("`years_f'") ("`survey_f'") ///
			("`vermast_f'") ("`veralt_f'") ("`type_f'") ("`project_f'")
		}
		
		postclose `a'
		drop _all
		use `aux'
		
		if (`altdef'  == 0)        keep if veralt  == "`veralt'"
		if (`mastdef' == 0)        keep if vermast == "`vermast'"
		if (`prodef'  == 0)        keep if project == "`project'"
		
		* Sort considering Project, Alternative and Master version	
		sort project veralt vermast
		qui count
		if (`r(N)' == 0) {
			** local for lack of data base
			disp as error "the combination before was not found"
			error
		}
		else local lack = 0
		
		local file    = file[`r(N)']
		local country = country[`r(N)']
		local year    = year[`r(N)']
		local survey  = survey[`r(N)']
		local vermast = vermast[`r(N)']
		local veralt  = veralt[`r(N)']
		local project = project[`r(N)']
		
		* Return information
		return local years `years' 		          // return years
		return local project `project' 	          // return alternative version
		return local vermast `vermast'	          // return master version
		return local veralt `veralt' 	          // return alternative version
		return local surveys "`survey'_`period'"  // return survey and year together
		return local survname "`survey'"          // return survey and year together
		return local period "`period'"            // return survey and year together
		return local periods "`periods'"            // return survey and year together
		
		
		* Macros
		if ("`type'" != "blab" ) local folder "`dir'/`file'/Data/Harmonized"
		else local folder "`dir'/`file'/Data/Base"
		
		local files: dir "`folder'" files "*_`type'_*.dta"
		
		local f = 0 
		tempfile filesappend
		foreach period of local periods {
			local ++f
			cap confirm file "`folder'/`file'_`period'.dta"
			if (_rc) {
				noi disp as err "Warning:" as text ///
				"file `file'_`period'.dta does not exist. Check period or year" _n
			}
			if (`f' == 1) {
				cap use "`folder'/`file'_`period'.dta", `clear'
				save `filesappend', replace
			}
			else {
				cap append using "`folder'/`file'_`period'.dta"	
			}
			local data "`file'_`period'.dta `data'"
		}
		count
		if r(N) == 0 {
			noi disp as err	 "no data for any of the specifications selected"
			error
		}
		
		**********************************************
		* --> Display of survey information
		**********************************************
		
		noi dis as text "{hline}" 
		noi dis as text "{p 4 4 2}{cmd:Country:} " 	in y "`pais'" as text " {p_end}"
		noi dis as text "{p 4 4 2}{cmd:Type:} " 	in y "`type'" as text " {p_end}"
		noi dis as text "{p 4 4 2} {cmd:Survey:}" in y "`survey'" " | {cmd:Year:} " 	in y "`year'" " | {cmd:Quarter:}" in y "`period'" ///
		as text " {p_end}"
		*noi dis as text "{p 4 4 2}{cmd:Quarter:} " 				in y "`period'" as text " {p_end}"
		*noi dis as text "{p 4 4 2}{cmd:Year:} " 				in y "`year'`period'" as text " {p_end}"
		*noi dis as text "{p 4 4 2}{cmd:Survey:} " 				in y "`survey'" as text " {p_end}"
		
		
		if ("`type'" != "blab" ) noi dis as text "{p 4 4 2}{cmd:LABLAC Project:} " 	///
		in y "`project'" " | {cmd:Master Version:} "	in y "`vermast'" ///
		" | {cmd:Alternative Version:} " in y "`veralt'"  as text " {p_end}"
		
		*noi dis as text "{p 4 4 2}{cmd:Master Version:} "	in y "`vermast'" as text " {p_end}"
		
		*if ("`type'" != "blab" ) noi dis as text "{p 4 4 2}{cmd:Alternative Version:} " ///
		*	in y "`veralt'" as text " {p_end}"
		
		noi dis as text "{p 4 4 2}{cmd:Data file name:} " 		in y "`data'" as text " {p_end}"
		noi dis as text "{hline}" _newline
		*                                                      <-- end of display
		
		
		
		if ( "`data'" == "" ) { // error display
			noi di in red "one or more of the specifications above is not in the folder "
			if (strmatch("`ignoreerror'","ignore*") != 1 ) error 601
			continue, break
		}
		
		local vintage: subinstr local data ".dta" "", all
		local vintagelist "`vintagelist' `vintage' "
		
		return local vintage "`vintage'"	// return survey and year together
		
		if ("`retlist'" == "retlist") exit
		
		
		local ttmp = subinstr("`type'","_"," ",.)
		local type2 = word("`ttmp'",1)
		
		/* The metadata display will be temporaly unable
		
		if ( "`country'" == "bol" & "`year'" == "2003-2004" ) {
		noi  datalib_metadata, country(`country') year(2003) survey(`type2')
		noi  datalib_metadata, country(`country') year(2004) survey(`type2')
		}
		else noi  datalib_metadata, country(`country') year(`year') survey(`type2')
		*/
		
		
		* Data blab used
		qui {
			
			if ("`clean'" != "clean") { // option to get the data just as CEDLAS produces it. 
				* renmame original variables
				foreach ren in ano pais encuesta tipo {
					cap confirm var `ren'
					if (_rc == 0 ) ren `ren' `ren'_ocaux
				}
				
				
				* create standarized variables for ano, pais, encuesta and tipo
				if ("`period'" != "") local _period = "_`period'"
				else local _period = ""
				gen ano 	= `year'
				gen pais 		= lower("`country'")
				gen encuesta 	= upper("`survey'")
				gen tipo 		= "`type'"
				
				* if circa is specified 
				if ("`circa'" != "") gen circa = `: word `c' of `circa''
				
				if ( "`circa'" != "" ) {
					cap qui gen circa = `circ'
				}
				
				* make sure we use the right cpi and ppp factor
				foreach v in ipc ppp05 ipc05 {
					cap confirm new var `v', exact
					if (_rc) cap drop `v'
				}
				
				* condition for individual databases and ppp factor requested
				if ( "`ppp'" != "noppp" & "`type'" != "blab" ) {
					* merge cpi's
					cap destring ano trimestre, replace force
					* create locals for loops
					if ( "`incppp'" == "" ) local incppp "ipcf ila inla"
					if ( "`incppp'" == "all" ) local incppp "ipcf ii ijubi itran ila ilapc ilaho itf icap  ila_m ila_n inla  renta_imp"
					if ( "`plppp'" == "" ) local plppp "2.5 4"
					
					* CPI's factors
					if ( "`cpippp'" == "") {
						local cpippp "ipc_lablac ipc05_lablac ppp05"
					}
					
					* Merge with cpi data
					cap drop _merge
					sort pais ano encuesta trimestre
					 
					merge pais ano encuesta trimestre  using "`root'/ipc_lablac_wb", keep(`cpippp' conversion)
					
					count if _merge==3
					*policy about efficiency, qilea and pilea are note replicable by seeds and equivalent labor are not well documented and we do not use that 
					drop *_ppp05 wage_m ilaho_m iasal_m ictap_m ipatr_m /// 
					inla_m ijubi_m icap_m itran_m itrane_m ii_m inlaf_m itf_m ///
					ilpc_m inlpc_m ilea_m ipcf_m ip_m ila_m qilea pilea iea ieb iec ied iee ///
					prii pric seci secc supi supc 
					if `r(N)'==0 {
						noi di in red "the cpi dataset is not merging with lablac data" 
						continue, break
					}
					
					drop if _merge != 3
					
					drop _merge  
					
					local ipc:		  word 1 of `cpippp'
					local ipcbase:  word 2 of `cpippp'
					local ppp:      word 3 of `cpippp'
					
					* incomes
					foreach inc of local incppp {
						gen `inc'_ppp = ((`inc'*`ipcbase')/`ipc')/(`ppp'*conversion)
					}
					
					* Poverty lines
					cap drop lp_1*
					cap drop lp_2*
					cap drop lp_4*
					local new = 1
					foreach pl of local plppp {
						if (strpos("`pl'",".") != 0) local p = substr("`pl'",1,strpos("`pl'",".")-1)
						else local p = `pl'
						cap confirm new var lp_`p'usd lp_`p'usd_ppp
						if !_rc { // action for all new variables
							gen lp_`p'usd		= ((30.42*`pl'*`ppp'*`ipc')/`ipcbase')*conversion
							gen lp_`p'usd_ppp	= 30.42*`pl'
							label var lp_`p'usd "Línea de pobreza de USD`pl' diarios"
							label var lp_`p'usd_ppp "Línea de pobreza de USD`pl' diarios PPP"
						}
						else { // action for NO new variables
							gen lp_`p'_`new'usd		= 30.42*`pl'*`ppp'*`ipc'/`ipcbase'*conversion
							gen lp_`p'_`new'usd_ppp	= 30.42*`pl'
							label var lp_`p'_`new'usd "Línea de pobreza de USD`pl' diarios"
							label var lp_`p'_`new'usd_ppp "Línea de pobreza de USD`pl' diarios PPP"
						}
						local new = `new' + 1
					} // End of PLPPP loop
					cap order pais ano  lp_*
				} // end of condition for ppp values and individual databases: "if ( "`ppp'" != "noppp" )" 
				
				* selected variables 
				
				if ( "`vars'" == "poverty") {
					if ("`cohh'" != "nocohh" & "`type'" != "blab") keep if cohh == 1
					`condition1'
					`condition2'
					`condition3'
					if ( "`ppp'" == "noppp" ) keep ipcf lp* pondera ano pais
					else keep ano ipcf ipcf_ppp lp* pondera pais ppp* ipc*
				}
				
				else if ( "`vars'" != "" & "`vars'" != "poverty" ) {
					if ("`cohh'" != "nocohh" & "`type'" != "blab") keep if cohh == 1
					`condition1'
					`condition2'
					`condition3'
					keep `vars'
				}
				else {
					if ("`cohh'" != "nocohh" & "`type'" != "blab") keep if cohh == 1
					`condition1'
					`condition2'
					`condition3'
				}
				count
				* noi disp "No of obs == " r(N) " for year `year'"
				if ( "`append'" == "append") {
					append using `base'
					save `base', replace
				}
				* Add Languages to var and value labels
				* datalib_lablac_lang `language'
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
		noi dis as text "{p 4 4 2}{cmd:LABLAC Project:} " 		in y "`project'" as text " {p_end}"
		noi dis as text "{p 4 4 2}{cmd:Master Version:} "		in y "`vermast'" as text " {p_end}"
		noi dis as text "{p 4 4 2}{cmd:Alternative Version:} " 	in y "`veralt'" as text " {p_end}"
		noi dis as text "{hline}" _newline
		if (strmatch("`ignoreerror'","ignore*") != 1 ) error 3
	}
	cap file close `hh'
	end
	
	exit
	**********************************************************************************************
	
	* v.0.4.           <30Sep2013>  <Andres Castaneda>
	* v.0.3.           <16May2013>  <Andres Castaneda>
	* v.0.2.           <15Mar2013>  <Andres Castaneda>
	* v.0.1.           <08Aug2012>  <Andres Castaneda>
	
		