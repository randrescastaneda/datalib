*!v 5.0		  <10mar2018>		<Andres Castaneda>
* incorporate SEDLAC-03 and LABLAC in one single routine

program define datalib, rclass
version 11

syntax [anything(name=lookup)]				///
[if] [in],		                 	    ///
[                                   ///
COUNtry(string)			     				    ///
Years(numlist)			     				    ///
CIRca(numlist)			     				    ///
SURvey(passthru)		     				    ///
PERiod(passthru)		     				    ///
NATure(string)			     				    ///
Type(string)							          ///
path(string)							          ///
APPEND 		  							          ///
prefix(passthru)						        ///
sufix(passthru)							        ///
filename(passthru)						      ///
info									              ///
CLEAR noPPP REPLACE						      ///
INCppp(passthru) PLppp(passthru)		///
CPIppp(passthru)						        ///
PPPyear(passthru)									  ///
VERMast(passthru)						        ///
VERAlt(passthru)						        ///
PROject(passthru)						        ///
vars(passthru)							        ///  option to specify variables
MODules(passthru)  					        ///  option to specify variables in combo
IGNOREerror								          ///
LANGuage(passthru)						      ///  option for changing languages
condition1(passthru)					      ///
condition2(passthru)					      ///
condition3(passthru)					      ///
VINtage(string)							        ///
REPOsitory(string)						      /// create, use, query or erase repository file
altpath(string)							        /// Alternative directory path
noCOHH     						              ///
merge									              ///
retlist									            /// return vintage of survey (does not load dta)
clean									              /// internal use only
usecpi			 						            /// internal use only
keepusing(passthru)	*		 	          /// internal use only
]

* =========================================================
* ============================ 0.Program set up ===========
* =========================================================

* Root to dataset archive

if ("${rootdatalib}" == "") {
	cap confirm file "U:\Datalib\_ado\stata.toc"
	if (_rc == 0) {
		shell net use /del U:
	}
	
	global rootdatalib "\\GPVDRLAC\datalibpub\Datalib"
}
if ("`altpath'" != "") global rootdatalib  "`altpath'"

* requires command lstrfun by (ssc install lstrfun) 
cap which lstrfun 
if _rc ssc install lstrfun


* check user permission 
datalib_usercheck
local user = "`r(user)'"
if ("${rootdatalib}" != "S:\Datalib") {
	if ("${datalibstopbox}" != "check") {
		cap window stopbox rusure "Dear `user'," ///
		"This is a kind reminder that you are not allowed to save Datalib data on your computer or any other drive. We keep track of Datatalib users." ///
		"Remember: the command -datalib- must be used instead of command -use- in order to load Datalib databases" ///
		"Click on Yes if you agree with these conditions."
		if (_rc == 1) {
			disp in red "Conditions of use must be accepted in order to use Datalib micro-data"
			error
		}
		global datalibstopbox "check" 
	}
}

/* Check datalib version
* di date("$S_DATE", "DMY")
datalib_checkversion 21265, user("`user'")
if (`r(checkversion)' == 1 ) {
clear programs
clear ado
exit
}
*/

** Definition of source

* 1.1 type
if ("`type'" != "" & "`lookup'" != "") {
	disp as error "You have to specify the type of the data either through the option 'type' or prompt it after the word datalib"
	error 198
}

if ("`type'" == "" & "`lookup'" != "") local type "`lookup'" 
if ("`type'" == "") local type "sedlac"

local type = lower("`type'")


if inlist("`type'", "sedlac", "base") {
	local source "sedlac"
	local trimestre ""
}
else {
	local source "lablac"
	local trimestre "trimestre"
}


** use CPI database
if ("`usecpi'" == "usecpi") {
	use "${rootdatalib}/`source'/ipc_`source'_wb.dta", `clear'
	exit
}


* Vintage option

if ("`vintage'" != "") {
	local vintage = lower("`vintage'")
	lstrfun country, regexms(`"`vintage'"', `"(^[a-z]+)_*"', 1)	
	lstrfun years,   regexms(`"`vintage'"', `"(^[a-z]+_)([0-9]+)_*"', 2)
	lstrfun period,  regexms(`"`vintage'"', `"(^[a-z]+_[0-9]+)[_]?([a-zA-Z]?[0-9]?[0-9]?)(_.*)"', 2)	
	lstrfun survey,  regexms(`"`vintage'"', `"(^.*)_([a-z]+[-]?[a-z]+)_v0[1-9]_m(.*)"', 2)	
	lstrfun vermast, regexms(`"`vintage'"', `"(^.*)_v(0[1-9])_m(.*)"', 2)	
	lstrfun veralt,  regexms(`"`vintage'"', `"(^.*)m_v(0[1-9])_a(.*)"', 2)	
	lstrfun type,    regexms(`"`vintage'"', `"(^.*)_([a-z]+)([_]?[0-9]?[0-9]?)$"', 2)	
	lstrfun project, regexms(`"`vintage'"', `"(^.*)_([0-9]+$)"', 2)	
	
	* create locals
	local period "period(`period')"
	local survey "survey(`survey')"
	local vermast "vermast(`vermast')"
	local veralt "veralt(`veralt')"
	local project "project(`project')"
	
	local vintage ""		// delete local for other options
	
}

* check country and year when option info specified

if ("`info'" == "info" & "`years'" != "" & "`country'" != "") {
	disp as err "you should specify either years or country with option info"
	error
}

* In case country is nos specified. 
if ("`country'" == "" & "`repository'"=="" & ("`info'" == "" | ("`info'" == "info" & "`years'" == ""))) {
	noi disp in y  _n "{title:Type country code}" 			///
	_n "" 											///
	_n "{ul:Latin American Countries}" 				///
	_n "" 											///
	_n "{ul:NAME}"           _col(24) "{ul:CODE}" 	///
	_n "Argentina "          _col(22) "-- arg" 		///
	_n "Bolivia "            _col(22) "-- bol" 		///
	_n "Brazil "             _col(22) "-- bra" 		///
	_n "Chile "              _col(22) "-- chl" 		///
	_n "Colombia "           _col(22) "-- col"  	///
	_n "Costa Rica "         _col(22) "-- cri" 		///
	_n "Dominican Republic " _col(22) "-- dom" 		///
	_n "Ecuador  "           _col(22) "-- ecu" 		///
	_n "El Salvador "        _col(22) "-- slv"  	///
	_n "Guatemala "          _col(22) "-- gtm"  	///
	_n "Honduras "           _col(22) "-- hnd"  	///
	_n "Mexico "             _col(22) "-- mex" 	 	///
	_n "Nicaragua "          _col(22) "-- nic"  	///
	_n "Panama "             _col(22) "-- pan"  	///
	_n "Paraguay "           _col(22) "-- pry"  	///
	_n "Peru "               _col(22) "-- per"  	///
	_n "Uruguay "            _col(22) "-- ury"  	///
	_n "LAC "                _col(22) "-- lac"  	///
	_n "" 							 				///
	_n "{ul:Caribbean Countries}" 	 				///
	_n "" 											///
	_n "{ul:NAME}" _col(24) "{ul:CODE}" 			///
	_n "Bahamas "  _col(22) "-- bhs" 				///
	_n "Belize "   _col(22) "-- blz"				///
	_n "Guyana "   _col(22) "-- guy"				///
	_n "Haiti "    _col(22) "-- hti"				///
	_n "Jamaica "  _col(22) "-- jam"				///
	_n "Suriname " _col(22) "-- sur"				///
	_n "" 							 				///
	_request(_country)
	
	if ("`country'" == "") {
		disp in red "You must select a country of analysis"
		error
	}
	
}

* ==========================================================
* ===============================1.ERROR Messages=========== 
* ==========================================================

*1.2 Nature

* more than one natures
if ( wordcount("`nature'") >= 2) {
	noi di as err "you must specify either household or labor data sets"
	error 197
}

* defaults
if ( "`nature'" == "") local nature "household"
if (inlist("`type'","sedlac","base")) local nature "household"
if (inlist("`type'","lablac","blab")) local nature "labor"
return local nature `nature'

if ("`type'" == "cedlas") {
	local  lsep 40
	noi disp in red "option {it:type(cedlas)} is not available any more." _n ///
	"It has been replaced by option {it:modules(all)}. " _n(2)               ///
	"{error}The following syntax has changed:" _n(2)                         ///
	"{result}{col `=round(`lsep'/2)'}Old syntax{text}{col `lsep'}{c |}"      ///
	"{result}{col 55}New syntax" _n                                          ///
	"{text}{hline `=`lsep'-1'}{c +}{hline `lsep'}"  _n                       ///
	"{result}{col 4}{it:datalib, type(sedlac)}{text}{col `lsep'}{c |}"       ///
	"{result}{col `=`lsep'+4'}{it:datalib, module(sedlac)}" _n               ///
	"{result}{col 4}{it:datalib, type(cedlas)}{text}{col `lsep'}{c |}"       ///
	"{result}{col `=`lsep'+4'}{it:datalib, module(all)}" 
	error 197
}

if !inlist("`type'","sedlac","base","lablac","blab") {
	noi disp in red "option type must be {ul:sedlac}, {ul:base}, " ///
	"{ul:lablac}, or {ul:blab}" 
	error 197
}

* Nature not existing
if ( "`nature'" != "household" & "`nature'" != "labor" ) {
	noi di as err "you must specify either household or labor data sets"
	error 197
}


* Display info
if ( "`info'" != "" &  "`clear'" == "clear" ) {
	di as error "You cannot specify clear with the info option"
	error 198
}



* =============================================================
* ====================2. Run sub-programs======================
* =============================================================


* ======================= Globals for each country ==============	 *

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
if ("`country'" == "lac") local countryname "lac"

local pais lower(`"`countryname'"')


/*===========================================================================
2.1 Info option									
===========================================================================*/

if ( "`info'" == "info") {
	
	if ((wordcount("`years'") > 1 | substr("`years'",5,1) == "/" )) {
		disp as error "You cannot select more than one year when using 'merge' option"
		error
	}
	
	datalib_info, country(`country') year(`years') type(`type')
	return add
	exit 		// exit datalib ado
}

/*===========================================================================
2.2 Repository Option								
===========================================================================*/


if ( "`repository'" != "" ) {
	
	local nword: word count `repository' 								// number of words on repository local
	if regexm(`"`repository'"', `"^([a-z]+)"') local repoins = regexs(1)	
	if regexm(`"`repository'"', `"^([a-z]+) ([a-zA-Z0-9_\-]+)"')  ///
	local reponame = regexs(2) 
	
	if (`nword' == 3 & regexm(`"`repository'"', `"([a-z]+)$"')) ///
	local repopt = regexs(1)
	else local repopt ""
	
	local country = upper("`country'")
	* Create repository
	if ( "`repoins'" == "create") {
		datalib_repository , country(`country') years(`years') reponame(`reponame') ///
		circa(`circa') `survey' `period' type(`type') `repopt'     ///
		`clear' `ppp' `incppp' `plppp' `cpippp' `vermast' `veralt' ///
		`project' `cohh' path(`path') `vars' `pppyear' `modules'
		exit
	}
	
	* repository directory for all other instructions
	if ("`path'" == "" ) local reporoot "C:\ado\personal\Datalib_repository"
	else local reporoot "`path'"
	
	* Use repository
	if ( "`repoins'" == "use") {
		local repocheck = 0
		qui include "`reporoot'/repo_`reponame'.do"
		if (`repocheck' == 0 ) {
			disp as error "repo-file `reponame' does not contain info for `country' - `years'"
			error
		}
	}
	
	* display name of repositories stored
	if ( "`repoins'" == "query") {
		local repos: dir "`reporoot'" files "repo_*.do"
		
		disp in y "{title:Query of repository files}" _n
		local nrepo = 0
		foreach repo of local repos {
			local ++nrepo
			local repo: subinstr local repo "repo_" "", all
			local repo: subinstr local repo ".do" "", all
			disp in y "`nrepo'." _col(4) "`repo'"
			
		}	// end of loop by repo files
		exit 	// exit datalib ado
	}		// end of query option in repository
	
	* delete repository
	if ( "`repoins'" == "erase") {
		if ("`repopt'" != "force") {
			disp as err "you must specify force to delete a repository file"
			error
		}
		cap confirm new file "`reporoot'/repo_`reponame'.do"
		if (_rc) {
			erase "`reporoot'/repo_`reponame'.do"
			
			cap confirm file "`reporoot'/repo_`reponame'.do"
			if (_rc) {
				disp in g "Repository file `reponame' has been erased"
			}
		} 		 // end of confirmation of existence of file
		else {
			disp in red "Repository file `reponame' does not exist" _cont
			disp "{stata datalib, repository(query): Check here}"
			exit 		// exit datalib ado. 
		}				// end of alternative when file does not exist
		exit 			// exit datalib ado. 
	}
	if (!inlist("`repoins'","create", "query", "use" ,"erase")) {
		disp in red "the first word in repository option must be create, query, use o erase."
		error
	}
}		// end of repository option. 


/*===========================================================================
2.3 run SEDLAC or LABLAC procedure								
===========================================================================*/

if inlist("`source'", "sedlac", "lablac" ) {
	datalib_cedlas  `if' `in', country(`country') years(`years') circa(`circa') ///
	`survey' `period' nature(`nature') type(`type') path(`path') `append' `save'  ///
	`prefix' `sufix' `filename' `clear' `ppp' `replace' `incppp' `plppp' `cpippp' ///
	`condition1' `condition2' `condition3' `vermast' `veralt' `vintage' `project' ///
	`ignoreerror' `cohh' `clean' `retlist' `language' `vars' `pppyear' `modules' ///
	`period' `options'
	return add
}





end

exit 

*


*********************************************************************
Notes:
WE HAVE ADDED LABLAC!!! Additionally i) Add LAC as a new country. (bins) ii) Add option year(year) in info option. iii) Bolivia 2003-2004 is not longer available throughout 2003, only throughout 2004. iv) Add option vars v) Fix bugs


v 4.2		  <29Jan2018>		<Andres Castaneda>
incorporate SEDLAC-03
New structure of SEDLAC-02
fix optoin vars
fix language cedlas

v 4		  <04Jan2018>		<Andres Castaneda>
incorporate SEDLAC-03
New structure of SEDLAC-02


History of the file
v 3.1		<12Jun2017>		<Andres Castaneda>
test sedlac-03
new languages
modules option 
New Structure

v 2.3		<05may2017>		<Andres Castaneda>
test sedlac-03
new languages
combovar option


v 2.2		<28mar2017>		<Andres Castaneda>
Fix bugs and add PPPyear option

v 2.1.1		<04Aug2015>		<Andres Castaneda And Daniel Valderrama>
Fix bugs 

v 2.1		<28Apr2015>		<Andres Castaneda And Daniel Valderrama>
We have added LABLAC !
Add LAC as a new country. (bins)
Add option years in info
Bolivia 2003-2004 is not longer available throughout 2003, only throughout 2004. 
Fix bugs
Add vars option
altpath added 
we have added metadata for SEDLAC 


v 2.0	<02Apr2015>		<Andres Castaneda And Daniel Valderrama>
We have added LABLAC !
Add LAC as a new country. (bins)
Add option years in info
Bolivia 2003-2004 is not longer available throughout 2003, only throughout 2004. 
Fix bugs
Add vars option
altpath added 

v 1.2	<01Oct2014>		<Andres Castaneda>
Add languages PT, EN, ES
Fix merge option
Improve selection of databases
Add option vars


v 1.1.1	<12May2014>		<Andres Castaneda>

v 1.0.1		<05Dic2013>		<Andres Castaneda>
Crash small bug on merge option

v 1.0.0		<04Dic2013>		<Andres Castaneda>
Update option Repository to allow circa years and type == base

v 0.12.3		<02Dic2013>		<Andres Castaneda>
Fix merge option: one file only with all the information

v 0.12.2		<22Nov2013>		<Andres Castaneda>
Add all countries in info option
Add stop box for no LCSPP users
delete save option

v 0.12.1		<13Nov2013>		<Andres Castaneda>
Add path option to repository option

v 0.12		<30Oct2013>		<Andres Castaneda>
Create repository option

v 0.11.1		<25Oct2013>		<Andres Castaneda>
Change info option to a click interface
add documentation information

v 0.11		<30Sep2013>		<Andres Castaneda>
Change dta "base" structure
add merge option


v 0.10.0		<30Sep2013>		<Andres Castaneda>
Change algorithm to optimize data identification
Eliminate Vintage option

v 0.9.3		<13Sep2013>		<Andres Castaneda>
Add clean option

v 0.9.2		<16May2013>		<Andres Castaneda>
Add "nocohh" function -> now by default datalib will bring up databases iwth the condition keep if cohh == 1. If "nocohh" is specified all the dateset will be loaded. 
If no alternative or master version is requested, datalib will bring latest survey using the APPEND option as well. 


v 0.9.1		<19mar2013>		<Andres Castaneda>
remove display option
Create info option

v 0.9		<19Feb2013>		<Andres Castaneda>
rename all files with the new sintax
option project added 

v 0.8.3		<19Feb2013>		<Andres Castaneda>
Small changes on display and add 2011 countries
Fix small bugs regarding the SEDLAC version 02

v 0.8.0		<22Nov2012>		<Andres Castaneda>
Create root to new S drive
new routine for default values or versions (-datalib- is going to take the last version always)

v 0.7.3		<26Sep2012>		<Andres Castaneda>
Fix Bolivia 2003-2004
v 0.7.2		<10Sep2012>		<Andres Castaneda>
Include Arg, Col, Ecu, Gtm, hnd and Ven data bases for 2011
v 0.7.1		<04Sep2012>		<Andres Castaneda>
fix Bugs
v 0.7.0		<21Aug2012>		<Andres Castaneda>
Fix bug of csv file
make -datalib- modular (create _sedlac ado file)
add circa option
fix local for years so if a requested year is not in the Datalib folder -datalib- will skip it and wont generate error
fix display option
fix ignore option
change some error messages
v 0.6.1		<08Aug2012>		<Andres Castaneda>
Create ignoreerror option
fix local years when it is set as 9999
create return list for vintage
v 0.6		<09Jul2012>		<Andres Castaneda>
create options masterversion, alternativeversion and vintage
complete help file
change examples in help file in order to make them faster. 
Fix all the bugs about two surveys in the same year.
create the global for macros of the countries
create the module (not working yet) for LABLAC
Change CHI for CHL in folders of chile
v 0.5.10		<06Jun2012>		<Gabriel Facchini>
Fix cpi default option for Argentina. Corrects version v 0.5.9. Default variable now is ipc_sedlac.

v 0.5.9		<06Jun2012>		<Gabriel Facchini>
Fix cpi default option for Argentina. Corrects version v 0.5.6

v 0.5.8		<01jun2012>		<Gabriel Facchini>
Deleted Venezuela 1996 as an option since it doesn't exist in SEDLAC

v 0.5.7		<01jun2012>		<Joao Pedro Azevedo>
Change default saving path to "c:\data\"

v 0.5.6		<31May2012>		<Gabriel Facchini>
Create default alternate cpi for Argentina when not specified.

v 0.5.5		<31May2012>		<Viviane Sanfelice>
add Mex 2005 and Nic 2009

v 0.5.4		<29May2012>		<Viviane Sanfelice & Andres Castaneda>
apply "conversion" variable to the aggregate of incomes in ppp. This allows to control for devaluations/dollarizations.

v 0.5.3		<25May2012>		<Gabriel Facchini>
Add "conversion" variable when merging with prices dataset. This allows to control for devaluations/dollarizations.

v 0.5.2		<24May2012>		<Andres Castaneda>
drop variable _merge if it exits in original data base

v 0.5.1		<26Apr2012>		<Gabriel Facchini>
Create local with root to datasets archive "Z:/public/Datalib"
Erase microdata folder path displaying

v 0.5		<26Apr2012>		<Joao Pedro Azevedo>
Change default saving path to "Z:\Datalib_tmp\"
Add metadata on the surveys (_metadata.ado)

v 0.4      <24Apr2012>   <Andres Castaneda>
Changes in the whole structure of datalib: Now it is shorter and faster
Change default path to "Z:\Datalib_Temporal"
Fix bug of saving twice the same database with different names
Add filename option in order to give a name to any appended database that is requested to be saved
Add replace option to prevent overwritings
Correct the misspellings of the help file with the help of Anne Pillay
Fix all the examples in the help file that were not working before


v 0.3.2    <10Apr2012>   <Gabriel Facchini>
add Gtm 2011

v 0.3.1    <04Apr2012>   <Joao Pedro Azevedo>
changes in the help file
changes in the pkg file

v 0.3      <03Apr2012>   <Andres Castaneda>
include Per 2010, Hnd 2010, Arg s1 2011
add info option
fix CPI data base
add cpippp option
Debug version 0.2

v 0.2      <23mar2012>   <Andres Castaneda>
merge with CPI database
compute selected poverty lines
compute selected income variables
Change to verion 11

v 0.1      <08mar2012>   <Joao Pedro Azevedo>
create log of requests

v 0.0      <01mar2012>   <Andres Castaneda, Gabriel Facchini, Viviance Sanfelicce, Joao Pedro Azevedo>



di date("$S_DATE", "DMY")






















/*===========================================================================
2.4 procedure to merge SEDLAC and BASE						
===========================================================================*/

if ("`merge'" == "merge" & "`nature'" == "household" ) {
	tempfile basef
	
	if ((wordcount("`years'") > 1 | substr("`years'",5,1) == "/" )) {
		disp as error "You cannot select more than one year when using 'merge' option"
		error
	}
	
	qui datalib_sedlac  `if' `in', country(`country') years(`years') circa(`circa') ///
	`survey' `period' nature(`nature') type(sedlac) path(`path') `clear' `vermast' ///
	`veralt' `vintage' `project' retlist  `options' `modules'
	
	* Set locals for data information
	local veralt_p   = r(veralt)
	local vermast_p  = r(vermast)
	local project_p  = r(project)
	local surveys    = r(surveys)
	local acronym    = r(acronym)
	local name       =  r(country) 
	local type       = r(type)
	local nature     = r(nature)
	local year       = r(years)
	local survname   = r(survname)
	local surveyid   = r(surveyid)
	
	cap local per = "_"+r(period)
	if _rc local per ""
	local vintages = r(vintage)
	local vintages: subinstr local vintages  "," " ", all
	
	local sort "id com"
	foreach vintage of local vintages {
		qui describe using "${rootdatalib}/sedlac/`country'/`country'_`year'_`survname'/`surveyid'/Data/Harmonized/`vintage'.dta",  varlist
		local vars_sedlac "`vars_sedlac' `r(varlist)'"
	}
	* Local with SEDLAC variables (to rename in case appear in _BASE)
	local vars_sedlac : list vars_sedlac - sort
	
	
	global vintage "`surveyid'"
	
	* set trace on 
	run "C:\ado\personal\Datalib-dofiles_sedlac/datalib_mergesedlac.do" // load base
	hhh
	* set trace off
	global vintage ""
	
	* Drop _merge variable if present
	capture drop _merge
	
	capture confirm variable componente, exact
	if (_rc == 0) ren componente com
	
	* Confirm existence with the same name
	foreach name of local vars_sedlac  {
		capture confirm variable `name', exact
		if (_rc == 0) ren `name' `name'_original
	}
	
	qui save `basef', replace
	datalib_sedlac  `if' `in', country(`country') years(`years') ///
	circa(`circa') `survey' `period' nature(`nature') type(sedlac) path(`path') ///
	`clear' `ppp' `replace' `incppp' `plppp' `cpippp' `vermast' `veralt' ///
	`project' `ignoreerror' nocohh `clean' `language' `vars' `pppyear' `modules' `options'
	
	capture confirm variable componente, exact
	if (_rc == 0) ren componente com
	
	* Sort id component to merge for the case of Argentina
	qui {
		
		* Confirm existence with the same name with SEDLAC
		foreach name in ano pais encuesta tipo  {
			capture confirm variable `name', exact
			if (_rc == 0) ren `name' `name'_sedlac
		}
		
		merge 1:1 id com using `basef', `keepusing'
		
		* Tabulate merge
		tab _merge
		local merge = r(r)
		return scalar merge = r(r)
	} // end of qui 
	
	noi {
		if `merge' == 1 {
			di in y  "Perfect match on merge" 
			drop _merge
		}
		else disp "mismatch on merge. Check by typing" `"{stata tab _merge: tab _merge}"'
	} 		// end of noi 
}

/*===========================================================================
run LABLAC procedure						
===========================================================================*/

if ( "`nature'" == "labor" ) {
	datalib_lablac `if' `in', country(`country') years(`years') circa(`circa') ///
	`survey' `period' type(`type') path(`path') `append' `save'  ///
	`prefix' `sufix' `filename' `clear' `ppp' `replace' `incppp' `plppp' `cpippp' ///
	`condition1' `condition2' `condition3' `vermast' `veralt' `vintage' `project' ///
	`ignoreerror' `cohh' `clean' `retlist' `language' `vars' `pppyear' `modules'
	return add
} 

* ============================================================================