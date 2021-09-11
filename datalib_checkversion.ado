/*===========================================================================
project:       Check datalib Version
Author:        Andres Castaneda 
---------------------------------------------------------------------------
Creation Date:    February 27, 2014 
===========================================================================*/

/*===============================================================================================
                                  0: Program set up
===============================================================================================*/

cap program drop datalib_checkversion
program define datalib_checkversion, rclass
version 10.0

syntax anything, user(string)

tempfile tfile
tempname tf
copy "${rootdatalib}\_ado\d\datalib_checkversion.txt" `tfile'

file open `tf' using `tfile', read

file read `tf' line					// first line
local code `"`macval(line)'"'

file read `tf' line					// second line
local update `"`macval(line)'"'
file close `tf'

local checkversion 0
if (`anything' < `code') {
	cap window stopbox rusure "Dear `user'," ///
		"A New version of -datalib- has been released." ///
		"What's new: `update'"	///
		"Click on Yes to get the latest update."
	
	 if (_rc == 0) {
		qui {
		net from "${rootdatalib}\_ado"
		net install lel, replace 
		* net install essentials, replace
		* essentials, replace
		datalib_update, replace
		}
		noi disp in g "Your datalib has been successfully updated!" ///
			_n "Please, click" `"{stata discard: here }"' "to finish the update"
		local checkversion 1
	} // end "if (_rc == 0)" 
	else {
		noi disp in red "you must update your -datalib- to go on"
		error
	}
}

return local checkversion `checkversion'
end
exit
/* End of do-file */

><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><

versions

1. 
filefilter "${rootdatalib}\_ado\d\datalib_checkversion.txt" `tfile', from("`anything'") to("")

