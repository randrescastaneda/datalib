/*===========================================================================
project:       inventory of SEDLAC databases per year
Author:        Andres Castaneda 
Dependencies:  The World Bank
---------------------------------------------------------------------------
Creation Date:    November 21, 2014 
Modification Date:   
Do-file version:    01
References:          
Output:             Stata display
===========================================================================*/

/*===============================================================================================
                                  0: Program set up
===============================================================================================*/
version 12
drop _all

program define datalib_displayyear, rclass

	syntax [anything]							///
		[if/] [in],		                      	///
		year(string)							///
		[										///
		type(string)							///
		save									///
		]


/*===============================================================================================
                                  1: prepare data
===============================================================================================*/


*------------------------------------1.1: define parameters

qui {
preserve

cap which distinct
if _rc ssc install distinct

if (inlist("`type'", "", "base"))       local type "sedlac"
if (inlist("`type'", "lablac", "blab")) local type "lablac"

local dir "${rootdatalib}/`type'"
local countries: dir "`dir'" dirs "*"

*------------------------------------1.2: analysis per year

tempname tf
tempfile tfile

postfile `tf' str50(countryname vintage yesno) using `tfile', replace


foreach country of local countries {
	if regexm("`country'","^_") continue
	
	local f_cys: dir "`dir'/`country'" dir "*`year'*" // f_cys -> folder country_year_survey
	if (`"`f_cys'"' == "") {
		post `tf' ("`country'") ("") ("NO")
	}
	else {
		local f_cys `f_cys'		//  get rid of double quotes "" obtained in local above. 
		local f_cysv_s: dir "`dir'/`country'/`f_cys'" dirs "*`type'*" // f_cys -> folder country_year_survey_versions...
		
		foreach f_cysv of local f_cysv_s {
			if regexm("`f_cysv'", "^.*_alt$") continue
			post `tf' ("`country'") ("`f_cysv'") ("yes")
		}	//  end of loop for each folder of versions

	}	// end of else
}	// end countries loop 

postclose `tf'

/*===============================================================================================
                                  2: fix data with info
===============================================================================================*/

*------------------------------------2.1: open file

use `tfile', clear
compress

/*country:*/gen country = regexs(1) if regexm(vintage, `"(^[a-z]+)_*"')	
/*year   :*/gen year    = regexs(2) if regexm(vintage, `"(^[a-z]+_)([0-9]+)_*"')
/*period :*/gen period  = regexs(2) if regexm(vintage, `"(^[a-z]+_[0-9]+)[_]?([a-zA-Z]?[0-9]?[0-9]?)(_.*)"')	
/*survey :*/gen survey  = regexs(2) if regexm(vintage, `"(^.*)_([a-z]+[-]?[a-z]+)_v0[1-9]_m(.*)"')	
/*vermast:*/gen vermast = regexs(2) if regexm(vintage, `"(^.*)_v(0[1-9])_m(.*)"')	
/*veralt :*/gen veralt  = regexs(2) if regexm(vintage, `"(^.*)m_v(0[1-9])_a(.*)"')	
/*type   :*/gen type    = regexs(2) if regexm(vintage, `"(^.*)_([a-z]+)([_]?[0-9]?[0-9]?)$"')	
/*project:*/gen project = regexs(2) if regexm(vintage, `"(^.*)_([0-9]+$)([_alt]?)"')	

replace countryname = proper(countryname)
label var countryname "Country Name"

label var veralt "Alternative Version"

distinct country if year == "`year'"
local distinct = r(ndistinct)

*------------------------------------2.2: Display
noi dis as text "{hline}" 
noi dis as text `"{p 4 4 2}{cmd:Inventory of "`type'" databases for:}"' in y " `year'" as text `" {p_end}"'
noi tabdisp countryname veralt, cell(yesno)
noi dis as text `"{p 4 4 2}{cmd:Number of databases:}"' in y " `distinct'" as text `" {p_end}"'
noi dis as text "{hline}"

levelsof country, local(countries)
levelsof countryname, local(countrylist)

levelsof countryname if yesno == "yes", local(countriesyes)
levelsof countryname if yesno == "NO", local(countriesyno)


return local distinct    = `distinct'
return local countries     `"`countries'"'
return local countrylist   `"`countrylist'"' 
return local countriesyes  `"`countriesyes'"' 
return local countriesno   `"`countriesyno'"' 

restore 
} // end of qui

end
exit
/* End of do-file */

><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><

Notes:
1. Example to retrieve local with countries list
		discard
		datalib, year(2009) info
		local countries = `"`r(countrylist)'"'
		foreach c of local countries {
			disp "`c'"
		}

2.
3.


Version Control:


