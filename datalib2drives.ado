/*===========================================================================
project:       copy updated files to internal and external datalib
Author:        Andres Castaneda 
---------------------------------------------------------------------------
Creation Date:      October 6, 2014 
===========================================================================*/

/*===============================================================================================
                                  0: Program set up
===============================================================================================*/

discard
cap program drop datalib2drives
program define datalib2drives

syntax anything(name=drives), [ados files domerge dta]

local source       "C:\ado\personal\d"
local dests        "\\Gpvdrlac\datalib\Datalib"      // Interno
local destu        "\\Gpvdrlac\datalibpub\Datalib"  // Public nuevo
* local destu      "\\lcrms02\datalibpub\Datalib"    // Public viejo
local sourcef      "C:\ado\personal\Datalib-dofiles_sedlac"


* errors

if ("`ados'" == "" & "`files'" == "" & "`domerge'" == "" & "`dta'" == "") {
	dis as err "you must specify either ados, domerge, or files options"
	error
}

* S Drive
if (regexm("`drives'", "[sS]")) {
	if ("`ados'" == "ados") {
		disp in y "S drive"
		shell ROBOCOPY "`source'" "`dests'/_ado/d" datalib* /e /MT:100 /XF datalib2.* datalib_usercheck.ado
	}
	if ("`files'" == "files") {
		shell ROBOCOPY "`sourcef'" "`dests'/_ado/Datalib-dofiles_sedlac" datalib* /e /MT:100
	}
	
	** Run and copy the do-file to merge sedlac and Base
	qui if ("`domerge'" == "domerge") {
		noi disp in y "I am working on creating datalib_mergesedlac.do please wait..."
		run "Z:\public\Stats_Team\do-files\Datalib aux\gen_datalib_mergesedlac.do"
		noi disp in y "I am done working... please, give me a break!"
	}
}

* U drive 
if (regexm("`drives'", "[uU]")) {
	disp in y "U drive"
	if ("`ados'" == "ados") {
		shell ROBOCOPY "`source'" "`destu'/_ado/d" datalib* /e /XF datalib2.* datalib_usercheck.ado /XO /MT:100 
	}
	
	* Copy packages from S to U
	
	if ("`files'" == "files") {
		shell ROBOCOPY "`dests'/_ado" "`destu'/_ado" /XL /e /XF stata.toc /XD "S:\Datalib\_ado\d" /XO /MT:100 
		
		* copy datalib check version text file
		shell ROBOCOPY "`dests'/_ado/d" "`destu'/_ado/d" datalib_checkversion.txt /XO /MT:100 
		shell ROBOCOPY "`dests'/_ado/Datalib-dofiles_sedlac" "`destu'/_ado/Datalib-dofiles_sedlac" datalib* /e /MT:100
	}
	
	if ("`dta'" == "dta") {
		shell ROBOCOPY "`dests'" "`destu'" *.dta /e /XO /XX /XD "S:\Datalib\_ado" /MT:100
	}
}

*  When no drive or wrong drive is specified
if (!regexm("`drives'", "[uU]|[sS]")) {
	disp as err "you must specify drive S or U"
	error
}

end 
exit
/* End of do-file */

><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><
 
       /XO : eXclude Older - if destination file exists and is the same date
            or newer than the source - don’t bother to overwrite it.
/XC | /XN : eXclude Changed | Newer files
      /XL : eXclude "Lonely" files and dirs (present in source but not destination)
            This will prevent any new files being added to the destination.
      /XX : eXclude "eXtra" files and dirs (present in destination but not source)
            This will prevent any deletions from the destination. (this is the default)
			
			

regular order of update
1. copy ado-files to drives
datalib2drives S U, ados

2. change date of datalib.pkg and number version in datalib_checkversion.txt in S drive

3. copy files to U drive
datalib2drives U, files




