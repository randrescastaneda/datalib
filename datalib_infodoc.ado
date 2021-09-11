*===================================================================*
* WORLD BANK - LCSPP						 
* PROYECT: info option for questionnaires, reports and technical documents.  
*-------------------------------------------------------------------*						   
* Author: Andres Castaneda 
* Update: Oct/2013						    
*===================================================================*

cap program drop datalib_infodoc
program define datalib_infodoc, rclass

	syntax [anything]							///
		[if] [in],		                      	///
		COUNtry(string)							///
		doc(string)								///
		[										///
		clear									///
		]


* =========================================START================================================
		* ======================= 1. Globals for each country ==============	 *
* ==============================================================================================


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

* =========================================START========================================================
		* ======================= 2. Check for Errors ==============	 *
* =========================================================================================================


* =========================================START========================================================
		* ======================= 3. loops for getting the data ==============	 *
* =========================================================================================================


* Define locals
local root "${rootdatalib}\sedlac/`country'" 
*lstrfun drive, regexms("`root'", "^([a-zA-Z])", 1)

local levels1: dir "`root'" dirs "*"
file close _all 			// make sure everything is close

local yr = 0
foreach level1 of local levels1 {		// files like COL_2006_GEIH
	if (regexm("`level1'", "^_")) continue

	* year local
	lstrfun year, 	regexms("`level1'", "^.*_([0-9]+)[-_].*", 1)
	if ("`yr'" != "`year'") local yr = `year'
	else local yr = 0

	* survey local
	*lstrfun survey, regexms("`level1'", "^.*_([0-9]+)_(.*)", 2)
	lstrfun survey, regexms("`level1'", "^.*_([a-zA-Z-]+)$", 1)


	local levels2: dir "`root'/`level1'" dirs "`level1'_*_m" 
	/* New */ local nwlv2: word count `levels2' // Number of words in level 2
	/* New */ local nwlv2_aux = 0 				// auxiliary to match number of words of level 2
	
	foreach level2 of local levels2 {		// files like col_2006_geih_v01_m
		/* New */ local ++nwlv2_aux
		
		* Master version local
		lstrfun vermast, regexms("`level2'", "([0-9]+)_m$", 1)
		
		* temporal writing files
		tempfile q`year'`yr'`vermast' t`year'`yr'`vermast' r`year'`yr'`vermast'
		tempname q t r
		
		/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
					Questionnaires
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
		if (regexm("`doc'", "(quest|All)")) {	
			local qfiles: dir "`root'/`level1'/`level2'/doc/questionnaires" files "*", respectcase
			
			if (`"`qfiles'"' != "") { 						// procedure when at least one questionnaire is found
	/*Open*/	file open `q' using "`q`year'`yr'`vermast''", write text	// open if # of foldersin lv 2 is 1 
				
				* first three lines of file
				file write `q' "`year'" _n					// line 1: year
				file write `q' "`survey'" _n 				// line 2: survey
				file write `q' "`vermast'" _n 				// line 3: master version
				
				* save name of each document in a different line
				foreach qfile of local qfiles {				
					file write `q' "`qfile'" _n
				}
	/*Close	if ("`nwlv2'" == "`nwlv2_aux'") */
				file close `q'	// close when no more folders in level 2
				local qtfiles `"`qtfiles' q`year'`yr'`vermast' "'
			} 		// end of condition for not questionnaires
		}		// end of condition if option questionnaires is selected

		*~~~~~~~~~~~~~~~~~~~~
		* Technical documents
		*~~~~~~~~~~~~~~~~~~~~
		if (regexm("`doc'", "(tech|All)")) {	
			local tfiles: dir "`root'/`level1'/`level2'/doc/technical" files "*"
			
			if (`"`tfiles'"' != "") { 						// procedure when at least one questionnaire is found
	/*Open*/	file open `t' using "`t`year'`yr'`vermast''", write text		
				
				* first three lines of file
				file write `t' "`year'" _n					// line 1: year
				file write `t' "`survey'" _n 				// line 2: survey
				file write `t' "`vermast'" _n 				// line 3: master version
				foreach tfile of local tfiles {
					file write `t' "`tfile'" _n
				}
	/*Close*/	file close `t'									
				local ttfiles `"`ttfiles' t`year'`yr'`vermast' "'
			} 	// end of technical condition
		}

		*~~~~~~~~
		* Reports
		*~~~~~~~~
		if (regexm("`doc'", "(rep|All)")) {	
			local rfiles: dir "`root'/`level1'/`level2'/doc/reports" files "*"
			
			if (`"`rfiles'"' != "") { 				// procedure when at least one file is found
	/*Open*/	file open `r' using "`r`year'`yr'`vermast''", write text		
	
				* first three lines of file
				file write `r' "`year'" _n					// line 1: year
				file write `r' "`survey'" _n 				// line 2: survey
				file write `r' "`vermast'" _n 				// line 3: master version
				foreach rfile of local rfiles {
					file write `r' "`rfile'" _n
				}
	/*Close*/	file close `r'									
				local rtfiles `"`rtfiles' r`year'`yr'`vermast' "'
			} 	// end of technical condition
		}
		
		
	} // end of loop for files like COL_2006_GEIH_v01_M
	
} // end of loop for files like COL_2006_GEIH


* =========================================START========================================================
			* ======================= 4. Display Results ==============	 *
* =========================================================================================================

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  create locals depending of the
  type of information requested
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


* Questionnaires
if (regexm("`doc'", "quest")) {
	local keyfiles qtfiles				// type of file: Questionnaires, reports, Technical...
	local title    Questionnaires		// Title
	local doccall  quest				// local for the openfile command
}

* Technical documents
if (regexm("`doc'", "tech")) {
	local keyfiles ttfiles					// type of file: Questionnaires, reports, Technical...
	local title    "Technical documents"	// Title
	local doccall  tech						// local for the openfile command
}

* Reports
if (regexm("`doc'", "rep")) {
	local keyfiles rtfiles				// type of file: Questionnaires, reports, Technical...
	local title    Reports				// Title
	local doccall  rep					// local for the openfile command
}

*  All type of files
if (regexm("`doc'", "All")) {
	local keyfiles "qtfiles ttfiles rtfiles"		// type of file: Questionnaires, reports, Technical...
	local title    `" "Questionnaires" "Technical documents" "Reports" "'		// Title
	local doccall  quest tech rep						// local for the openfile command
}

* source
* if ("${rootdatalib}" == "S:\Datalib")		 local drive a // internal 
* if ("${rootdatalib}" == "\\lcrms02\datalibpub\Datalib") local drive b // public

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Loop for all type of files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

local key = 0
foreach keyfile in `keyfiles' {		// loop for quest, tech and rep 
	
	local ++key
	dis in ye _n(2) _dup(54) "."	
	dis in gr _col(14)  "{ul: `: word `key' of `title'' of `countryname'}"
	
	foreach tfile in ``keyfile'' {
		tempname q
		
		cap file open `q' using "``tfile''", read
		if _rc continue
		file read `q' line
		
		local linenum = 0
		while r(eof)==0 {
			local ++linenum
			
			* first line
			if (`linenum' == 1) {
				local year = `"`macval(line)'"'
			}
			
			* second line
			if (`linenum' == 2) {
				local survey = "`macval(line)'"
				local survey = upper("`survey'") 		//upper cases for survey local

			}
			
			*third line
			if (`linenum' == 3) {
				local vermast = `"`macval(line)'"'
				
				local lsize = 54 - `: display length(" `year' - `survey' - Version `vermast' ")' - 15 
				disp in y _new "{hline 15}" 					/// line left-aligned
					" `year' - `survey' - Version `vermast' "  	/// display year and survey
					"{hline `lsize'}"			// right-aligns text in a field # characters wide
			}
			
			* fourth and other lines
			if (`linenum' >= 4) {
				if (regexm("`macval(line)'", "\.db$")) { // in case not desired files are present
					file read `q' line
					continue
				}
				local line2 = substr("`line'",1,35)
				local i = `linenum' -3
				noi disp _col(2) in w "`i'. " in w _col(5)"`line2'" _cont
				noi dis _col(50) `"{stata datalib_openf, n(`country') file(`macval(line)') ac(`country') s(`survey') y(`year') v("`vermast'") doc(`: word `key' of `doccall''): open}"'
			}
			
			file read `q' line
		}
		
	}
	dis in ye _dup(54) "_"	
}		// end of loop for type of files 

end

exit 
