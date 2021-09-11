*===================================================================*
* WORLD BANK - LCSPP						 
* PROYECT: Check User name permissions
*-------------------------------------------------------------------*  
* Author: Andres Castaneda 
* Update: Nov/2013						    
*===================================================================*



cap program drop datalib_usercheck
program define datalib_usercheck, rclass
local accept = 0


local user = lower("`c(username)'")
disp "Datalib user: `user'" _con

if   ("`user'" == "wb438400" 			/// Santiago Garriga
	| "`user'" == "wb273483" 			/// Leonardo Lucchetti
	| "`user'" == "wb454408" 			/// Liliana do couto Sousa
	| "`user'" == "wb343674" 			/// Kiyomi E. Cadena
	| "`user'" == "wb384996" 			/// Andrés Castañeda
	| "`user'" == "wb419055" 			/// Daniel Sam
	| "`user'" == "wb439769" 			/// Mateo Salazar
	| "`user'" == "wb423484" 			/// Tania Diaz
	| "`user'" == "wb384997" 			/// Bernardo Atuesta
	| "`user'" == "wb447538" 			/// Ali Sharman
	| "`user'" == "wb463998" 			/// Martha Viveros
	| "`user'" == "wb471817"			/// Giselle del Carmen Hasbun
	| "`user'" == "wb473845"			/// Laura Moreno
	| "`user'" == "wb463689" 			/// Thiago Scot
	| "`user'" == "wb339789" 			/// German Caruso
	| "`user'" == "wb484541" 			/// German Reyes
	| "`user'" == "wb487078"			/// Sarah Mohamed Kotb
	| "`user'" == "wb486701"			/// Eduardo Malasquez
	| "`user'" == "wb452513"			/// Emma Monsalve	
	) local accept = 1

* Check acceptance

if (`accept' == 1) {
	local upi = c(username)
	local path "C:\Users/`upi'/NotesData"

	tempfile file 
	tempname n
	cap confirm file "`path'/setup.txt"
	
	* find users name
	if (_rc == 0) {
		copy "`path'/setup.txt" `file' 

		file open `n' using `file', read

		file read `n' line
		local found = 0
		while (`found' == 0 & r(eof)==0) {
			if regexm(`"`line'"', "^[Uu]sername") {
				lstrfun name, regexms(`"`line'"', `"([Uu]sername=CN=)(.*)/[oO][uU]"', 2)
				local found = 1
			}
			file read `n' line
		}
	} // end of _rc == 0
	
	if ("`name'" == "") local user = lower("`c(username)'")
	else {
		local user = "`name'"
		noi disp in w " - " in y "`name'"
	}
	return local user `user'
}		// end of if (`accept' == 1)

if (`accept' == 0) {
	qui {
		local root "${rootdatalib}/sedlac"
		tempname hh
		file open `hh' using "`root'/_log\log_nousers.csv", write text append
		local date : di %tdN/D/CY date("$S_DATE", "DMY")
		local username = c(username)
		file write `hh' "`date', $S_TIME, `username'" _n
		file close `hh'
	} // end of qui 

	disp in red "You are not authorized to use -datalib-. Please, send and email to " _cont
	disp `"{browse "mailto:LAC_Stats@worldbank.org":LAC_Stats@worldbank.org}"' _cont
	disp in red " in order to have access"
	error 
}		// if (`accept' == 0) 

end

exit


