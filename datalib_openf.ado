/* *===========================================================================
	program to open files
	Reference: 
-------------------------------------------------------------------
Created: 		05Jun2013	(Andres Castaneda) 
version:		01 
Dependencies: 	WORLD BANK - LCSPP
Output:			- DTA:		

				-Excel		
*===========================================================================*/


cap program drop datalib_openf
program define datalib_openf
	syntax,[Name(string) file(string) ACronym(string) Survey(string) Year(numlist) Vermast(string) doc(string) ]
	
	if ("`doc'" == "quest") local type "questionnaires"
	if ("`doc'" == "tech") local type "technical"
	if ("`doc'" == "rep") local type "reports"
	
	local path "\sedlac/`name'/`acronym'_`year'_`survey'/`acronym'_`year'_`survey'_v`vermast'_m\doc\\`type'"
	
	local path "${rootdatalib}`path'"
	
	local cpath="`c(pwd)'"
	qui cd "`path'"
	if ( substr("`file'",-3,.) == ".do" ) doedit "`file'"
	else if ( substr("`f'",-4,.) == ".dta" ) use "`file'", clear
	else shell pushd "`path'" & "`file'" & popd "`path'"
	qui cd "`cpath'"
end 

exit


******************************

