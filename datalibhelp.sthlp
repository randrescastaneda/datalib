{smcl}
{* 10June2015 }{...}
{cmd:help datalib} {hline 2} (help file in progress)
{err:Read carefully as the this helpfile has been updated on Jan 2018. }
{p 4 6 6}{err:NOTE:} New entries or updates of this helpfile are signaled either in 
{err:red} or with this following arrow, {err:-->}. {p_end}
{hline}
 
{title:Title}

{p2colset 9 20 22 2}{...}
{p2col :{hi:datalib} {hline 2}}Data extract tool for LAC TSD microdata library.{p_end}
{p2colreset}{...}

{* SYNTAX *}
{title:Syntax}

{p 6 16 2}
{cmd:datalib} [{it:type}] {cmd:,} [	 {it:{help datalib##options:Options}}  ] 
 
{pstd}
where {it:type} is the harmonization project or collection that you wish to
work with. You can also specify the type of the data using the option 
{it:{help datalib##type:type(string)}}

{* SYNTAX *}
{title:{err:IMPORTANT NOTE}}

{pstd}
{cmd:datalib} provides access to two main collections. SEDLAC and LABLAC. Within 
each collection you will find different "flavors" or modules that were created 
to ease you work and fit your needs. The SEDLAC collection has undertook a huge 
structural change that implied a modification of {cmd:datalib} syntax. The LABLAC 
collection, however, has not been updated to the new structure yet, but users 
will be notified when such change takes place.
Click {it:{help datalib##SEDLACchange:here}} for a detailed explanation of 
the new SEDLAC structure and the respective changes in the {cmd:datalib} syntax


{marker sections}{...}
{title:sections}

{pstd}
Sections are presented under the following headings:

		{it:{help datalib##desc:Command description}}
		{it:{help datalib##Options2:Options description}}
		{it:{help datalib##Examples:Examples}}
		{it:{help datalib##surveys:Surveys}}
		{it:{help datalib##vars:Sedlac variables}}



{marker options}{...}
{synoptset 27 tabbed}{...}
{synopthdr:options}
{synoptline}
{syntab:{help datalib##basics:Basics}}
{synopt:{opt coun:try(string)}}{help datalib##surveys:Acronym} of the country composed 
of {it:three} letters. Only one country allowed per command line{p_end}

{synopt:{opt y:ears(numlist)}}List of survey years{p_end}

{synopt:{opt cir:ca(numlist)}}List of survey circa years based on circa criteria [-2,2]{p_end}

{marker type}{...}
{synopt:{opt t:ype(string)}}Type of data base. For household budget surveys it could be
sedlac of base. For Labor Force surveys it could lablac or blab. Default is sedlac.
{err:-->} Notice that {opt type(cedlas)} is not an option any more.
{help datalib##information:Examples}{p_end}

{synopt:{opt mod:ules(string)}}{err:-->}Module of collection. if SEDLAC collection
is selected, {opt modules(pov)} is the default. {p_end}

{synopt:{opt per:iod(string)}}For some countries the frequency of some households 
surveys is greater than once per year. If Argentina is selected, the second semester 
of the year (s2) is the default period{p_end}

{syntab:{help datalib##information:Information}}
{synopt:{opt info}}Displays interface with available information (metadata)
 for each country. You can request information either by country or 
 year, or request metadata such as questionnaires.

 {synopt:{opt lang:uage(string)}}Select the language of the data set (variable labels
 and values labels). {it:en}:English / {it:es}:Spanish / {it:pt}:Portuguese {p_end}

{syntab:{help datalib##cpi:CPI and PPP conversion}}
{synopt:{opt inc:ppp(string)}}List of income variables to be generated in PPP 
{err: 2005}  and {err:2011} values. Default is {it:ipcf, ila}, and {it:inla}{p_end}

{synopt:{opt pl:ppp(numlist)}}List of poverty rates to be generated into PPP values 
and current prices. Default values are 1.9usd, 3.2usd, 5.5usd, 1.25usd, 2.5usd, 4usd, 
10usd, and 50usd {p_end}

{synopt:{opt ppp:year(numlist)}}PPP year. It must be 1993, 2005, or 2011 depending on
the ICP round desired. Default is {err:2011}{p_end}  

{synopt:{opt cpi:ppp(string)}}list of CPI or PPP variables besides the ones in 
{it:pppyear} option. See {cmd:datalib, usecpi} for more information.{p_end}  
 
{synopt:{opt noppp}}No PPP variables will be generated and no merge will be done with 
CPI's database{p_end}

{syntab:{help datalib##advanced:Advanced}}
{synopt:{opt pro:ject}}Allows the user to specify the version of the SEDLAC project
desired. {opt project(03)} is the default.{p_end}

{synopt:{opt verm:ast}}Specific version of master data. Most recent version is the default.{p_end}

{synopt:{opt vera:lt}}Specific version of alternative data. Most recent version is the default.{p_end}

{synopt:{opt repo:sitory(string)}}Creates a file with the vintage information of all
the surveys of a specific project. This file is subsequently read by {cmd:datalib}, 
so that the vintages of the datasets in the repository file are loaded in Stata
rather than the most recent version. {p_end}

{synopt:{opt sur:vey(string)}}Acronym of the survey defined by the National 
Statistics Office. Only useful when more than one survey is available
 for the same period{p_end}

{synopt:{opt vars(string)}}Request {cmd:datalib} to load only the variables specified.
This option only works with {opt modules(all)}.{p_end}

{synopt:{opt merge}}{err:-->} This option is not available anymore. It has been 
replaced by option {opt modules(all)}{p_end}


{marker desc}{...}
{title:Description}
{p 40 20 2}(Go up to {it:{help datalib##sections:Sections Menu}}){p_end}
{pstd}
{cmd:datalib} is a Stata command developed by the LAC Team for Statistical 
Development (TSD) in the Poverty Global Practice of the World Bank that grants 
users direct access to the microdata library maintained by the LAC TSD. In 
addition, {cmd:datalib} also generates income  and poverty lines variables in PPP. 
{cmd:datalib} adds two variables to the dataset requested: the name of the survey 
and the name of the type of the SEDLAC database requested. If the user does not 
specify which variables are required, {cmd:datalib} will load the entire dataset
of a certain country/year. The poverty module is the default set of variables in the
SEDLAC collection. For LABLAC, in contrast, there is no default variable module but
the whole dataset. If the user needs only a subset of variables, she has to 
specify one by in the the {opt vars(varlist)} option. wildcards like *, ?, ??, 
??? are allowed.  

{marker Options2}{...}
{title:Options description}
{p 40 20 2}(Go up to {it:{help datalib##sections:Sections Menu}}){p_end}
{marker basics}{...}
{dlgtab: basics}

{phang} {* COUNTRY *}
{opt country(["]acronym["])}  Specifies the ISO-3 code of the 
country composed by {it:three} letters. Corrently, {cmd: datalib} only allows one 
country per command line

{phang} {* YEAR *}
{opt year(numlist)}  list of years for which datasets are a available for a certain
country. use option {it:info} to know repository of data. {p_end}

{phang} {* CIRCA *}
{opt circa(numlist)} list of circa years. A circa year is the closest survey year available in a [+2,-2] period. For instance, the circa years for 2014 are 2012, 
2013, 2014, 2015, and 2016. The criteria for selecting a particular survey-year 
is to start from the year of reference and then follow an increasing zigzag sequence,
 0, +1, -1,+2, -2. If no data is found, {cmd:datalib} produces an error message,
for the reference year has no circa year availabe in that particular
country. Please refer to the following {it:{help datalib##circaex:example}}.
{cmd:datalib} creates an aditional variable "circa" to compare the actual year 
obtained and the year requested. {p_end}

{phang} {* TYPE *}
{opt type(string)}For households surveys {cmd: datalib } has three kinds of surveys: 
sedlac, cedlas and base. For labor surveys {cmd: datalib } has two kinds of surveys: 
lablac and blab.{p_end}

{p 10 12 2} {cmd:sedlac:} The {browse "http://www.cedlas.econo.unlp.edu.ar/wp/en/estadisticas/sedlac/":SEDLAC} 
project, which stands for Socio-economic Database for Latin America and the Caribbean, 
has the purpose of improving the 
timely access to key socio-economic statistics, including indicators on poverty,
inequality, income, employment, access to services, education, health, housing, 
social programs, and numerous demographics in the LAC region. 
It was developed by The Center for Distributional, Labor and Social Studies ({browse "http://www.cedlas.econo.unlp.edu.ar/wp/en/":CEDLAS}) of the Universidad Nacional de
La Plata and {browse "http://www.worldbank.org/en/topic/poverty/lac-equity-lab1/overview": LAC Team for Statistical Development} of the World Bank's Poverty Global 
practice statistics. 

{p 10 12 2} {cmd:base:} Is a consolidated dataset of raw variable as they are released by the NSO. 

{p 10 12 2} {cmd:lablac:} The {browse "http://www.cedlas.econo.unlp.edu.ar/wp/en/estadisticas/lablac/" : LABLAC} project 
is a data base of labor statistics built from micro data of the Latin American and
Caribbean(LAC) labor force surveys. It is developed by 
{browse "http://cedlas.econo.unlp.edu.ar/eng/index.php" : CEDLAS} and
 {browse "http://www.worldbank.org/en/topic/poverty/lac-equity-lab1/overview": LAC Team for Statistical Development} of the World Bank's Poverty Global 
practice statistics. This data is a useful complementary source to the SEDLAC database,
which allows users to monitor trends in labor variables with the highest frequency
information available for each country.  {p_end}
 
{p 10 12 2} {cmd:blab: } Has the same functionality than the {it:base} type of SEDLAC. 
{it:blab} is the raw data put together and ready to be harmonized.{p_end}
 
{phang} {* MODULES *}
{err:{bf:{ul:mod}ules({it:string})}} This option allows the user to select a subset of variables of the SEDLAC collection. The following five modules have been created. {p_end}

{p 10 12 2} {cmd:pov: }The default module. This module contains the necessary variables 
to calculate basic measures of poverty, inequality, and shares prosperity. {p_end}
 
{p 10 12 2} {cmd:ind: }The individuals module. This module contains information at 
the individual such as labor, education, and health. {p_end}
 
{p 10 12 2} {cmd:dmr: }Demographic and regional variables. {p_end}
 
{p 10 12 2} {cmd:hhd: }Household module. This module contains information related 
to goods, services, and dwelling infrastructure at the household level. {p_end}

{p 10 12 2} {cmd:all: }Module with all the variables. This module contains not only 
the former {it:cedlas} collection, but also the {it:base} collection.
In other words, this module contains all the possible information available for a 
single survey. Furthermore, this module replces the old option {it:merge}.{p_end}

{error}{col 6}The following syntax has changed:                     

{result}{col 20}Old syntax{text}{col 40}{c |} {result}{col 45}New syntax
{txt}{col 10}{hline 30}{c +}{hline 38}
{txt}{col 10}{it:datalib, type(sedlac)}{col 40}{c |}{col 44}{it:datalib, module(sedlac) project(02)}
{txt}{col 10}{it:datalib, type(cedlas)}{col 40}{c |}{col 44}{it:datalib, module(all)}
{txt}{col 10}{it:datalib, merge}{col 40}{c |}{col 44}{it:datalib, module(all)}

{p 10 12 2} {err:NOTE: }Notice that for replicability purposes the subset of variables
contained in SEDLAC under the old structure was kept for version 02 of the project, 
{opt project(02)}. However, the module SEDLAC was not kept for version 03 of the project. You may recreate the SEDLAC module by loading the pov, 
ind, dmr, and hhd at the same time. That is, {cmd: datalib, modules(pov ind dmr hhd)}.{p_end}
 
{phang} {* LANGUAGE *}
{opt lang:uage(string)} select the language of the data set (variable labels 
and values labels). {it:en}:English / {it:es}:Spanish / {it:pt}:Portuguese. 
Be default, {cmd:datalib} will load all the labels in English. However, 
if the data has been already loaded, it is not necessary to reload it in order to
have the labels in a different language. By typing {cmd: label language {it:[en|es|pt]}},
labels for variables and values will change. {p_end}

{marker information}{...} {p 80 20 2}({it:{help datalib##options:UP}}){p_end}
{dlgtab:Information}

{phang} {* INFO *}
{opt info} displays information of four types: {p_end}
{p 8 12 2} {cmdab:i} CPIs values used to deflate income aggregates and poverty lines to 2011 and 2005 PPP values.{p_end} 
{p 8 12 2} {cmdab:ii} Vintage inventory of available surveys for each country.{p_end} 
{p 10 14 14}{cmd:datalib}, {opt country(ccc)} {opt info}{p_end}

{p 8 12 2} {cmdab:iii} Inventory of versions and countries available for specified year{p_end} 
{p 10 14 14}{cmd:datalib}, {opt year(ccc)} {opt info}{p_end}

{p 8 12 2} {cmdab:iv} Documentation and metadata available for each country/survey/year.{p_end}

{p 10 12 2}{cmd:datalib} opens the file using the default programs used by the operative system. Three 
different types of information is available: Questionnaires, Technical documents and Reports {p_end}

{marker cpi}{...} {p 80 20 2}({it:{help datalib##options:UP}}){p_end}
{dlgtab:CPI and PPP convertion}

{phang} {* INCPPP *}
{opt incppp(string)} allows the user to create a list of income variables that are desired to be converted to PPP values. By default {cmd:datalib} converts to PPP the household income per-capita (ipcf), non-labor income (inla) and labor income (ila). {p_end}

{phang} {* PLPPP *}
{err:{bf:plppp({it:numlist})}} Set of poverty lines variables in PPP terms. Under the new structure, default values are 1.9usd, 3.2usd, 5.5usd, 1.25usd, 2.5usd, 4usd, 
10usd, and 50usd. The variable name includes the value of the poverty line up to the
second decimal point but exclude the decimal separator. For instnace, the variable name
for the $1.25 and the $1.9usd poverty lines will be lp_125usd_ppp and lp_190usd_ppp,
respectively.{it:{help datalib##plpppex:example}}{p_end}

{phang} {* PPPyear *}
{opt pppyear(string)} Loads CPI and PPP variables to deflate income variables.
In order to construct variables in PPP terms three pieces of information are needed: The CPI deflator of the current year, the CPI of the base year, and the PPP conversion factor. {cmd:datalib} automatically deflates in the following way: {p_end}

{p 14 20 2}{cmd: Income in PPP =((nominal income*base year CPI)/nominal CPI)/(PPP conver factor)}{p_end}

{pmore}
By default {cmd:datalib} uses the CPI values preferred by Sedlac and 2005 as the base year. Yet, by
typing {cmd:datalib, usecpi clear} The user can see all the different CPI and PPP variables available. Nonetheless, we only support those with infix or sufix "sedlac" in the name.{p_end}

{phang} {* cpippp*}
{opt cpippp(string)} Besides the variables loaded by the {it:pppyear} option, the user can request
additional CPI and PPP variables to be loaded along with the SEDLAC dataset.
See {cmd:datalib, usecpi clear} for variable availability.{p_end}

{marker advanced}{...} {p 80 20 2}({it:{help datalib##options:UP}}){p_end}
{dlgtab:Advanced}

{phang} {* PROject Version *}
{opt project(string)} Refers to the version of the SEDLAC project. By Default,
{cmd:datalib} loads the most recent version of the project released on early 2018,
version 03. If a different version of the project is selecte, say version 02,
{cmd:datalib} load the most recent survey availabe. Take into account that comparisons
between project version, either over time or across countries, might not be accurate. 
Always request versions using two-digit code (e.g. 01 , 02, …, etc). {p_end}

{phang} {* MASTERVERSION *}
{opt vermast(string)} Version of the master (raw) data. The version of the raw data 
might change for one of two reasons. First, though unlikely, the aggregation of 
different modules might have been messed up during the harmonization process. Second,
the NSO releases a new version of the microdata either because they updated the sample
weights or because they fixed a serious bug in the data. 

{phang} {* ALTERNATIVEVERSION *}
{opt veralt(string)} Alternative version refers to vintage of any microdata collection
that has altered the original data, like SEDLAC and LBLAC. By the default, {cmd:datalib}
load the most recent alternative version according to the poject and master version
selected. {p_end}

{phang} {* Repository *}
{opt repo:sitory(string)} This option allows the user to create, use, query, and 
delete repository files with specific vintage information for particular projects. 
This option is composed of three main elements: {it: instruction, name, and option}, 
and its syntax might be look like this: 
{p_end}

{p 10 14 14}{cmd:datalib}, {opt country(ccc)} {opt year(yyyy)}  {opt  repository(instruction reponame, option)}{p_end}

{p 6 8 8} hwere {it:instruction} is one among {it:create}, {it:use}, {it:query}, or {it:erase}. {p_end}

{p 8 10}{cmd:create} creates or modifies an existing repository file{p_end}
   
{p 8 10}{cmd:use} forces {cmd:datalib} to use the version of the databases specified in {it:reponame} {p_end}
     
{p 8 10}{cmd:erase} deletes an existing repository file{p_end}
   
{p 8 10}{cmd:query} displays in the Stata results window the names ({it:reponames}) of
all repository files  in store{p_end}

{p 6 8 8} {it: reponame} might be any name the user wants that relates a particular 
project in which she is working on and the databases versions used in that project{p_end}
 
{p 6 8 8} {it: option} indicates {cmd: datalib} how to execute the {it:repository}
option. If the user specifies the instruction {ul:create} and the {it:reponame} 
already exists, the options available are {it:replace} or {it:append}. If the user 
wants to delete a repository file from the {cmd:datalib} library by using the 
instruction {ul:erase}, she must specify the option {it:force}. The instructions 
{ul:use} and {ul:query} do not need any option.{p_end}

{phang} {* PERIOD *}
{opt period(string)}for some countries the frequency of households surveys (SEDLAC) 
is greaterly rather than yearly. In the case of Argentina the household survey is 
done twice at year and the {browse "http://go.worldbank.org/IYDYF1BG70" : LAC Team 
for Statistical Development} uses the second semester as default. In the case of 
LABLAC, all harmonized microdata frequency is quarterly.{p_end}

{phang} {* SURVEY *}
{opt survey(["]acronym["])}is the acronym of the survey defined by the National
Statistics Office of each country. This option is useful when a country has two or 
more surveys in the same year. In that case the user can specify which survey she 
needs and don’t get the {cmd: datalib}’s default survey. The default surveys are 
selected according to the commonly used surveys by the {browse "http://go.worldbank.org/IYDYF1BG70" : LAC Team for Statistical Development}{p_end}

{phang} {* SURVEY *}
{opt vars(varlist)} Request specific set of variables to be loaded by {cmd:datalib}.
{err: -->} This option only works with {opt modules(all)}. By default, the following 
list of variables is loaded along with the variables requested:{p_end}

{p 16 16 2}{it:id com pondera psu strata cohh jefe}{p_end}


{marker Examples}{...}
{title:Examples}{p 40 20 2}(Go up to {it:{help datalib##sections:Sections Menu}}){p_end}
{pstd}

{p 2 4}The examples below use the lighter data bases like Paraguay or Panama, but the user can change to any 
convenient country as long as the data exists.{p_end}

{dlgtab: Basic use}

{pstd}
Get poverty module of the harmonized SEDLAC database for Paraguay 2009

{p 8 12}{stata "datalib, country(pry) years(2009) " :. datalib, country(pry) years(2009) }{p_end}

{pstd}
Get harmonized SEDLAC database for Paraguay 2009

{p 8 12}{stata "datalib, country(pry) years(2009) module(pov ind dmr hhd)" :. datalib, country(pry) years(2009) module(pov ind dmr hhd)}{p_end}

{pstd}
Get raw database for Paraguay 2009. Both lines below are equivalent

{p 8 12}{stata "datalib, country(pry) years(2009) type(base) clear" :. datalib, country(pry) years(2009) type(base) clear}{p_end} 
{p 8 12}{stata "datalib base, country(pry) years(2009) clear" :. datalib base, country(pry) years(2009) clear}{p_end} 

{pstd}
Get Labor Force survey for Colombia-2008. Since Period was not specified, fourth (q04)
period is default

{p 8 12}{stata "datalib, country(col) year(2008) type(lablac) clear" :. datalib, country(col) year(2008) type(lablac) clear}{p_end}

{pstd}
Get Labor Force survey for Colombia-2008 second quarter (q02).

{p 8 12}{stata "datalib lablac, country(col) year(2008) period(q02) clear" :. datalib lablac, country(col) year(2008) period(q02) clear}{p_end}

{pstd}
Get all quarters {it:period(all)} of Labor Force survey for Colombia-2008.

{p 8 12}{stata "datalib lablac, country(col) year(2008) period(all) clear" :. datalib lablac, country(col) year(2008) period(all) clear}{p_end} 
{pstd}
The default survey for Ecuador in 2006 is the ENEMDU survey. If the user requires the 
parallel survey she can request it by using the option 'survey'. In this example the
survey used will be the ECV instead of the ENEMDU

{p 8 12}{stata "datalib, country(ecu) years(2006) survey(ecv) clear" :.datalib, country(ecu) years(2006) survey(ecv) clear}{p_end}

{pstd}
By default {cmd:datalib} requests the second semester of the EPHC for Argentina in 2006.
If the user requires the first semester it could be done by using the option 

{p 8 12}{stata "datalib, country(arg) years(2006) period(_s1) clear" :.datalib, country(arg) years(2006) period(_s1) clear }{p_end}

{pstd}
By default, {cmd:datalib} loads labor-income coherent observations only 
(See question 19 {browse "http://globalpractices.worldbank.org/teamsites/Poverty/LACDataLab/SitePages/Datalib%20Users%20FAQs.aspx#variables":here} for detailed explanation of coherent observations). 
however, the user might need the entire sample for calculations that do not require
income variables. In that case, by using the 'nocohh' option the user is able to obtain
the whole sample. In the case of Mexico the number of observations is almost 2% higher
when using 'nocohh'

{p 8 12}{stata "datalib, country(mex) years(2008) nocohh clear" :.datalib, country(mex) years(2008) nocohh clear}{p_end}

{marker plpppex}{...}
{dlgtab: PPP conversion}
{pstd}
Get per-capita household income ({it:ipcf}), income from 
pensions ({it:ijubi}) and  income from transfers ({it:itran}) in PPP values

{p 8 12}{stata "datalib, country(pry) years(2009) incppp(ipcf ijubi itran)" :. datalib, country(pry) years(2009) incppp(ipcf ijubi itran)}{p_end}

{dlgtab: vars(variables)}

{pstd}
Get only the variables {it:id ipcf} and {it:pondera} from the Paraguay 2006 database

{p 8 12}{stata "datalib, country(pry) years(2006) vars(id ipcf pondera) modules(all)" :. datalib, country(pry) years(2006) vars(id ipcf pondera) modules(all)}{p_end}

{dlgtab: info option}

{pstd}
Displays all the available information for Colombia

{p 8 12}{stata "datalib, country(col) info" :. datalib, country(col) info}{p_end}

{pstd}
Displays countries with actual survey in 2013

{p 8 12}{stata "datalib, year(2013) info" :. datalib, year(2013) info}{p_end}

{dlgtab: Change conversion factor}

{pstd}
Get the "poverty" variables in PPP prices of 1993 from the SEDLAC data for Argentina 2009.  

{p 8 12}{stata "datalib poverty, country(arg) years(2009) cpippp(ipc_sedlac ipc93_sedlac ppp93) clear" :. datalib poverty, country(arg) years(2009) cpippp(ipc_sedlac ipc93_sedlac ppp93) clear}{p_end}


{dlgtab: Use official CPI (for now only different for Argentina)}

{pstd}
Get the "poverty" variables using the official CPI series for Argentina 2008. 

{p 8 12}{stata "datalib poverty, country(arg) years(2008) cpippp(ipc ipc05 ppp05) clear" :. datalib poverty, country(arg) years(2008) cpippp(ipc ipc05 ppp05) clear}{p_end}


{marker circaex}{...}
{dlgtab: circa option}

{p 8 12}{stata "datalib, country(nic) circa(2000 2010) clear" :. datalib, country(nic) circa(2000 2010) clear}{p_end}

{pstd}
Given that Nicaragua releases household surveys average every four years, the user might want to use the circa
 criteria in order to compare Nicaragua with other countries in 2000 and 2010. By selecting 2005 and 2010 in the
 'circa' option {cmd:datalib} first will look for the 2000 survey and given that there is not survey for that
year it will look for the same survey in 2001. Afterwards {cmd:datalib} will look for the 2010 survey. As it is not
 found {cmd:datalib} will look for any survey in 2011 but given there is no survey for that year neither
 {cmd:datalib} will look for a survey in 2009.

 
{dlgtab: repository}

{pstd}
Creates repository file {it:project1} with the information of the versions of Colombia 2009. 

{p 8 12}{stata "datalib, country(col) year(2009) repository(create project1)" :. datalib, country(col) year(2009) repository(create project1)}{p_end}

{pstd}
Replaces existing repository file {it:project1} with the information of the versions of Colombia 2008. 

{p 8 12}{stata "datalib, country(col) year(2008) repository(create project1, replace)" :.datalib, country(col) year(2008) repository(create project1, replace)}{p_end}

{pstd}
Adds to the existing information in repository file {it:project1} the information of Colombia 2009. 
Now {it:project1} contains information for Colombia 2008 and 2009. 

{p 8 12}{stata "datalib, country(col) year(2009) repository(create project1, append)" :. datalib, country(col) year(2009) repository(create project1, append)}{p_end}

{pstd}
Forces datalib to use the versions stored in repository file {it:project1} for Colombia 2009

{p 8 12}{stata "datalib, country(col) year(2009) repository(use project1) clear" :. datalib, country(col) year(2009) repository(use project1) clear}{p_end}

{pstd}
Displays in the Stata results window the names of all the repository files in the {cmd:datalib} library

{p 8 12}{stata "datalib, repository(query)" :. datalib, repository(query)}{p_end}

{pstd}
Erases repository file {it:project1} from {cmd:datalib} library

{p 8 12}{stata "datalib,  repository(erase project1, force)" :. datalib,  repository(erase project1, force)}{p_end} 

{marker surveys}{...}
 {title:surveys}

{pstd}
Please visit the following
{browse "http://spapps.worldbank.org/apps/lcr/LACequitylab/Pages/datalib.aspx#linkid=undefined" : link}
 for data availability and comparability. 

{p 40 20 2}(Go up to {it:{help datalib##sections:Sections Menu}}){p_end}

 
{marker vars}{...}
 {title:Sedlac Variables}
{pstd}
{err:{it:NOTE: needs to be updated.}} Most of the variables below are in each of the
Sedlac data bases but depending on the country and the year, some of the variables might
be missing. Label are available in English, Spanish, and Portuguese 

{p 50 20 2}(Go up to {it:{help datalib##sections:Sections Menu}}){p_end}

 {title:Thanks for citing {cmd:SEDLAC databases} as follows}

{p 4 6 2}"Source: World Bank and CEDLAS, Socio-Economic Database for Latin America and the Caribbean".{browse "http://sedlac.econo.unlp.edu.ar/eng/"}{p_end}
 
 {title:Acknowledgements}

{p 4 6 2}This program was created as the main tool of the 
{browse "http://go.worldbank.org/IYDYF1BG70" : LAC Team for Statistical Development}
, in the Latin American and Caribbean Poverty Reduction and Economic Managment Group
of the World Bank.We appreciate Thiago's Scott help for translating all the labels 
to English and Portuguese.{p_end} 
{p 4 4 2}Comments and suggesitons are most welcome.{p_end}

 {title:Authors}

{p 4 4 4}R.Andres Castaneda Aguilar{p_end}
{p 6 6 4}Email {browse "acastanedaa@worldbank.org":acastanedaa@worldbank.org}{p_end}

{p 4 4 4}Joao Pedro Wagner De Azevedo{p_end}
{p 6 6 4}Email {browse "jazevedo@worldbank.org":jazevedo@worldbank.org}{p_end}

{title:Also see other Stata program from the LAC Team from Statistical Development}

{psee}
Online:  {helpb wbopendata} (if installed)
{p_end}
