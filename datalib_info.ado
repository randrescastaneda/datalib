*===================================================================*
* WORLD BANK - LCSPP						 
* PROYECT: Datalib info interface
*-------------------------------------------------------------------*						   
* Author: Andres Castaneda 
* Update: Oct/2013						    
*===================================================================*

/*===============================================================================================
                                  0: Program set up
===============================================================================================*/

cap program drop datalib_info
program define datalib_info, rclass

syntax [anything]							///
	[if] [in],		                      	///
	[										///
	COUNtry(string)							///
	year(string)							///
	type(string)							///
	disp(string)							///
	clear									///
	]

*  Check for errors

if ("`country'" != "" & "`year'" != "") {
	disp as error "You should specify either the option country or the option year"
}

* =========================================START================================================
		* ======================= 1. Globals for each year ==============	 *
* ==============================================================================================
if ("`country'" == "" & "`year'" != "") {
	datalib_displayyear, year(`year') type(`type')
	return add
}	// end of if for years

* =========================================START================================================
		* ======================= 2. Globals for each country ==============	 *
* ==============================================================================================
if ("`country'" != "" & "`year'" == "") {


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


* =========================================START========================================================
			* ======================= 2. Display results ==============	 *
* =========================================================================================================
	
* General information: First Level
if ("`country'" != "all") {
	if ("`disp'" == "") {
		disp in g _dup(100)"_"
		disp in g "{center:{title:Available information for households surveys of `countryname'}}" 
		
		* CPI & PPP values
		disp in y _dup(10)"_"
		disp "{title: CPI & ppp}" _n
		disp `"{stata datalib_infocpi, country(`country'): CPI & PPP}"'

		* Survey inventory
		disp in y _dup(18)"_"
		disp "{title: Survey Inventory}" _n
		disp `"{stata datalib_info, country(`country') disp(sedlac): SEDLAC }"'
		disp `"{stata datalib_info, country(`country') disp(lablac): LABLAC }"'
		
		* Available documentation
		disp in y _dup(24)"_"
		disp "{title: Available Documentation}" _n
		disp `"{stata datalib_infodoc, country(`country') doc(quest): Questionnaires}"'
		disp `"{stata datalib_infodoc, country(`country') doc(tech): Technical documents}"'
		disp `"{stata datalib_infodoc, country(`country') doc(rep): Reports}"'
		disp `"{stata datalib_infodoc, country(`country') doc(All): All}"'
		disp in g "{hline 100}" 
	}

	if ("`disp'" == "sedlac") {
		disp in g _dup(100)"_"
		disp in g "{center:{title:Inventory of harmonized and Original surveys for `countryname'}}" 
		
		disp in y _dup(28)"_"
		disp "{title:Select either base or sedlac}" _n
		disp `"{stata datalib_displaysedlac, country(`country') type(base) : BASE }"'
		disp `"{stata datalib_displaysedlac, country(`country') type(sedlac) pro(02): SEDLAC }"'
		disp in y _dup(28)"."
		
	}
	if ("`disp'" == "lablac") {
		disp in g _dup(100)"_"
		disp in g "{center:{title:Inventory of harmonized and Original surveys for `countryname'}}" 
		
		disp in y _dup(28)"_"
		disp "{title:Select either base or sedlac}" _n
		disp `"{stata datalib_displaylablac, country(`country') type(blab) : BLAB }"'
		disp `"{stata datalib_displaylablac, country(`country') type(lablac) pro(01): LABLAC }"'
		disp in y _dup(28)"."
		
	}
}
else {
	if ("`if'" == "") local if "if year >= 2000"
	disp in g "{title:Inventory of harmonized datasets for LAC}" 

	* Survey inventory
	disp `"{stata datalib_displaysedlac `if', country(all) type(sedlac) pro(02): SEDLAC }"'
	disp `"{stata datalib_displaysedlac `if', country(all) type(cedlas) pro(02): CEDLAS }"'
	disp `"{stata datalib_displaysedlac `if', country(all) type(base) : BASE }"'
	disp `"{stata datalib_displaylablac, country(all): LABLAC }"'
}
} // end of if for countries


end

exit


