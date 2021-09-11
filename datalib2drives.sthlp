{smcl}
{* *! version 1.0 28 Oct 2014}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "Install command2" "ssc install command2"}{...}
{vieweralsosee "Help command2 (if installed)" "help command2"}{...}
{viewerjumpto "Syntax" "datalib2drives##syntax"}{...}
{viewerjumpto "Description" "datalib2drives##description"}{...}
{viewerjumpto "Options" "datalib2drives##options"}{...}
{viewerjumpto "Remarks" "datalib2drives##remarks"}{...}
{viewerjumpto "Examples" "datalib2drives##examples"}{...}
{title:Title}
{phang}
{bf:datalib2drives} {hline 2} is a sequential program for maintenance 
of {cmd:datalib} files. 

{marker syntax}{...}
{title:Syntax}
{p 8 17 2}
{cmdab:datalib2drives}
anything(name=drives)
[{cmd:,}
{it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt ados}} Update just ado-files{p_end}
{synopt:{opt files}} Update any kind of file like pkg or csv{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}

{marker description}{...}
{title:Description}
{pstd}
{cmd:datalib2drives} Copy the respective files to the S and U drives from the admin computer

{pstd}
{cmd:ados} From personal CPU to S or U drives ado 'datalib_usercheck.ado' is not copied. 

{pstd}
{cmd:files} 

{p 4 6} * From personal CPU to S drives {cmd:datalib2drives} copies folder 'Datalib-dofiles_sedlac'. 
 
{p 4 6} * From S drive to U drive {cmd:datalib2drives} copies the following: 

{p 8 12}-datalib_checkversion.txt

{p 8 12}-Datalib-dofiles_sedlac  folder

{p 8 12}-Everything besides stata.toc and "_ado\d" folder 

{pstd}
{cmd:dta} copies .dta files from S to U drive. 

{pstd}
{cmd:domerge} create file datalib_mergesedlac.do and place it in the S drive.   
 
 
{marker examples}{...}
{title:Examples}
{dlgtab:Regular Order of Update}

{pstd}
1.Change date (di date("$S_DATE", "DMY")) code in datalib and make sure the 
check-version section is not commented. then SAVE. 

{pstd}
2. create file datalib_mergesedlac.do and place it in the S drive ({ul:Optional}).

{p 8 12}{stata "datalib2drives S, domerge":. datalib2drives S, domerge}{p_end}

{pstd}
3.Copy ado-files to drives

{p 8 12}{stata "datalib2drives S U, ados":. datalib2drives S U, ados}{p_end}

{pstd}
3.1. Comment again check-version on personal -datalib- and save.

{pstd}
4. Copy files to S drive from personal computer ({ul:Optional})

{p 8 12}{stata "datalib2drives S, files":. datalib2drives S, files}{p_end}

{pstd}
5. Copy dta-files to U drive from S drive ({ul:Optional})

{p 8 12}{stata "datalib2drives U, dta":. datalib2drives U, dta}{p_end}


{center:********* {err:Stop here if you don't want to update U drive yet} *********}

{pstd}
6.Change date of datalib.pkg in directory [S:\Datalib\_ado]

{pstd}
7. Change number version in datalib_checkversion.txt in S drive
 using the same date code used in datalib in step 1.

 {pstd}
8. copy files to U drive from S drive

{p 8 12}{stata "datalib2drives U, files":. datalib2drives U, files}{p_end}


{title:Author}
{p}

Andres Castaneda, The World Bank

Email {browse "mailto:acastanedaa@worldbank.org":acastanedaa@worldbank.org}

{title:See Also}

{help datalib} (if installed)

