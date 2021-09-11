*! v.0.1.           <Oct/2013>     A Castaneda

cap program drop datalib_update
program define datalib_update

syntax [, replace ]
qui {
	lel
	* update datalib
	noi net install datalib, `replace'
	
	local other "C:\ado\personal\Datalib-dofiles_sedlac"
	* Install acillary files
	cap mkdir "C:\ado"
	cap mkdir "C:\ado\personal"
	cap mkdir "C:\ado\personal\Datalib-dofiles_sedlac"
	net set other "`other'"
	net get datalib, `replace'
	
	local idfiles: dir "`other'" files "id_*.do"
	foreach iffile of local idfiles {
		erase "`other'/`iffile'"
	}
	net set other
}		// end of qui 

end

exit 


