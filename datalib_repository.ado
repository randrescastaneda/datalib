*! version 0.2 Andres Castaneda Dic2013
*===================================================================*
* WORLD BANK - LCSPP						 
* PROYECT: Datalib repository, create program
*-------------------------------------------------------------------*						   
* Author: Andres Castaneda 
* Update: Jan/2014						    
*===================================================================*

cap program drop datalib_repository
program define datalib_repository, rclass

	syntax [anything]								///
		[if] [in],		                	      	///
		COUNtry(passthru)							///
		reponame(string)							///
		[											///
		Years(passthru)								///
		CIRca(passthru)								///
		SURvey(passthru)							///
		PERiod(string)							///
		Type(string)								///
		noPPP replace append						///
		INCppp(passthru) PLppp(passthru)			///
		CPIppp(passthru)							///
		VERMast(passthru)							///
		VERAlt(passthru)							///
		PROject(passthru)							///
		path(string)								///
		noCOHH										  ///
		retlist										  ///
		clean										    /// internal use only
		vars(string)						    ///  option to specify variables
		modules(passthru)             ///
		]

qui {
	
	
/*===================================================================================
							0 : Set locals
=====================================================================================*/
	if ("`years'" == "" & "`circa'" == "") {
		disp as error "you must specify either year or circa option"
		error
	}
	local root "C:\ado\personal\Datalib_repository"

	cap mkdir "C:\ado\personal"
	cap mkdir "`root'"
	
	if ("`path'" != "") local root "`path'"
	
	* errors
	if (wordcount("`years'") > 1 | substr("`years'",5,1) == "/" ) {
		noi disp as error "You cannot select more than one year using 'repository' optionccc"
		error
		continue, break
	}
	if (wordcount("`period'") > 1 | "`period'"=="all") {
		noi disp as error "You cannot select more than one quarter using 'repository' option"
		error
		continue, break
	}

	datalib, `country' `years' `circa' `survey' period(`period')   ///
	type(`type') `append' `replace' `clear' `ppp' `incppp' `plppp' ///
	`cpippp' `vermast' `veralt' `project' `cohh' retlist `modules'

		* Set locals for data information
		local year        = r(years)
		local isoname     = r(countrycode)
		local veralt_p 	  = r(veralt)
		local vermast_p   = r(vermast)
		local project_p   = r(project)
		local surveys	    = r(surveys)
		local cname		    = r(country) 
		local type 		    = r(type)
		local modules_p   = r(modules)
		local nature 	    = r(nature)
		local survey      = r(survname)
		local vintage     = "`r(surveyid)'"
		cap local per     = "`r(period)'"
		if _rc local per ""
		
		* Conditions if Circa is seletec
		if ("`circa'" != "") {
			local circa = r(circa)
			local condcirca `" | "LLQcircaRRQ" == "`circa'" "'
		}
		else local condcirca ""
		local type = lower("`type'")
		* Conditions if base is selected
		if ("`type'" == "BASE") {
			local veralt_p  ""
			local project_p ""
			local condbase `" "LLQtypeRRQ" == "base" & "'
		}
		else if ("`type'" == "BLAB") {
			local veralt_p  ""
			local project_p ""
			local condbase `" "LLQtypeRRQ" == "blab" & "'
		}
		else if ("`type'" == "LABLAC") {
			local condbase `" "LLQtypeRRQ" == "lablac" & "'
		}
		else  {
			local condbase `" ("LLQtypeRRQ" == "sedlac" | "LLQtypeRRQ" == "") & "'
		}
		

/*===================================================================================
							1 : Do-file
=====================================================================================*/
		
	*confirm file "`root'/pru.do"

	tempfile temp1 temp2
	tempname t1 t2

	cap confirm file "`root'/repo_`reponame'.do"
	if (_rc == 0) copy "`root'/repo_`reponame'.do" `temp1', replace		// if file exists 

	* open file to write
	cap file open `t1' using "`temp1'", write `replace' `append'		// open temp file (new or old file)
	if (_rc) {
		disp in red "you are about to modify repository file that already exists. type replace or append"
		error
	}

	* Start writing
	file write `t1' `""' _n
	file write `t1' `"if ("LLQcountryRRQ" == "`isoname'" & `condbase' ("LLQyearsRRQ" == "`year'" `condcirca')) { "' _n
	file write `t1' `"	local years "`year'" "' _n
	file write `t1' `"	local circa "" "' _n
	file write `t1' `"	local veralt "veralt(`veralt_p')" "' _n
	file write `t1' `"	local vermast "vermast(`vermast_p')" "' _n
	file write `t1' `"	local project "project(`project_p')" "' _n
	file write `t1' `"	local survey "survey(`survey')" "' _n		// is a passthru option
	file write `t1' `"	local type "`type'" "' _n
	* file write `t1' `"	local modules "modules(`modules_p')" "' _n
	file write `t1' `"	local period "period(`per')" "' _n
	file write `t1' `"	local vars "vars(`vars')" "' _n
	file write `t1' `"	local ppp "`ppp'" "' _n
	file write `t1' `"	local incppp "`incppp'" "' _n
	file write `t1' `"	local plppp "`plppp'" "' _n
	file write `t1' `"	local cpippp "`cpippp'" "' _n
	file write `t1' `"	local cohh "`cohh'" "' _n
	file write `t1' `"	local repocheck = 1 "' _n
	* file write `t1' `"	"' _n
	file write `t1' `"}"' _n

	file close `t1' 						//  close file

	* change LLQ and RRQ by left and right single quotes respectively. 
	filefilter `temp1' `temp2', from("LLQ") to("\LQ") replace
	filefilter  `temp2' `temp1', from("RRQ") to("\RQ") replace

	copy `temp1' "`root'/repo_`reponame'.do", replace
	
	
/*===================================================================================
							2 : DTA file
=====================================================================================*/
	
	tempname r
	tempfile repo
	postfile `r' str50(countryname vintage) using `repo', replace
	post `r' ("`cname'") ("`vintage'")
	postclose `r'
	
	use `repo', clear
	compress
	
	gen country = regexs(1) if regexm(vintage, `"(^[A-Z]+)_*"')	
	gen year    = regexs(2) if regexm(vintage, `"(^[A-Z]+_)([0-9]+)_*"')
	gen period  = regexs(1) if regexm(vintage, `"_[A-Z]+\-([A-Z][0-9]+)_v[0-9]+_M"')	
	gen survey  = regexs(1) if regexm(vintage, `"_([A-Z]+)(.*)?_v[0-9]+_M"')	
	gen vermast = regexs(1) if regexm(vintage, `"_v([0-9]+)_M"')	
	gen veralt  = regexs(1) if regexm(vintage, `"_v([0-9]+)_A"')	
	gen type    = regexs(1) if regexm(vintage, `"_([A-Z]+)\-?([0-9]+)?$"')	
	gen project = regexs(2) if regexm(vintage, `"A_([A-Z]+)\-?([0-9]?[0-9]?)"')	
	
	destring year, replace
	cap confirm file "`root'/repo_`reponame'.dta"
	if (_rc == 0) append using "`root'/repo_`reponame'.dta", force
	sort country year veralt 
	save "`root'/repo_`reponame'.dta", replace

} // end of qui 

end

exit


