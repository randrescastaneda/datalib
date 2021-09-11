*! v.0.1.           <Oct2013>  <Andres Castaneda>


program define datalib_displaylablac, rclass

	syntax [anything]							///
		[if/] [in],		                      	///
		COUNtry(string)							///
		TYPEdta(string)							///
		[										///
		PROject(string)							///
		save									///
		]

preserve 
qui {

cap which varlocal
if _rc ssc install varlocal

* =========================================START==========================================
		* ======================= 1. Globals for each country ==============	 *
* ========================================================================================





if ("`country'" == "arg") local countryname "Argentina"
if ("`country'" == "bol") local countryname "Bolivia"
if ("`country'" == "bra") local countryname "Brazil"
if ("`country'" == "chl") local countryname "Chile"
if ("`country'" == "col") local countryname "Colombia"
if ("`country'" == "cri") local countryname `""Costa Rica""'
if ("`country'" == "dom") local countryname `""Dominican Republic""'
if ("`country'" == "ecu") local countryname "Ecuador"
if ("`country'" == "slv") local countryname `""El Salvador""'
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

* if all countries are selected
if ("`country'" == "all") {
	local countryname: dir "${rootdatalib}/lablac" dirs "*"
}

local paiss `"`countryname'"'

* =========================================START==========================================
		* ======================= 2. Check for Errors ==============	 *
* ========================================================================================


	tempname t
	tempfile table
	postfile `t' str3 country str20 pais str10 year str10 period str10 survey ///
		str10 type str4 Project str4 MastVersion str4 AltVersion str6 file using `table', replace

foreach pais of local paiss {
	if (substr("`pais'",1,1) == "_") continue		//	if local pais starts with "_"

	* Find subfolders on Country directory
	local dir1 "${rootdatalib}/lablac/`country'"  // country dir

	local folders1: dir "`dir1'" dirs "*"	// Years Surveys folders
	
	local folders ""
	foreach f of local folders1 {
		if regexm("`f'","^_") != 1 local folders `"`folders' "`f'" "'
	}
	
	foreach folder of local folders {  // folder like ARG_2006_EPHC
		**local folder = lower("`folder'")
		lstrfun year, regexms(`"`folder'"', "^.*[_]([0-9]+-?[0-9]+)",1)
		local year: subinstr local year "-" "&"
		lstrfun survey, 	regexms(`"`folder'"',  "^.*_([a-zA-Z]+-?[a-zA-Z]+)$",1)
		

		/* ====================
		procedure for _BLAB
		==================== */
		local subfolders: dir "`dir1'/`folder'" dirs "*blab"
		local type "blab"
		if (`"`subfolders'"' == `""') {
			local mv = "01"
			post `t' ("`country'") ("`pais'") (`"`year'`period'"') (`"`period'"') ("`survey'") ///
				("`type'") (".") ("`mv'") (".") ("NO")
		} 

		else {
			foreach subfolder of local subfolders {		// folders like arg_2006_s1_ephc_v01_m_base
				lstrfun mv, regexms("`subfolder'", "^.*_[vV]([0-9][0-9])_[mM]",1)	// master version
				lstrfun period, regexms("`subfolder'", "(^`country'_`year')([_]?[a-zA-Z]?[0-9]?[0-9]?)(_.*)",2) 	// period
				cap confirm file "`dir1'/`folder'/`subfolder'/data/`subfolder'.dta"
				if (_rc == 0) local exist "YES"
				else local exist "NO"
				post `t' ("`country'") ("`pais'") (`"`year'`period'"') (`"`period'"') ("`survey'") ///
					("`type'") (".") ("`mv'") (".") ("`exist'")
			}
		}	//  end of else
		
		/* ======================
		procedure for _lablac*
		====================== */
		local subfolders: dir "`dir1'/`folder'" dirs "*lablac*"
		foreach subfolder of local subfolders {
			lstrfun pr, regexms("`subfolder'", "^.*_([0-9][0-9])$", 1)			// project version
			lstrfun mv, regexms("`subfolder'", "^.*_[vV]([0-9][0-9])_[mM]",1)	// master version 
			lstrfun av, regexms("`subfolder'", "^.*[vV]`mv'_[mM]_[vV]([0-9][0-9])_[aA]",1)		//	alternative ver
			lstrfun period, regexms("`subfolder'", "(^`country'_`year')([_]?[a-zA-Z]?[0-9]?[0-9]?)(_.*)",2)	// period
			
			
			local type "lablac"

			local file:	dir "`dir1'/`folder'/`subfolder'/Data/Harmonized" files "*_`type'_`pr'.dta"
			if (`"`file'"' == "") local exist "NO"
			else local exist "YES"
			post `t' ("`country'") ("`pais'") (`"`year'`period'"') (`"`period'"') ("`survey'") ("`type'") ("`pr'") ("`mv'") ("`av'") ("`exist'")

		}		// end of subfolder loop in lablac section
		
	}	// end of folder loop
} 		// end of countries loop  'paiss'
	postclose `t'
	use `table', clear
	

	gen ys = year + " --> " + surve

	/* replace Project = "Project " + Project + ":"
	replace MastVersion = "Mast " + MastVersion 
	replace AltVersion  = "Alt " + AltVersion */
	gen CompVer = MastVersion + " & " + AltVersion 
	
	label var Project "lablac Project"
	label var CompVer "Master Version & Alternative version,"
	label var MastVersion "Master Version"
	label var AltVersion "Alternative Version"
	label var survey "Acronym of original survey"
	label var type "Type of lablac data"
	label var ys "Year-->Survey"
	** save table, replace
	
	** return values
	
	levelsof year if file == "YES", loc(years)
	return local years "`years'"
	
	varlocal year  survey type
	return local yearsvar `r(year)'
	return local surveysvar `r(survey)'
	return local typevar `r(type)'
	
	if ("`save'" == "save") {
		save info_`country', replace
	}
} // End of qui brakes

if ("`country'" != "all") {
	if ("`typedta'" == "blab") {
		dis as text "{hline}" 
		noi dis as text `"{p 4 4 2}{cmd:Inventory of "_base" databases for :}"' in y " `pais'" as text `" {p_end}"'
		tabdisp ys MastVersion if (type == "blab" ), cell(file) center
		dis as text "{hline}"
	}
	if ("`typedta'" == "lablac") {
		dis as text "{hline}" 
		noi dis as text `"{p 4 4 2}{cmd:Inventory of "_lablac`project'" and "_cedlas`project'" databases for :}"' in y "`pais'" as text `" {p_end}"'
		tabdisp ys type CompVer if (type != "base" & Project == "`project'"), cell(file) center
		dis as text "{hline}"
	}
}

* Procedure fol all countries of LAC
qui else {
	replace year = "2004" if year == "2003&2004"
	destring year, force replace
	gen uno = 1
	encode file, gen(yesno)
	collapse (max) yesno (sum) uno, by(pais year survey type Project)
	ren pais country

	label define yesno 1 NO 2 YES, modify
	label values yesno yesno

	* default countries
	gen default = 1
	replace default = 0 if country == "argentina"	& year == 2003 & survey != "ephc"
	replace default = 0 if country == "colombia"	& inlist( year, 2000, 2003) & survey != "ech"
	replace default = 0 if country == "ecuador"		& year == 2006 & survey != "enemdu"
	replace default = 0 if country == "ecuador"		& inlist( year,1995, 1998) & survey != "eped"
	replace default = 0 if country == "honduras"	& year == 2004 & survey != "ephpm"
	replace default = 0 if country == "peru"		& year == 2003 & survey != "enaho"
		
	if ("`if'" == "") local if "year >= 2000"
	
	if ("`typedta'" == "base") {
		dis as text "{hline}" 
		noi dis as text `"{p 4 4 2}{cmd:Inventory of "_base" databases if `if' for :}"' in y "LAC countries" as text `" {p_end}"'
		noi tabdisp country year if ( `if' & type == "base" & default == 1), cell(yesno) cellw(5)
		dis as text "{hline}"
	}
	else {
		dis as text "{hline}" 
		noi dis as text `"{p 4 4 2}{cmd:Inventory of "_`typedta'`project'" databases if `if' for :}"' in y "LAC countries" as text `" {p_end}"'
		noi tabdisp country year if ( `if' & type == "`typedta'" & default == 1 & Project == "`project'"), cell(yesno) cellw(5)
		dis as text "{hline}"
	}
}			// end of all countries condition (else)


restore 
end

exit

*Notes
tabdisp ys MastVersion if type == "base", cell(file)




