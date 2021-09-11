* v.0.3.           <08Apr2014>  <Andres Castaneda>
* v.0.2.           <15Mar2013>  <Andres Castaneda>
* v.0.1.           <19Feb2013>  <Andres Castaneda>

cap program drop datalib_infocpi 
program define datalib_infocpi, rclass

	syntax , COUNtry(string)

qui {

preserve 
	** get tne name of the country
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
	
	** data used
	use "${rootdatalib}\sedlac/ipc_sedlac_wb.dta", clear
	
	** PPP05 and CPI 05 locals
	sum ipc05_sedlac if (pais == "`country'")
	local ipc05 = round(r(mean), .0001)

	sum ppp05 if (pais == "`country'")
	local ppp05 = round(r(mean), .0001)

	** keep relevant data
	keep pais ano reference_period encuesta conversion ipc_sedlac 
	drop if ipc_sedlac == .
	
	** tostring variables
	tostring ano conversion ipc_sedlac , replace force
	
	** replace missing values for N/A
	replace reference_period = "-" 	if reference_period == ""
	replace encuesta = "-" 			if encuesta == ""
	
	**Construct id variable with year and period of reference
	gen id = ano + "--> " + reference_period 

	** Rename variables to be reshaped
	foreach var of varlist encuesta conversion ipc_sedlac  {
		ren `var' c_`var'
	}

	** reshape encuesta CPI & conversion factor 
	reshape long c_, i(pais id) j(info) string
	ren c_ values
	
	** Change labels in order to order display
	replace info = "2.CPI" 				if ( info == "ipc_sedlac")
	replace info = "3.conversion factor" 	if ( info == "conversion")
	replace info = "1.survey" 	if ( info == "encuesta")

	label var info " "
	label var id "Year--> Period"

	** gert rid of too many decimal points
	replace values = regexs(1) if regexm(values, "^([0-9]+[\.][0-9][0-9][0-9])")
	replace values = regexs(1) if regexm(values, "^([\.][0-9][0-9][0-9])")
	
	** Display 
	noi dis as text "{hline}"
	* noi dis as text "{p 4 4 2}{cmd:The following is the information for:} " in y "`pais'" as text " {p_end}"
	noi dis as text "{center:{cmd:`pais'}}" 
	noi dis as text _col(4) "{cmd:CPI 2005 (Base):} " 			  in y _col(32) "`ipc05'" 
	noi dis as text _col(4) "{cmd:PPP conversion factor 2005:} "  in y _col(32) "`ppp05'" 
	noi tabdisp id info if (pais == "`country'"), cell(values) left
	noi dis as text "{hline}"

	* return values
	destring ano, gen(year)
	destring values, replace force
	mkmat year value if (pais == "`country'" & info == "2.CPI"), matrix(CPI)
	mkmat year value if (pais == "`country'" & info == "3.conversion factor"), matrix(Conv_factor)
	
	return local ppp05 = `ppp05'
	return local ipc05 = `ipc05'
	return matrix CPI = CPI
	return matrix Conv_factor = Conv_factor
	
restore 
} // end of qui brakes
end

exit
*
