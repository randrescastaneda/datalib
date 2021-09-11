
cap program drop datalib_sedlac_lang
program define datalib_sedlac_lang

syntax [anything(name=lang)], project(string)


if "`project'"=="03"  {             
	/*====================================================================
	1. English labels
	====================================================================*/	
	* 1.2 English
	qui cap label language en, delete
	qui cap label language en, new
	cap lab var ano_ocaux  "Survey Year"
	cap lab var asal  "Dummy for salaried worker in main occupation"
	cap lab var cohi  "Indicator of income response: =1 if coherent - individual"
	cap lab var com  "Identifier of household member"
	cap lab var dsegsale  "Receives health insurance benefits?"
	cap lab var encuesta  "Household survey name"
	cap lab var encuesta_ocaux  "Household survey name"
	cap lab var grupo_lab  "Labor group"
	cap lab var iasal  "Salary income in main occupation"
	cap lab var iasal_m  "Salary income in main occupation: Monetary"
	cap lab var icct  "Income from conditional cash transfer programs"
	cap lab var iea  "Equivalized income A"
	cap lab var ieb  "Equivalized income B"
	cap lab var iec  "Equivalized income C"
	cap lab var ied  "Equivalized income D"
	cap lab var iee  "Equivalized income E"
	cap lab var ii_m  "Total individual income - monetary"
	cap lab var ila_ppp  "Total labor income (PPP 2005 dollars)"
	cap lab var ilea_m  "Equivalized labor income - monetary"
	cap lab var ilpc  "Per capita labor income"
	cap lab var ilpc_m  "Per capita labor income - monetary"
	cap lab var inla_ppp  "Total non-labor income (PPP 2005 dollars)"
	cap lab var inlpc_m  "Per capita non-labor income - monetary"
	cap lab var ipc05_sedlac  "Average Consumer Price Index for 2005"
	cap lab var ipc_sedlac  "Price index - SEDLAC"
	cap lab var ipcf  "Per capita household income"
	cap lab var ipcf_m  "Per capita household income - monetary"
	cap lab var ipcf_ppp  "Per capita household income (PPP 2005 dollars)"
	cap lab var lengua  "Native Tongue"
	cap lab var lp_2usd  "Poverty Line at USD2.5/day"
	cap lab var lp_2usd_ppp  "Poverty Line at USD2.5/day"
	cap lab var lp_4usd  "Poverty Line at USD2.5/day"
	cap lab var lp_4usd_ppp  "Poverty Line at USD2.5/day"
	cap lab var pais  "Country"
	cap lab var pais_ocaux  "Country"
	cap lab var pondera_i  "Weight for income variables"
	cap lab var ppp05  "PPP conversion factor (2005)"
	cap lab var relacion  "Relationship with head of household (harmonized)"
	cap lab var sector1d  "Activity sector - 1 digit ISIC"
	cap lab var isco08_2d  "Occupation code, ISCO 08 (2 digits)"
	cap lab var tipo  "Database category"
	cap lab var wage  "Hourly income in main occupation"
	cap lab var celular_ind  "Has mobile phone (individual)"
	cap lab var iasalnp  "Labor income from secondary occupation - total"
	cap lab var iasalnp_m  "Labor income from secondary occupation - monetary"
	cap lab var iasalnp_nm  "Labor income from secondary occupation - non-monetary"
	cap lab var iasalp  "Labor income from main occupation - total"
	cap lab var iasalp_m  "Labor income from main occupation - monetary"
	cap lab var iasalp_nm  "Labor income from main occupation - non-monetary"
	cap lab var ictapnp  "Self-employed income from secondary occupation - total "
	cap lab var ictapnp_m  "Self-employed income from secondary occupation - monetary"
	cap lab var ictapnp_nm  "Self-employed income from secondary occupation - non-monetary"
	cap lab var ictapp  "Self-employed income from main occupation - total"
	cap lab var ictapp_m  "Self-employed income from main occupation - monetary"
	cap lab var ictapp_nm  "Self-employed income from main occupation - non-monetary"
	cap lab var ijubi_con  "Income from retirement and pensions (contributory)"
	cap lab var ijubi_ncon  "Income from retirement and pensions (non-contributory)"
	cap lab var ijubi_o  "Income from retirement and pensions (unidentified whether contributory or not)"
	cap lab var inla_otro  "Other non-labor income"
	cap lab var inocct_m  "Income from public transfers that are not CCT - monetary"
	cap lab var inocct_nm  "Income from public transfers that are not CCT - non-monetary"
	cap lab var inp  "Labor income from secondary occupation"
	cap lab var iolnp  "Other labor income from main occupation - total"
	cap lab var iolnp_m  "Other labor income from secondary occupation - monetary"
	cap lab var iolnp_nm  "Other labor income from secondary occupation - non-monetary"
	cap lab var iolp  "Other labor income from main occupation - total"
	cap lab var iolp_m  "Other labor income from main occupation - monetary"
	cap lab var iolp_nm  "Other labor income from main occupation - non-monetary"
	cap lab var ipatrnp  "Business owner income from secondary occupation - total"
	cap lab var ipatrnp_m  "Business owner income from secondary occupation - monetary"
	cap lab var ipatrnp_nm  "Business owner income from secondary occupation - non-monetary"
	cap lab var ipatrp  "Business owner income from main occupation - total"
	cap lab var ipatrp_m  "Business owner income from main occupation - monetary"
	cap lab var ipatrp_nm  "Business owner income from main occupation - non-monetary"
	cap lab var ipc11  "Average Consumer Price Index for 2011"
	cap lab var ipcf_cpi11  "Per capita household income in 2011 values"
	cap lab var ipcf_ppp11  "Per capita household income in dollars 2011 PPP"
	cap lab var ipcf_sr  "Per capita household income without implicit rent"
	cap lab var itrane_ns  "Income from unspecified public transfers"
	cap lab var itranext_m  "Income from remittances from abroad - monetary"
	cap lab var itranext_nm  "Income from remittances from abroad - non-monetary"
	cap lab var itranint_m  "Income from private transfers to the country - monetary"
	cap lab var itranint_nm  "Income from private transfers to the country - non-monetary"
	cap lab var itranp  "Income from private transfers"
	cap lab var itranp_m  "Income from private transfers - monetary"
	cap lab var itranp_ns  "Income from non-specified private transfers"
	cap lab var lengua_est  "Original survey variable for language (standardized)"
	cap lab var nuevareg  "Geographical coverage of survey"
	cap lab var ppp11  "Adjustment factor for PPP 2011"
	cap lab var raza_est  "Original survey variable for ethnicity (standardized)"
	cap lab var region_est1  "Geographical region lowest disaggregation (standardized)"
	cap lab var region_est2  "Geographical region intermediate disaggregation (standardized)"
	cap lab var region_est3  "Geographical region highest disaggregation (standardized)"
	cap lab var relab_o  "Type of employment in tertiary occupation"
	cap lab var relab_s  "Type of employment in secondary occupation"
	cap lab var relacion_est  "Relationship with head of household (standardized)"
	cap lab var strata  "Stratification variable"
	
	*New variables (GMD 2.0 and others)
	cap lab var toilet_acc  "Access to flushed toilet"
	cap lab var dis_visual   "Eye Disability"
	cap lab var dis_auditiva "Hearing Disability"
	cap lab var dis_caminar  "Walk Disability"
	cap lab var dis_concent  "Concentration Disorder"
	cap lab var dis_cuidado  "Selfcare Disability"
	cap lab var dis_leng     "Communication Disability"
	cap lab var tipo_seguro  "Type of health insurance"
	cap lab var enfermo      "Sick or injured in the last 90 days"
	cap lab var seguro_salud "Have current medical insurance"
	cap lab var visita       "visit to the doctor in the last 90 days (only those sick or injured)"
	cap lab var edad_min     "people aged 10 and older answer the labor module"
	cap lab var imp_wat_rec      "Improved water recommended estimate"
	cap lab var imp_wat_underest "Improved water underest estimate"
	cap lab var imp_wat_overest  "Improved water overest estimate"
	cap lab var piped            "Access to piped water"
	cap lab var piped_to_prem    "Access to piped water on premises"
	cap lab var water_source     "Sources of drinking water"
	cap lab var water_original   "Original water variable"
	cap lab var imp_san_rec         "Improved sanitation facility recommended estimate"
	cap lab var imp_san_underest    "Improved sanitation facility underest estimate"
	cap lab var imp_san_overest     "Improved sanitation facility overest estimate"
	cap lab var sewer               "Access to sewer"
	cap lab var open_def            "Access to any sanitation facility"
	cap lab var sanitation_source   "Main sanitation source"
	cap lab var sanitation_original "Original sanitation variable"
	cap lab var dweltyp         "Types of Dwelling"
	cap lab var techo           "Main material used for roof"
	cap lab var pared           "Main material used for external walls"
	cap lab var piso            "Main material used for floor" 
	cap lab var kitchen         "Separate kitchen in the dwelling" 
	cap lab var bath            "Bathing facility in the dwelling" 
	cap lab var rooms           "Number of habitable rooms" 
	cap lab var adq_house       "Acquisition of house" 
	cap lab var adq_land        "Acquisition of land" 
	cap lab var dwelownlti      "Legal title for Ownership" 
	cap lab var fem_dwelownlti  "Legal title for Ownership - Female" 
	cap lab var dwelownti       "Type of Legal document" 
	cap lab var selldwel        "Right to sell dwelling" 
	cap lab var transdwel       "Right to transfer dwelling" 
	cap lab var ownland         "Ownership of land" 
	cap lab var doculand        "Legal document for residential land" 
	cap lab var fem_doculand    "Legal document for residential land - female" 
	cap lab var landownti       "Land Ownership" 
	cap lab var selland        "Right to sell land" 
	cap lab var transland       "Right to transfer land" 
	cap lab var typlivqrt       "Types of living quarters" 
	cap lab var ybuilt          "Year the dwelling built" 
	cap lab var areaspace       "Area (square meters)" 
	cap lab var waste           "Main types of sewage disposal system" 
	cap lab var gas             "Connection to gas/Usage of gas" 
	cap lab var cooksource      "Main source of cooking fuel" 
	cap lab var lightsource     "Main source of lighting"
	cap lab var elec_acc               "Connection to Electricity"         
	cap lab var elechr_acc             "Electricity Availability"
	cap lab var electyp                "Type of Lightning/Electricity"
	cap lab var sewmach                "Sewing Machine"
	cap lab var stove                  "Stove or Cooker"
	cap lab var ricecook               "Rice Cooker"
	cap lab var fan                    "Fan"
	cap lab var etablet                "Electronic Tablet"
	cap lab var ewpump                 "Electric Water Pump"
	cap lab var oxcart                 "Animal Cart/Oxcart"
	cap lab var boat                   "Boat"
	cap lab var canoe                  "canoe"
	cap lab var nfl                    "No in the LFS"
	cap lab var njobs                  "Total number of jobs"
	cap lab var occusec                "Sector of Activity-Main Job"
	cap lab var occusec_s              "Sector of Activity-Secondary Job"
	cap lab var occusec_o              "Sector of Activity-Other"
	cap lab var firmsize_l             "Firm size (lower bracket)-Main Job"
	cap lab var firmsize_l_s           "Firm size (lower bracket)-Secondary Job"
	cap lab var firmsize_l_o           "Firm size (lower bracket)-Other"
	cap lab var firmsize_u             "Firm size (upper bracket)-Main Job"
	cap lab var firmsize_u_s           "Firm size (upper bracket)-Secondary Job"
	cap lab var firmsize_u_o           "Firm size (upper bracket)-Other"
	cap lab var sector1d_s             "Industry classification CIIU-Secondary Job"
	cap lab var sector1d_o             "Industry classification CIIU-Other"
	cap lab var sector_orig            "Country-Specific Industry Codes-Main Job"
	cap lab var sector_orig_s          "Country-Specific Industry Codes-Secondary Job"
	cap lab var sector_orig_o          "Country-Specific Industry Codes-Other"
	cap lab var occup                  "Occupational Classification-Main Job"
	cap lab var occup_s                "Occupational Classification-Secondary Job"
	cap lab var occup_o                "Occupational Classification-Other"
	cap lab var ila_extraord           "Total labor income extraordinary"
	cap lab var wage_base              "Last wage payment-Main Job"
	cap lab var bonos                  "Bonos-Main Job"
	cap lab var wage_base_s            "Last wage payment-Secondary Job"
	cap lab var wage_base_o            "Last wage payment-Other"
	cap lab var bonos_s                "Bonos-Secondary Job"
	cap lab var bonos_o                "Bonos-Other"
	cap lab var pwater_exp             "Total annual consumption of water supply/piped water"
	cap lab var water_exp              "Total annual consumption of water supply and hot water"
	cap lab var garbage_exp            "Total annual consumption of garbage collection"
	cap lab var sewage_exp             "Total annual consumption of sewage collection"
	cap lab var waste_exp              "Total annual consumption of garbage and sewage collection"
	cap lab var dwelothsvc_exp         "Total annual consumption of other services relating to the dwelling"
	cap lab var elec_exp               "Total annual consumption of electricity"
	cap lab var ngas_exp               "Total annual consumption of network/natural gas"
	cap lab var LPG_exp                "Total annual consumption of liquefied gas"
	cap lab var gas_exp                "Total annual consumption of network/natural and liquefied gas"
	cap lab var diesel_exp             "Total annual consumption of diesel"
	cap lab var kerosene_exp           "Total annual consumption of kerosene"
	cap lab var othliq_exp             "Total annual consumption of other liquid fuels"
	cap lab var liquid_exp             "Total annual consumption of all liquid fuels"
	cap lab var wood_exp               "Total annual consumption of firewood"
	cap lab var coal_exp               "Total annual consumption of coal"
	cap lab var peat_exp               "Total annual consumption of peat"
	cap lab var othsol_exp             "Total annual consumption of other solid fuels"
	cap lab var solid_exp              "Total annual consumption of all solid fuels"
	cap lab var othfuel_exp            "Total annual consumption of all other fuels"
	cap lab var central_exp            "Total annual consumption of central heating"
	cap lab var hwater_exp             "Total annual consumption of hot water"
	cap lab var heating_exp            "Total annual consumption of heating"
	cap lab var utl_exp                "Total annual consumption of all utilities excluding telecom and other housing"
	cap lab var dwelmat_exp            "Total annual consumption of materials for the maintenance and repair of the dwelling"
	cap lab var dwelsvc_exp            "Total annual consumption of services for the maintenance and repair of the dwelling"
	cap lab var othhousing_exp         "Total annual consumption of dwelling repair/maintenance"
	cap lab var transfuel_exp          "Total annual consumption of fuels for personal transportation"
	cap lab var landphone_exp          "Total annual consumption of landline phone services"
	cap lab var cellphone_exp          "Total annual consumption of cell phone services"
	cap lab var tel_exp                "Total consumption of all telephone services"
	cap lab var internet_exp           "Total consumption of internet services"
	cap lab var telefax_exp            "Total consumption of telefax services"
	cap lab var comm_exp               "Total consumption of all telecommunication services"
	cap lab var tv_exp                 "Total consumption of TV broadcasting services"
	cap lab var tvintph_exp            "Total consumption of tv, internet and telephone"
	
	/*====================================================================
	1.3. Common variables: same labels in Spanish but no labels in English
	====================================================================*/
	cap lab var anios_residencia  "Residency in years"
	cap lab var ant_auto  "Antiquity of car in years"
	cap lab var asistencia  "Do you receive benefits from any social assistance program?"
	cap lab var auto_nuevo  "Dummy if car is less than 5 years old: =1 if less than 5"
	cap lab var coh_oficial  "Indicator of income response: =1 if coherent - individual"
	cap lab var d_ing_ofi  "Income deciles to estimate official poverty"
	cap lab var dipcf  "Income deciles per capita household income"
	cap lab var dormi  "Number of bedrooms in household"
	cap lab var exp  "Potential experience"
	cap lab var gedad1  "Age groups:  2=[15,24], 3=[25,40], 4=[41,64]"
	cap lab var ictap_m  "Self-employed labor income - monetary"
	cap lab var ila_m  "Labor income - monetary"
	cap lab var ilaho  "Hourly income in all occupations"
	cap lab var ilaho_m  "Hourly income in all occupations - monetary"
	cap lab var ilf  "Total household labor income"
	cap lab var ilf_m  "Total household labor income - monetary"
	cap lab var ing_pob_ext  "Income used to estimate official extreme poverty"
	cap lab var ing_pob_mod  "Income used to estimate official moderate poverty"
	cap lab var ing_pob_mod_lp  "Official income / Poverty Line"
	cap lab var inla_m  "Total non-labor income - monetary"
	cap lab var inlaf  "Total household non-labor income"
	cap lab var inlaf_m  "Total household non-labor income - monetary"
	cap lab var inlpc  "Per capita non-labor income"
	cap lab var ip_m  "Income from main occupation - monetary"
	cap lab var ipatr_m  "Business owner income - monetary"
	cap lab var itf_m  "Total household income - monetary"
	cap lab var itf_sin_ri  "Total household income without imputed rent"
	cap lab var itran_m  "Income from transfers - monetary"
	cap lab var itrane_m  "Income from public transfers - monetary"
	cap lab var lp_extrema  "Official extreme poverty line"
	cap lab var lp_moderada  "Official moderate poverty line"
	cap lab var migra_ext  "Dummy for foreign migrant"
	cap lab var migra_rec  "Recent migrant"
	cap lab var migra_rur  "Dummy for national rural migrant"
	cap lab var n_ocu_h  "Number of occupied people in household"
	cap lab var n_perii_h  "Number of income earners in household"
	cap lab var n_perila_h  "Number of labor income earners in household"
	cap lab var nivedu  "Groups by years of education"
	cap lab var nro_hijos  "Number of children younger than 18 in the main household"
	cap lab var p_ing_ofi  "Income percentiles to estimate official poverty"
	cap lab var perii  "Income earner"
	cap lab var perila  "Dummy for labor income earner: =1 if labor income earner"
	cap lab var piea  "Percentiles equivalized income A"
	cap lab var pipcf  "Percentiles household per capita income"
	cap lab var presec  "Households with secondary household members"
	cap lab var pric  "Dummy for maximum educational attainment: =1 if primary complete"
	cap lab var prii  "Dummy for maximum educational attainment: =1 if primary incomplete"
	cap lab var prog_empleo  "Are you occupied in a labor program?"
	cap lab var qiea  "Quintiles equivalized income A"
	cap lab var secc  "Dummy for maximum educational attainment: =1 if secondary complete"
	cap lab var seci  "Dummy for maximum educational attainment: =1 if secondary incomplete"
	cap lab var sector  "Activity Sector: 10 categories "
	cap lab var soltero  "Dummy for marital status: single"
	cap lab var supc  "Dummy for maximum educational attainment: =1 if tertiary complete"
	cap lab var supi  "Dummy for maximum educational attainment: =1 if tertiary incomplete"
	cap lab var tarea  "Task performed in main occupation"
	cap lab var telef  "Do you have a phone (landline or mobile) in your dwelling?"
	cap lab var uso_internet  "Do you use the internet?"
	cap lab var wage_m  "Hourly income from main occupation - monetary"
	
	
	/*====================================================================
	1.4. Other labels
	====================================================================*/
	cap lab var aedu  "Years of education completed"
	cap lab var agua  "Does the dwelling have access to a water supply system?"
	cap lab var aire  "Does the household have an air conditioner?"
	cap lab var alfabeto  "Dummy for literacy"
	cap lab var antigue  "Tenure on main occupation"
	cap lab var asiste  "Dummy for attending education system"
	cap lab var auto  "Does the household have a car?"
	cap lab var banio  "Are there toilet facilities in the dwelling?"
	cap lab var bici  "Does the household have a bike?"
	cap lab var calefaccion_fija  "Does the household have access to fixed heating?"
	cap lab var casado  "Dummy for marital status: married or civil union"
	cap lab var estado_civil  "Marital status of individuals. Married includes formal,  common-law marriages, and also polygamous unions."
	cap lab var categ_lab  "Category of labor - informality"
	cap lab var celular  "Does any member of the household have a mobile phone?"
	cap lab var cloacas  "Are the toilet facilities linked to the sewer?"
	cap lab var cohh  "Dummy = 1 if coherent (household)"
	cap lab var computadora  "Does the household have a computer?"
	cap lab var contrato  "Has a signed work contract?"
	cap lab var conyuge  "Dummy for head of household spouse"
	cap lab var daguinaldo  "Receivesend-year bonus?"
	cap lab var deseo_emp  "Would  like another job or to work additional hours?"
	cap lab var desocupa  "Dummy of activity status: unemployed"
	cap lab var djubila  "Receives employment-based pension benefits?"
	cap lab var durades  "Duration of unemployment in months"
	cap lab var dvacaciones  "Benefits from paid vacations?"
	cap lab var edad  "Age"
	cap lab var edu_pub  "Dummy for type of education establishment attended"
	cap lab var elect  "Does the dwelling have access to electricity?"
	cap lab var empresa  "Type of company "
	cap lab var habita  "Number of exclusive rooms occupied by the household"
	cap lab var heladera  "Does the household have a fridge?"
	cap lab var hijo  "Dummy for head of household child"
	cap lab var hogar  "Indicator of household "
	cap lab var hogarsec  "Member of secondary household"
	cap lab var hombre  "Sex"
	cap lab var hstrp  "Hours worked in main occupation"
	cap lab var hstrs  "Hours worked in secondary occupation"
	cap lab var hstrt  "Total hours worked in all occupations"
	cap lab var icap  "Capital income"
	cap lab var ictap  "Self-employed income"
	cap lab var id  "Household unique identifier "
	cap lab var ii  "Individual total income"
	cap lab var ijubi  "Income from retirement and pensions"
	cap lab var ila  "Total labor income"
	cap lab var inla  "Total non-labor income"
	cap lab var internet_casa  "Does the household have access to internet?"
	cap lab var ip  "Income in main occupation"
	cap lab var ipatr  "Business owner income"
	cap lab var itf  "Household total income"
	cap lab var itran  "Transfers income"
	cap lab var itrane  "Public transfers income"
	cap lab var jefe  "Dummy for head of household"
	cap lab var lavarropas  "Does the household have a washing machine?"
	cap lab var matpreca  "Are the dwelling's construction materials of low-quality?"
	cap lab var miembros  "Number of members in main household"
	cap lab var migrante  "Dummy for migration status"
	cap lab var moto  "Does the household have a motorcycle?"
	cap lab var nivel  "Highest level of education attainment"
	cap lab var ocupado  "Dummy of activity status: employed"
	cap lab var ocuperma  "Permanent or temporary occupation?"
	cap lab var p_reg  "Adjustment factor for regional prices"
	cap lab var pea  "Dummy of activity status: economically active"
	cap lab var pondera  "Weighting factor"
	cap lab var precaria  "Dwelling in hazardous location"
	cap lab var propieta  "Owner of dwelling?"
	cap lab var psu  "Primary Sampling Unit"
	cap lab var raza  "Ethnicity "
	cap lab var relab  "Type of employment in main occupation"
	cap lab var renta_imp  "Imputed income for home owners"
	cap lab var sindicato  "Is member of an union?"
	cap lab var telefono_fijo  "Does the household have a fixed phone?"
	cap lab var televisor  "Does the household have a television?"
	cap lab var tv_cable  "Does the household have access to cable/satellite tv?"
	cap lab var urbano  "Dummy for residency area"
	cap lab var video  "Does the household have a VCR or DVD?"
	cap lab var ano  "Survey Year"
	
	/*====================================================================
	1.5. Value labels for categorical variables
	====================================================================*/
	
	*New PR03 value labels
	cap lab define presec_en ///
	0 "No" ///
	1 "Yes"
	cap lab values presec presec_en
	
	cap lab define gedad1_en ///
	1 "[0,14]"  ///
	2 "[15,24]" /// 
	3 "[25,40]" /// 
	4 "[41,64]" /// 
	5 "[65+]"
	cap lab values gedad1				gedad1_en
	
	cap lab define soltero_en ///
	0 "Not single" ///
	1 "Single"
	cap lab values soltero 			soltero_en
	
	cap lab define raza_en ///
	1 "Indigenous" ///
	2 "Afro-american" ///
	3 "Indigenous and afro-american" ///
	4 "Other"
	cap lab values raza 				raza_en
	
	cap lab define lengua_en ///
	1 "Occidental language" ///
	4 "Indigenous language" ///
	5 "Afro-american language" ///
	6 "Other Language" ///
	7 "Binary Question"
	cap lab values lengua			lengua_en
	
	cap lab define migra_ext_en ///
	0 "No" ///
	1 "Yes"
	cap lab values migra_ext 			migra_ext_en
	
	cap lab define migra_rur_en	///
	0 "No" ///
	1 "Yes"
	cap lab values migra_rur 			migra_rur_en
	
	cap lab define migra_rec_en ///
	0 "No" ///
	1 "Yes"
	cap lab values migra_rec 			migra_rec_en
	
	cap lab define celular_ind_en ///
	0 "No" ///
	1 "Yes"
	cap lab values celular_ind 		celular_ind_en
	
	cap lab define uso_internet_en ///
	0 "No" ///
	1 "Yes"
	cap lab values uso_internet 		uso_internet_en
	
	cap lab define   relab_s_en  ///   
	1 "Employer" ///
	2 "Salaried worker" ///
	3 "Self-employed" ///
	4 "Not salaried" ///
	5 "Unemployed" 
	cap lab values relab_s			relab_s_en
	
	cap lab define   relab_o_en  ///   
	1 "Employer" ///
	2 "Salaried worker" ///
	3 "Self-employed" ///
	4 "Not salaried" ///
	5 "Unemployed" 
	cap lab values relab_o		relab_o_en
	
	cap lab define asal_en ///
	0 "Not salaried worker" ///
	1 "Salaried worker" 
	cap lab values asal 				asal_en
	
	cap lab define prog_empleo_en ///
	0 "No" ///
	1 "Yes"
	cap lab values prog_empleo 		prog_empleo_en
	
	cap lab define asistencia_en ///
	0 "No" ///
	1 "Yes"
	cap lab values asistencia 		asistencia_en
	
	cap lab define dsegsal_en ///
	0 "No" ///
	1 "Yes"
	cap lab values dsegsal 			dsegsal_en
	
	
	*Common variables PR02 and PR03 value labels
	cap lab define   relacion_en  ///   
	1 "Head" ///
	2 "Spouse - Partner" ///
	3 "Son/Daughter" ///
	4 "Parent/Parent-in-law" ///
	5 "Other relative" ///
	6 "Non relative"
	
	cap lab define   hogarsec_en  ///   
	0 "No " ///
	1 "Yes" 
	cap lab define   hombre_en  ///   
	0 "Female" ///
	1 "Male" 
	cap lab define   jefe_en  ///   
	0 "Not head" ///
	1 "Head" 
	cap lab define   conyuge_en  ///   
	0 "Not spouse" ///
	1 "Spouse" 
	cap lab define   hijo_en  ///   
	0 "Not Son or Daughter" ///
	1 "Son /Daughter" 
	cap lab define   casado_en ///   
	0 "Not married" ///
	1 "Married" 
	cap lab define   propieta_en  ///   
	0 "Not owner" ///
	1 "Owner" 
	cap lab define   precaria_en  ///   
	0 "Not hazardous" ///
	1 "Hazardous" 
	cap lab define   matpreca_en  ///   
	0 "Non low-quality material" ///
	1 "Low-quality material" 
	cap lab define   agua_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   banio_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   cloacas_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   elect_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   heladera_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   lavarropas_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   aire_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   calefaccion_fija_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   telefono_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   telefono_fijo_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   celular_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   televisor_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   tv_cable_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   video_en  ///    
	0 "No access" ///
	1 "Access" 
	cap lab define   computadora_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   internet_casa_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   auto_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   moto_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   bici_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   alfabeto_en  ///   
	0 "Illiterate" ///
	1 "Literate" 
	cap lab define   asiste_en  ///   
	0 "Does not attend" ///
	1 "Attend" 
	cap lab define   edu_pub_en  ///   
	0 "Private establishment" ///
	1 "Public establishment" 
	cap lab define   nivel_en  ///   
	0 "Never attended" ///
	1 "Incomplete Primary Education" ///
	2 "Complete Primary Education" ///
	3 "Incomplete Secondary Education" ///
	4 "Complete Secondary Education" ///
	5 "Incomplete Tertiary Education" ///
	6 "Complete Tertiary Education" 
	cap lab define   urbano_en  ///   
	0 "Rural" ///
	1 "Urban" 
	cap lab define   migrante_en  ///   
	0 "Not migrant" ///
	1 "Migrant" 
	cap lab define   pea_en  ///   
	0 "Inactive" ///
	1 "Active" 
	cap lab define   ocupado_en  ///   
	0 "Not employed" ///
	1 "Employed" 
	cap lab define   desocupa_en  ///   
	0 "Not unemployed" ///
	1 "Unemployed" 
	cap lab define   deseo_emp_en  ///   
	0 "No" ///
	1 "Yes" 
	cap lab define   relab_en  ///   
	1 "Employer" ///
	2 "Salaried worker" ///
	3 "Self-employed" ///
	4 "Not salaried" ///
	5 "Unemployed" 
	cap lab define   empresa_en  ///   
	1 "Large" ///
	2 "Small" ///
	3 "Public" 
	cap lab define   categ_lab_en  ///   
	1 "Not Informal" ///
	2 "Informal" 
	cap lab define   sector1d_en  ///   
	1 "Agriculture, hunting and forestry" ///
	2 "Fishing" ///
	3 "Mining and quarrying" ///
	4 "Manufacturing" ///
	5 "Electricity, gas and water supply" ///
	6 "Construction" ///
	7 "Wholesale and retail trade" ///
	8 "Hotels and restaurants" ///
	9 "Transport, storage and communications" ///
	10 "Financial intermediation" ///
	11 "Real estate, renting and business activities" ///
	12 "Public administration and defence" ///
	13 "Education" ///
	14 "Health and social work" ///
	15 "Other community, social and personal service activities" ///
	16 "Activities of private households as employers " ///
	17 " Extraterritorial organizations and bodies" 
	cap lab define   isco08_2d_en  /// 
	1  "Commissioned Armed Forces Officers"  /// 
	2  "Non-commissioned Armed Forces Officers"  /// 
	3  "Armed Forces Occupations, Other Ranks"  /// 
	11 "Chief Executives, Senior Officials and Legislators"  /// 
	12 "Administrative and Commercial Managers"  /// 
	13 "Production and Specialized Services Managers"  /// 
	14 "Hospitality, Retail and Other Services Managers"  /// 
	21 "Science and Engineering Professionals"  /// 
	22 "Health Professionals"  /// 
	23 "Teaching Professionals"  /// 
	24 "Business and Administration Professionals"  /// 
	25 "Information and Communications Technology Professionals"  /// 
	26 "Legal, Social and Cultural Professionals"  /// 
	31 "Science and Engineering Associate Professionals"  /// 
	32 "Health Associate Professionals"  /// 
	33 "Business and Administration Associate Professionals"  /// 
	34 "Legal, Social, Cultural and Related Associate Professionals"  /// 
	35 "Information and Communications Technicians"  /// 
	41 "General and Keyboard Clerks"  /// 
	42 "Customer Services Clerks"  /// 
	43 "Numerical and Material Recording Clerks"  /// 
	44 "Other Clerical Support Workers"  /// 
	51 "Personal Services Workers"  /// 
	52 "Sales Workers"  /// 
	53 "Personal Care Workers"  /// 
	54 "Protective Services Workers"  /// 
	61 "Market-oriented Skilled Agricultural Workers"  /// 
	62 "Market-oriented Skilled Forestry, Fishery and Hunting Workers"  /// 
	63 "Subsistence Farmers, Fishers, Hunters and Gatherers"  /// 
	71 "Building and Related Trades Workers (excluding Electricians)"  /// 
	72 "Metal, Machinery and Related Trades Workers"  /// 
	73 "Handicraft and Printing Workers"  /// 
	74 "Electrical and Electronic Trades Workers"  /// 
	75 "Food Processing, Woodworking, Garment and Other Craft and Related Trades Workers"  /// 
	81 "Stationary Plant and Machine Operators"  /// 
	82 "Assemblers"  /// 
	83 "Drivers and Mobile Plant Operators"  /// 
	91 "Cleaners and Helpers"  /// 
	92 "Agricultural, Forestry and Fishery Labourers"  /// 
	93 "Labourers in Mining, Construction, Manufacturing and Transport"  /// 
	94 "Food Preparation Assistants"  /// 
	95 "Street and Related Sales and Services Workers"  /// 
	96 "Refuse Workers and Other Elementary Workers"
	cap lab define   contrato_en  ///   
	0 "Does not have" ///
	1 "Has" 
	cap lab define   ocuperma_en  ///   
	0 "Temporary" ///
	1 "Permanent" 
	cap lab define   djubila_en  ///   
	0 "No" ///
	1 "Yes" 
	cap lab define   dsegsale_en  ///   
	0 "No" ///
	1 "Yes" 
	cap lab define   daguinaldo_en  ///   
	0 "No" ///
	1 "Yes" 
	cap lab define   dvacaciones_en  ///   
	0 "No" ///
	1 "Yes" 
	cap lab define   sindicato_en  ///   
	0 "No" ///
	1 "Yes" 
	
	cap lab def estado_civil_en ///
	1 "married" ///
	2 "never married" ///
	3 "living together" ///
	4 "divorced/separated" ///
	5 "widowed"
	
	*New variables (GMD 2.0 and others)
	cap lab def toilet_acc_en ///
	0 "No" ///
	1 "Yes, in premise" ///
	2 "Yes, but not in premise including public toilet" ///
	3 "Yes, unstated whether in or outside premise"
	
	cap lab define   tipo_seguro_en  ///   
	0 "public or related to work (social work)" ///
	1 "private"
	
	cap lab define   enfermo_en  ///   
	0 "No" ///
	1 "Yes" 
	
	cap lab define   seguro_salud_en  ///   
	0 "No" ///
	1 "Yes" 
	
	cap lab define   visita_en  ///   
	0 "No" ///
	1 "Yes"

	cap lab define   imp_wat_rec_en  ///   
	0 "No" ///
	1 "Yes" 
	
	cap lab define   imp_wat_underest_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   imp_wat_overest_en  ///   
	0 "No" ///
	1 "Yes" 
	
	cap lab define   piped_en  ///   
	0 "No" ///
	1 "water_source 1,2 or 3"
	
	cap lab define   piped_to_prem_en  ///   
	0 "No" ///
	1 "water_source 1,2 or 3"
	
	cap lab define   water_source_en  ///   
	1  "Piped water into dwelling" ///
	2  "Piped water to yard/plot" ///
	3  "Public tap or standpipe" ///
	4  "Tubewell or borehole" ///
	5  "Protected dug well" ///
	6  "Protected spring" ///
	7  "Bottled water" ///
	8  "Rainwater" ///
	9  "Unprotected spring" ///
	10 "Unprotected dug well" ///
	11 "Cart with small tank/drum" ///
	12 "Tanker-truck" ///
	13 "Surface water" ///
	14 "Other"
	
	cap lab define   imp_san_rec_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   imp_san_underest_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   imp_san_overest_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   sewer_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   open_def_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   sanitation_source_en  ///   
	1  "A flush toilet" ///
	2  "A piped sewer system" ///
	3  "A septic tank" ///
	4  "Pit latrine" ///
	5  "Ventilated improved pit latrine" ///
	6  "Pit latrine with slab" ///
	7  "Composting toilet" ///
	8  "Special case" ///
	9  "A flush/pour flush to elsewhere" ///
	10 "A pit latrine without slab" ///
	11 "Bucket" ///
	12 "Hanging toilet or hanging latrine" ///
	13 "No facilities or bush or field" ///
	14 "Other"	
	
	cap lab define   dweltyp_en  ///   
	1  "Detached house" ///
	2  "Multi-family house" ///
	3  "Separate apartment" ///
	4  "Communal apartment" ///
	5  "Room in a larger dwelling" ///
	6  "Several buildings connected" ///
	7  "Several separate buildings" ///
	8  "Improvised housing unit" ///
	99  "Other"
	
	cap lab define   techo_en  ///   
	1  "Adobe, zarzo, lodo" ///
	2  "Paja" ///
	3  "Madera" ///
	4  "Hierro/Láminas de metal" ///
	5  "Cemento" ///
	6  "Mosaicos/Ladrillos" ///
	7  "Asbesto" ///
	99  "Other"
	
	cap lab define   pared_en  ///   
	1  "Adobe, zarzo, lodo" ///
	2  "Paja" ///
	3  "Madera" ///
	4  "Hierro/Láminas de metal" ///
	5  "Cemento" ///
	6  "Mosaicos/Ladrillos" ///
	7  "Asbesto" ///
	99  "Other"
	
	cap lab define   piso_en  ///   
	1  "Earth" ///
	3  "Wood" ///
	4  "Polished wood / mosaics" ///
	5  "Cement" ///
	6  "Bricks" ///
	7  "Asbestos" ///
	99  "Other"
	
	cap lab define   kitchen_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   bath_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   adq_house_en  ///   
	1  "Purchased - fully paid" ///
	2  "Purchased - paying" ///
	3  "Inherited" ///
	4  "Rented" ///
	5  "Gifted / loaned" ///
	6  "Received for work services" ///
	99  "Other"
	
	cap lab define   adq_land_en  ///   
	1  "Purchased - fully paid" ///
	2  "Purchased - paying" ///
	3  "Inherited" ///
	4  "Rented" ///
	5  "Gifted / loaned" ///
	6  "Received for work services" ///
	99  "Other"
	
	cap lab define   dwelownlti_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   fem_dwelownlti_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   selldwel_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   transdwel_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   ownland_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   doculand_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   fem_doculand_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   selland_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   transland_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   transland_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   waste_en  ///   
	1  "Solid waste collected on a regular basis by authorized collectors" ///
	2  "Solid waste collected on an irregular basis by authorized collectors" ///
	3  "Solid waste collected by self-appointed collectors" ///
	4  "Occupants dispose of solid waste in a local dump supervised by authorities" ///
	5  "Occupants dispose of solid waste in a local dump not supervised by authorities" ///
	6  "Occupants burn solid waste" ///
	7  "Occupants bury solid waste" ///
	8  "Occupants dispose solid waste into river, sea, creek, pond" ///
	9  "Occupants compost solid waste" ///
	10  "Other arrangement"
	
	cap lab define   gas_en  ///   
	0  "No " ///
	1  "Yes, piped gas (LNG)" ///
	2  "Yes, bottled gas (LPG)" ///
	3  "Yes, but don't know or other"
	
	cap lab define   cooksource_en  ///   
	1  "Firewood" ///
	2  "Kerosene" ///
	3  "Charcoal" ///
	4  "Electricity" ///
	5  "Gas" ///
	9  "Other"
	
	cap lab define   lightsource_en  ///   
	1  "Electricity " ///
	2  "Kerosene" ///
	3  "Candles" ///
	4  "Gas" ///
	5  "Other"
	
	cap lab define   elec_acc_en  ///   
	1  "Yes, public/quasi public" ///
	2  "Yes, private" ///
	3  "Yes, source unstated" ///
	4  "No"
	
	cap lab define   electyp_en  ///   
	1  "Electricity " ///
	2  "Gas " ///
	3  "Lamp" ///
	4  "Others"
	
	cap lab define   sewmach_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   stove_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   ricecook_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   fan_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   etablet_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   ewpump_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   oxcart_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   boat_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   canoe_en  ///   
	0 "No" ///
	1 "Yes"
	
	cap lab define   occusec_en  ///   
	1  "Public Sector, Central Government, Army" ///
	2  "Private, NGO" ///
	3  "State Owned " ///
	4  "Public or State-owned, but cannot distinguish"
	
	cap lab define   occusec_o_en  ///   
	1  "Public Sector, Central Government, Army" ///
	2  "Private, NGO" ///
	3  "State Owned" ///
	4  "Public or State-owned, but cannot distinguish"
	
	cap lab define   occup_en  ///   
	1  "Managers" ///
	2  "Professionals" ///
	3  "Technicians and associate professionals" ///
	4  "Clerical support workers" ///
	5  "Service and sales workers" ///
	6  "Skilled agricultural, forestry and fishery workers" ///
	7  "Craft and related trades workers" ///
	8  "Plant and machine operators, and assemblers" ///
	9  "Elementary occupations" ///
	10 "Armed forces occupations" ///
	99 "Other/unspecified"
	
	cap lab define   occup_s_en  ///   
	1  "Managers" ///
	2  "Professionals" ///
	3  "Technicians and associate professionals" ///
	4  "Clerical support workers" ///
	5  "Service and sales workers" ///
	6  "Skilled agricultural, forestry and fishery workers" ///
	7  "Craft and related trades workers" ///
	8  "Plant and machine operators, and assemblers" ///
	9  "Elementary occupations" ///
	10 "Armed forces occupations" ///
	99 "Other/unspecified"
	
	cap lab define   occup_o_en  ///   
	1  "Managers" ///
	2  "Professionals" ///
	3  "Technicians and associate professionals" ///
	4  "Clerical support workers" ///
	5  "Service and sales workers" ///
	6  "Skilled agricultural, forestry and fishery workers" ///
	7  "Craft and related trades workers" ///
	8  "Plant and machine operators, and assemblers" ///
	9  "Elementary occupations" ///
	10 "Armed forces occupations" ///
	99 "Other/unspecified"
	
	
	
	cap label values relacion relacion_en
	cap label values hogarsec hogarsec_en
	cap label values hombre hombre_en
	cap label values jefe jefe_en
	cap label values conyuge conyuge_en
	cap label values hijo hijo_en
	cap label values casado casado_en
	cap label values propieta propieta_en
	cap label values precaria precaria_en
	cap label values matpreca matpreca_en
	cap label values agua agua_en
	cap label values banio banio_en
	cap label values cloacas cloacas_en
	cap label values elect elect_en
	cap label values heladera heladera_en
	cap label values lavarropas lavarropas_en
	cap label values aire aire_en
	cap label values calefaccion_fija calefaccion_fija_en
	cap label values telefono telefono_en
	cap label values telefono_fijo telefono_fijo_en
	cap label values celular celular_en
	cap label values televisor televisor_en
	cap label values tv_cable tv_cable_en
	cap label values video video_en
	cap label values computadora computadora_en
	cap label values internet_casa internet_casa_en
	cap label values auto auto_en
	cap label values moto moto_en
	cap label values bici bici_en
	cap label values alfabeto alfabeto_en
	cap label values asiste asiste_en
	cap label values edu_pub edu_pub_en
	cap label values nivel nivel_en
	cap label values urbano urbano_en
	cap label values migrante migrante_en
	cap label values pea pea_en
	cap label values ocupado ocupado_en
	cap label values desocupa desocupa_en
	cap label values deseo_emp deseo_emp_en
	cap label values relab relab_en
	cap label values empresa empresa_en
	cap label values categ_lab categ_lab_en
	cap label values sector1d sector1d_en
	cap label values contrato contrato_en
	cap label values ocuperma ocuperma_en
	cap label values djubila djubila_en
	cap label values dsegsale dsegsale_en
	cap label values daguinaldo daguinaldo_en
	cap label values dvacaciones dvacaciones_en
	cap label values sindicato sindicato_en
	cap label values estado_civil estado_civil_en
	cap lab values isco08_2d isco08_2d_en
	
	*New variables (GMD 2.0 and others)
    cap  label values toilet_acc toilet_acc_en
	cap  label values tipo_seguro tipo_seguro_en
	cap  label values enfermo enfermo_en
	cap  label values seguro_salud seguro_salud_en
	cap  label values visita visita_en
	cap  label values imp_wat_rec imp_wat_rec_en      
    cap  label values imp_wat_underest imp_wat_underest_en
    cap  label values imp_wat_overest  imp_wat_overest_en
    cap  label values piped piped_en           
    cap  label values piped_to_prem piped_to_prem_en   
    cap  label values water_source water_source_en 
    cap  label values imp_san_rec imp_san_rec_en
    cap  label values imp_san_underest imp_san_underest_en
    cap  label values imp_san_overest imp_san_overest_en
    cap  label values sewer sewer_en
    cap  label values open_def open_def_en
    cap  label values sanitation_source sanitation_source_en
	cap  label values dweltyp dweltyp_en
	cap  label values techo techo_en
	cap  label values pared pared_en
	cap  label values piso             piso_en 
	cap  label values kitchen          kitchen_en
	cap  label values bath             bath_en
	cap  label values adq_house        adq_house_en
	cap  label values adq_land         adq_land_en
	cap  label values dwelownlti       dwelownlti_en
	cap  label values fem_dwelownlti   fem_dwelownlti_en
	cap  label values dwelownti        dwelownti_en
	cap  label values selldwel         selldwel_en
	cap  label values transdwel        transdwel_en
	cap  label values ownland          ownland_en
	cap  label values doculand         doculand_en
	cap  label values fem_doculand     fem_doculand_en
	cap  label values selland         sellland_en
	cap  label values transland        transland_en
	cap  label values waste            waste_en
	cap  label values gas              gas_en
	cap  label values cooksource       cooksource_en
	cap  label values lightsource      lightsource_en
	cap  label values elec_acc               elec_acc_en               
	cap  label values electyp                electyp_en
	cap  label values sewmach                sewmach_en
	cap  label values stove                  stove_en
	cap  label values ricecook               ricecook_en
	cap  label values fan                    fan_en
	cap  label values etablet                etablet_en
	cap  label values ewpump                 ewpump_en
	cap  label values oxcart                 oxcart_en
	cap  label values boat                   boat_en
	cap  label values canoe                  canoe_en
	cap  label values nfl                    nfl_en
	cap  label values njobs                  njobs_en
	cap  label values occusec                occusec_en
	cap  label values occusec_s              occusec_s_en
	cap  label values occusec_o              occusec_o_en
	cap  label values sector1d_s             sector1d_s_en
	cap  label values sector1d_o             sector1d_o_en
	cap  label values sector_orig            sector_orig_en
	cap  label values sector_orig_s          sector_orig_s_en
	cap  label values sector_orig_o          sector_orig_o_en
	cap  label values occup                  occup_en
	cap  label values occup_s                occup_s_en
	cap  label values occup_o                occup_o_en

	
	/*====================================================================
	2. Portuguese Labels
	====================================================================*/
	*1.2 Portuguese
	qui cap label language pt, delete
	qui cap label language pt, new
	
	cap lab var aedu  "Anos de educação completos"
	cap lab var agua  "Habitação possui instalação de água?"
	cap lab var aire  "Habitação possui ar-condicionado?"
	cap lab var alfabeto  "Dummy de alfabetização"
	cap lab var ano  "Ano"
	cap lab var antigue  "Antiguidade na ocupação principal"
	cap lab var asiste  "Dummy de frequência ao sistema educativo"
	cap lab var auto  "Habitação possui automóvel?"
	cap lab var banio  "Há banheiro na habitação?"
	cap lab var bici  "Habitação possui bicicleta?"
	cap lab var calefaccion_fija  "Habitação possui calefação fixa?"
	cap lab var casado  "Dummy para estado civil: casado ou unido"
	cap lab var estado_civil  "Estado civil dos indivíduos. Casado inclui casamentos formais, de direito comum e também sindicatos poligâmicos"
	cap lab var categ_lab  "Categoria de trabalho - Informalidade produtiva"
	cap lab var celular  "Algum membro do domicílio possui telefone celular?"
	cap lab var cloacas  "Banheiro é conectado a rede de esgoto?"
	cap lab var cohh  "Dummy = 1 se coerente (domicílio)"
	cap lab var computadora  "Habitação possui computador?"
	cap lab var contrato  "Possui contrato de trabalhado assinado?"
	cap lab var conyuge  "Dummy para cônjuge do chefe do domicílio"
	cap lab var daguinaldo  "Possui direito a décimo-terceiro salario?"
	cap lab var deseo_emp  "Deseja conseguir outro emprego ou trabalhar mais horas?"
	cap lab var desocupa  "Dummy de condição de atividade: desocupado"
	cap lab var djubila  "Possui direito a pensão no emprego?"
	cap lab var durades  "Duração de desemprego em meses"
	cap lab var dvacaciones  "Possui direito a férias remuneradas?"
	cap lab var edad  "Idade"
	cap lab var edu_pub  "Dummy de tipo de estabelecimento educativo frequentado"
	cap lab var elect  "Habitação possui acesso a eletricidade?"
	cap lab var empresa  "Tipo de empresa na qual trabalha"
	cap lab var habita  "Número de aposentos de uso exclusivo do domicílio"
	cap lab var heladera  "Habitação possui geladeira?"
	cap lab var hijo  "Dummy para filho do chefe do domicílio"
	cap lab var hogar  "Indicador do domicílio"
	cap lab var hogarsec  "Membro de domicílio secundário"
	cap lab var hombre  "Sexo"
	cap lab var hstrp  "Horas trabalhadas na ocupação principal"
	cap lab var hstrs  "Horas trabalhadas na ocupação secundária"
	cap lab var hstrt  "Horas trabalhadas em todas as ocupações"
	cap lab var icap  "Rendimento de capital"
	cap lab var ictap  "Rendimento pelo trabalho por conta própria"
	cap lab var id  "Identificador único do domicílio"
	cap lab var ii  "Rendimento individual total"
	cap lab var ijubi  "Rendimento de aposentadoria e pensão"
	cap lab var ila  "Rendimento total do trabalho"
	cap lab var inla  "Rendimento não-laboral total"
	cap lab var internet_casa  "Habitação tem acesso a internet?"
	cap lab var ip  "Rendimento na ocupação principal"
	cap lab var ipatr  "Rendimento pelo trabalho como patrão"
	cap lab var itf  "Rendimento total do domicílio"
	cap lab var itran  "Rendimento por transferências"
	cap lab var itrane  "Rendimento por transferências estatais"
	cap lab var jefe  "Dummy de chefe do domicílio"
	cap lab var lavarropas  "Habitação possui máquina de lavar roupa?"
	cap lab var matpreca  "Material de construção da habitação é precário?"
	cap lab var miembros  "Número de membros do domicílio principal"
	cap lab var migrante  "Condição migratória"
	cap lab var moto  "Habitação possui motocicleta?"
	cap lab var nivel  "Nível máximo de educação alcançado"
	cap lab var ocupado  "Dummy de condição de atividade: ocupado"
	cap lab var ocuperma  "Ocupação é permanente ou temporária?"
	cap lab var p_reg  "Fator de ajuste de preços regionais"
	cap lab var pea  "Dummy de condição de atividade: economicamente ativo"
	cap lab var pondera  "Fator de ponderação"
	cap lab var precaria  "Habitação em local precário"
	cap lab var propieta  "Proprietário da habitação?"
	cap lab var psu  "Unidade Primária de Amostragem"
	cap lab var raza  "Etnia"
	cap lab var relab  "Relação de trabalho na ocupação principal"
	cap lab var renta_imp  "Rendimento imputado da habitação própria"
	cap lab var sindicato  "É afiliado a algum sindicato?"
	cap lab var telefono_fijo  "Habitação possui telefone fixo?"
	cap lab var televisor  "Habitação possui televisão?"
	cap lab var tv_cable  "Habitação possui tv a cabo ou por satélite?"
	cap lab var urbano  "Dummy de área de residência"
	cap lab var video  "Habitação possui VCR ou DVD?"


	cap lab define   relacion_pt ///    1 "Jefe" 2 "Cónyuge - Esposo/a" 3 "Hijo/a - Hijastro/a" 4 "Padre - Madre - Suegro/a" 5 "Otro Pariente" 9 "No Pariente"
	1 "Chefe" ///
	2 "Conjuge" ///
	3 "Filho" ///
	4 "Pais/Sogros" ///
	5 "Outro parente" ///
	6 "Não Parente" ///

	cap lab define   hogarsec_pt ///   
	0 "Não " ///
	1 "Sim" 

	cap lab define   hombre_pt ///   
	0 "Mulher" ///
	1 "Homem" 
	cap lab define   jefe_pt ///   
	0 "Não chefe" ///
	1 "Chefe" 
	cap lab define   conyuge_pt ///   
	0 "Não cônjuge" ///
	1 "Cônjuge" 
	cap lab define   hijo_pt ///   
	0 "Não filho" ///
	1 "Filho" 
	cap lab define   casado_pt ///   
	0 "Não casado" ///
	1 "Casado" 
	cap lab define   raza_pt /// 
	1 "Indígena" ///
	2 "Afro-americano" ///
	3 "Indígena e Afro-americano" ///
	4 "Outro"
	cap lab define   propieta_pt ///   
	0 "Não proprietário" ///
	1 "Proprietário" 
	cap lab define   precaria_pt ///   
	0 "Não precário" ///
	1 "Precário" 
	cap lab define   matpreca_pt ///   
	0 "Materiais não precários" ///
	1 "Materiais precários" 
	cap lab define   agua_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   banio_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   cloacas_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   elect_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   heladera_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   lavarropas_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   aire_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   calefaccion_fija_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   telefono_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   telefono_fijo_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   celular_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   televisor_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   tv_cable_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   video_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   computadora_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   internet_casa_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   auto_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   moto_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   bici_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   alfabeto_pt ///   
	0 "Não alfabetizado" ///
	1 "Alfabetizado" 
	cap lab define   asiste_pt ///   
	0 "Não frequenta" ///
	1 "Frequenta" 
	cap lab define   edu_pub_pt ///   
	0 "Estabelecimento Privado" ///
	1 "Estabelecimento público" 
	cap lab define   nivel_pt ///   
	0 "Nunca frequentou" ///
	1 "Educação primária incompleta" ///
	2 "Educação primária completa" ///
	3 "Educação secundária incompleta" ///
	4 "Educação secundária completa" ///
	5 "Educação terciária incompleta" ///
	6 "Educação terciária completa" 
	/* cap lab define region_pt ///   
	1 "Norte" ///
	2 "Nordeste" ///
	3 "Sudeste" ///
	4 "Sul" ///
	5 "Centro-Oeste"  */
	cap lab define   urbano_pt ///   
	0 "Rural" ///
	1 "Urbano" 
	cap lab define   migrante_pt ///   
	0 "Não migrante" ///
	1 "Migrante" 
	cap lab define   pea_pt ///   
	0 "Inativo" ///
	1 "Ativo" 
	cap lab define   ocupado_pt ///   
	0 "Não ocupado" ///
	1 "Ocupado" 
	cap lab define   desocupa_pt ///   
	0 "Não desocupado" ///
	1 "Desocupado" 
	cap lab define   deseo_emp_pt ///   
	0 "Não" ///
	1 "Sim" 
	cap lab define   relab_pt ///   
	1 "Empregador" ///
	2 "Assalariado" ///
	3 "Conta própria" ///
	4 "Sem salário" ///
	5 "Desocupado" 
	cap lab define   empresa_pt ///   
	1 "Grande" ///
	2 "Pequena" ///
	3 "Pública" 
	cap lab define   categ_lab_pt ///   
	1 "Não informal" ///
	2 "Informal" 
	cap lab define   sector1d_pt ///   
	1 "Agricultura, pecuária, caça e silvicultura" ///
	2 "Pesca" ///
	3 "Exploração de minas e pedreiras" ///
	4 "Industrias manufatureiras" ///
	5 "Eletricidade, gás e água" ///
	6 "Construção" ///
	7 "Comércio" ///
	8 "Hotéis e restaurantes" ///
	9 "Transporte, armazenamento e comunicações" ///
	10 "Intermediação financeira" ///
	11 "Atividades imobiliárias, empresariais e de aluguéis" ///
	12 "Administração pública e defesa" ///
	13 "Educação" ///
	14 "Serviços sociais e de saúde" ///
	15 "Outras atividades de serviços comunitários, sociais e pessoais" ///
	16 "Serviços domésticos" ///
	17 "Organizações e órgãos extraterritoriais" 
	cap lab define   contrato_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   ocuperma_pt ///   
	0 "Temporário" ///
	1 "Permanente" 
	cap lab define   djubila_pt ///   
	0 "Não" ///
	1 "Sim" 
	cap lab define   dsegsale_pt ///   
	0 "Não" ///
	1 "Sim" 
	cap lab define   daguinaldo_pt ///   
	0 "Não" ///
	1 "Sim" 
	cap lab define   dvacaciones_pt ///   
	0 "Não" ///
	1 "Sim" 
	cap lab define   sindicato_pt ///   
	0 "Não" ///
	1 "Sim" 

	cap lab def estado_civil_pt ///
	1 "casado"                  ///
	2 "nunca casado"            ///
	3 "viver juntos"            ///
	4 "divorciado / separado"   ///
	5 "viúvo" 


	* cap label values relacion relacion_pt
	cap label values hogarsec hogarsec_pt
	cap label values hombre hombre_pt
	cap label values jefe jefe_pt
	cap label values conyuge conyuge_pt
	cap label values hijo hijo_pt
	cap label values casado casado_pt
	/* cap label values raza raza_pt */
	cap label values propieta propieta_pt
	cap label values precaria precaria_pt
	cap label values matpreca matpreca_pt
	cap label values agua agua_pt
	cap label values banio banio_pt
	cap label values cloacas cloacas_pt
	cap label values elect elect_pt
	cap label values heladera heladera_pt
	cap label values lavarropas lavarropas_pt
	cap label values aire aire_pt
	cap label values calefaccion_fija calefaccion_fija_pt
	cap label values telefono telefono_pt
	cap label values telefono_fijo telefono_fijo_pt
	cap label values celular celular_pt
	cap label values televisor televisor_pt
	cap label values tv_cable tv_cable_pt
	cap label values video video_pt
	cap label values computadora computadora_pt
	cap label values internet_casa internet_casa_pt
	cap label values auto auto_pt
	cap label values moto moto_pt
	cap label values bici bici_pt
	cap label values alfabeto alfabeto_pt
	cap label values asiste asiste_pt
	cap label values edu_pub edu_pub_pt
	cap label values nivel nivel_pt
	* cap label values region region_pt
	cap label values urbano urbano_pt
	cap label values migrante migrante_pt
	cap label values pea pea_pt
	cap label values ocupado ocupado_pt
	cap label values desocupa desocupa_pt
	cap label values deseo_emp deseo_emp_pt
	cap label values relab relab_pt
	cap label values empresa empresa_pt
	cap label values categ_lab categ_lab_pt
	cap label values sector1d sector1d_pt
	cap label values contrato contrato_pt
	cap label values ocuperma ocuperma_pt
	cap label values djubila djubila_pt
	cap label values dsegsale dsegsale_pt
	cap label values daguinaldo daguinaldo_pt
	cap label values dvacaciones dvacaciones_pt
	cap label values sindicato sindicato_pt
	cap label values estado_civil estado_civil_pt
	
	
	/*====================================================================
	3. Spanish Labels
	====================================================================*/
	cap label language es, new
	cap label var    pais            	"País"
	cap label var    ano             	"Año de la encuesta"
	cap label var    encuesta        	"Nombre de la encuesta"
	cap label var    id              	"Identificación única del hogar"
	cap label var    com             	"Identificación del componente"   
	cap label var    pondera         	"Factor de ponderación"
	cap label var    strata          	"Variable de estratificación"   
	cap label var    psu	     		"Unidad Primaria de Muestreo"	
	cap label var    relacion        	"Relación de parentesco con el jefe de hogar (armonizada)"
	cap label var    relacion_est    	"Relación de parentesco con el jefe de hogar (estandarizada)"	
	cap label var    hogarsec        	"Miembro de un hogar secundario"
	cap label var    hogar           	"Indicador de hogar"
	cap label var    miembros        	"Número de miembros del hogar principal"
	cap label var    presec          	"Hogares con miembros secundarios"
	cap label var    edad            	"Edad"
	cap label var    gedad1          	"Grupos de edad: 2=[15,24], 3=[25,40], 4=[41,64]"
	cap label var    hombre          	"Sexo"
	cap label var    jefe            	"Dummy de jefe de hogar"
	cap label var    conyuge         	"Dummy de cónyuge del jefe de hogar"
	cap label var    hijo 	           "Dummy de hijo del jefe de hogar"
	cap label var    nro_hijos       	"Número de hijos menores de 18 años en el hogar principal"
	cap label var    casado          	"Dummy de estado civil: casado o unido"
	cap label var    estado_civil   	"Estado Civil. Casado incluye matrimonio formal, unión libre y unión en poligamia"
	cap label var    soltero         	"Dummy de estado civil: soltero"
	cap label var    raza            	"Raza"
	cap label var    raza_est	     	"Variable original de raza de la encuesta (estandarizada)"	 
	cap label var    lengua          	"Lengua nativa"
	cap label var    lengua_est	     	"Variable original de lengua de la encuesta (estandarizada)"
	cap label var    propieta        	"Es propietario de la vivienda que habita?"
	cap label var    habita          	"Número de habitaciones de uso exclusivo del hogar"
	cap label var    dormi           	"Número de dormitorios en la vivienda"
	cap label var    precaria        	"Vivienda ubicada en lugar precario"
	cap label var    matpreca        	"Son los materiales de construcción de la vivienda precarios?"
	cap label var    region_est1     	"Región geográfica desagregación menor (estandarizada)" 
	cap label var    region_est2     	"Región geográfica desagregación intermedia (estandarizada)" 
	cap label var    region_est3     	"Región geográfica desagregación mayor (estandarizada)" 
	cap label var    urbano          	"Dummy de area de residencia"
	cap label var    migrante        	"Condición migratoria"
	cap label var    migra_ext       	"Dummy de migrante extranjero"
	cap label var    migra_rur       	"Dummy de migrante nacional rural"
	cap label var    anios_residencia  	"Años de residencia"
	cap label var    migra_rec       	"Migrante reciente"
	cap label var    nuevareg        	"Cobertura geográfica de la encuesta"
	cap label var    agua            	"Tiene instalación de agua en la vivienda?"
	cap label var    banio           	"Tiene baño higiénico en la vivienda?"
	cap label var    cloacas         	"Tiene baño conectado a cloacas?"
	cap label var    elect          	"Tiene electricidad en la vivienda?"
	cap label var    telef          	"Tiene teléfono (fijo o celular) en la vivienda?"
	cap label var    heladera        	"Tiene heladera en la vivienda?"
	cap label var    lavarropas      	"Tiene lavarropas en la vivienda?"
	cap label var    aire           	"Tiene aire acondicionado en la vivienda?"
	cap label var    calefaccion_fija 	"Tiene calefacción fija en la vivienda?"
	cap label var    telefono_fijo    	"Tiene teléfono fijo en la vivienda?"
	cap label var    celular         	"Tiene teléfono celular al menos un miembro del hogar?"
	cap label var    celular_ind     	"Tiene teléfono celular (individual)"
	cap label var    televisor       	"Tiene televisor en la vivienda?"
	cap label var    tv_cable         	"Tiene TV por cable o satelital en la vivienda?"
	cap label var    video           	"Tiene VCR o DVD en la vivienda?"
	cap label var    computadora     	"Tiene computadora en la vivienda?"
	cap label var    internet_casa   	"Tiene conexión de internet  en la vivienda?"
	cap label var    uso_internet    	"Utiliza internet?"
	cap label var    auto            	"Tiene automóvil el hogar?"
	cap label var    ant_auto        	"Años de antiguedad del automóvil"
	cap label var    auto_nuevo      	"Dummy de automóvil de menos de 5 años: =1 menos de 5 años"
	cap label var    moto            	"Tiene motocicleta el hogar?"
	cap label var    bici            	"Tiene bicicleta el hogar?"
	cap label var    alfabeto        	"Dummy de alfabetización"
	cap label var    asiste          	"Dummy de asistencia al sistema educativo"
	cap label var    edu_pub         	"Dummy de tipo de establecimiento al que asiste"
	cap label var    aedu	     		"Años de educación aprobados"
	cap label var    nivedu          	"Grupos de años de educación"
	cap label var    nivel           	"Máximo nivel educativo alcanzado"
	cap label var    prii            	"Dummy de máximo nivel educativo alcanzado: =1 si primaria incompleta"
	cap label var    pric            	"Dummy de máximo nivel educativo alcanzado: =1 si primaria completa"
	cap label var    seci            	"Dummy de máximo nivel educativo alcanzado: =1 si secundaria incompleta"
	cap label var    secc            	"Dummy de máximo nivel educativo alcanzado: =1 si secundaria completa"
	cap label var    supi            	"Dummy de máximo nivel educativo alcanzado: =1 si superior incompleta"
	cap label var    supc            	"Dummy de máximo nivel educativo alcanzado: =1 si superior completa"
	cap label var    exp             	"Experiencia potencial"
	cap label var    pea             	"Dummy de condición de actividad: económicamente activo"
	cap label var    ocupado         	"Dummy de condición de actividad: ocupado"
	cap label var    desocupa        	"Dummy de condición de actividad: desocupado"
	cap label var    durades          	"Duración del desempleo en meses"
	cap label var    hstrt            	"Horas trabajadas en todas las ocupaciones"
	cap label var    hstrs            	"Horas trabajadas en la ocupación secundaria"
	cap label var    hstrp            	"Horas trabajadas en la ocupación principal"
	cap label var    deseo_emp        	"Desea conseguir otro empleo o trabajar más horas?"
	cap label var    antigue          	"Antiguedad en la ocupación principal"
	cap label var    relab            	"Relación laboral en la ocupación principal"
	cap label var    relab_s          	"Relación laboral en la ocupación secundaria"
	cap label var    relab_o          	"Relación laboral en la ocupación terciaria"
	cap label var    asal             	"Dummy de asalariado en la ocupación principal" 
	cap label var    empresa          	"Tipo de empresa en la que trabaja"
	cap label var    grupo_lab        	"Grupo laboral" 
	cap label var    categ_lab         "Categoría laboral - Informalidad Productiva"
	cap label var    sector1d           "Sector de actividad a 1 digito CIIU" 
	cap label var    sector            " Sector de actividad: 10 categorías"
	cap label var    tarea             "Tarea que realiza en la ocupación principal"
	cap label var    contrato          "Tiene contrato laboral firmado?"
	cap label var    ocuperma          "Es su ocupación permanente o temporaria?"
	cap label var    djubila           "Tiene derecho a jubilación en su empleo?"
	cap label var    dsegsale          "Tiene derecho a seguro de salud en su empleo?"
	cap label var    daguinaldo        "Tiene derecho a recibir aguinaldo en su empleo?"
	cap label var    dvacaciones       "Tiene derecho a vacaciones pagas en su empleo?"
	cap label var    sindicato         "Se encuentra afiliado a sindicato?"
	cap label var    prog_empleo       "Se encuentra ocupado en un programa de empleo?"
	cap label var    n_ocu_h           "Número de ocupados en el hogar"
	cap label var    asistencia        "Recibe programa de asistencia social?"
	cap label var    dsegsal           "Tiene seguro de salud?"
	cap label var    iasalp_m          "Ingreso asalariado en la ocupación principal - monetario"
	cap label var    iasalp_nm         "Ingreso asalariado en la ocupación principal - no monetario"
	cap label var    ictapp_m          "Ingreso por cuenta propia en la ocupación principal - monetario"
	cap label var    ictapp_nm         "Ingreso por cuenta propia en la ocupación principal - no monetario"
	cap label var    ipatrp_m          "Ingreso por patrón en la ocupación principal - monetario"
	cap label var    ipatrp_nm         "Ingreso por patrón en la ocupación principal - no monetario"
	cap label var    iolp_m            "Otros ingresos laborales en la ocupación principal - monetario"
	cap label var    iolp_nm           "Otros ingresos laborales en la ocupación principal - no monetario"
	cap label var    iasalnp_m         "Ingreso asalariado en la ocupación no principal - monetario"
	cap label var    iasalnp_nm        "Ingreso asalariado en la ocupación no principal - no monetario"
	cap label var    ictapnp_m         "Ingreso por cuenta propia en la ocupación no principal - monetario"
	cap label var    ictapnp_nm        "Ingreso por cuenta propia en la ocupación no principal - no monetario"
	cap label var    ipatrnp_m         "Ingreso por patrón en la ocupación no principal - monetario"
	cap label var    ipatrnp_nm        "Ingreso por patrón en la ocupación no principal - no monetario"
	cap label var    iolnp_m           "Otros ingresos laborales en la ocupación no principal - monetario"
	cap label var    iolnp_nm          "Otros ingresos laborales en la ocupación no principal - no monetario"
	cap label var    ijubi_con         "Ingreso por jubilaciones y pensiones contributivas"
	cap label var    ijubi_ncon        "Ingreso por jubilaciones y pensiones no contributivas"
	cap label var    ijubi_o	       "Ingreso por jubilaciones y pensiones (no identificado si contributiva o no)"
	cap label var    icap              "Ingreso del capital"
	cap label var    icct	       	    "Ingreso por programas de transferencias monetarias condicionadas"	 
	cap label var    inocct_m	       "Ingreso por transferencias estatales no CCT - monetario"	
	cap label var    inocct_nm         "Ingreso por transferencias estatales no CCT - no monetario"
	cap label var    itrane_ns         "Ingreso por transferencias estatales no especificadas"
	cap label var    itranext_m        "Ingreso por remesas del exterior - monetario"
	cap label var    itranext_nm       "Ingreso por remesas del exterior - no monetario"
	cap label var    itranint_m        "Ingreso por transferencias privadas del país - monetario"
	cap label var    itranint_nm       "Ingreso por transferencias privadas del país - no monetario"
	cap label var    itranp_ns         "Ingreso por transferencias privadas no especificadas"
	cap label var    inla_otro         "Otros ingresos no laborales"
	cap label var    ipatrp            "Ingreso por patrón en la ocupación principal - total"
	cap label var    iasalp            "Ingreso asalariado en la ocupación principal - total"
	cap label var    ictapp            "Ingreso por cuenta propia en la ocupación principal - total"
	cap label var    iolp	       		"Otros ingresos laborales en la ocupación principal - total"
	cap label var    ip_m              "Ingreso en la ocupación principal - monetario"
	cap label var    ip                "Ingreso en la ocupación principal"
	cap label var    wage_m            "Ingreso horario en la ocupación principal - monetario"
	cap label var    wage              "Ingreso horario en la ocupación principal" 
	cap label var    ipatrnp	       "Ingreso por patrón en la ocupación no principal - total"	
	cap label var    iasalnp           "Ingreso asalariado en la ocupación no principal - total"
	cap label var    ictapnp           "Ingreso por cuenta propia en la ocupación no principal - total"
	cap label var    iolnp             "Otros ingresos laborales en la ocupación principal - total"
	cap label var    inp	       		"Ingreso por trabajo en la actividad no principal"	 
	cap label var    ipatr_m           "Ingreso por trabajo como patrón - monetario"
	cap label var    ipatr             "Ingreso por trabajo como patrón"
	cap label var    iasal_m           "Ingreso por trabajo como asalariado - monetario" 
	cap label var    iasal             "Ingreso por trabajo como asalariado" 
	cap label var    ictap_m           "Ingreso por trabajo como cuentapropista - monetario"
	cap label var    ictap             "Ingreso por trabajo como cuentapropista"
	cap label var    ila_m             "Ingreso laboral - monetario"
	cap label var    ila               "Ingreso laboral total"
	cap label var    ilaho_m           "Ingreso horario en todas las ocupaciones - monetario"
	cap label var    ilaho             "Ingreso horario en todas las ocupaciones"
	cap label var    perila            "Dummy de perceptor de ingresos laborales: =1 si percibe ingreso laboral"
	cap label var    ijubi             "Ingreso por jubilaciones y pensiones"
	cap label var    itranp_m          "Ingreso por transferencias privadas - monetario"
	cap label var    itranp            "Ingreso por transferencias privadas"
	cap label var    itrane_m          "Ingreso por transferencias estatales - monetario"
	cap label var    itrane            "Ingreso por transferencias estatales"
	cap label var    itran_m           "Ingreso por transferencias - monetario"
	cap label var    itran             "Ingreso por transferencia"
	cap label var    inla_m            "Ingreso no laboral total - monetario"
	cap label var    inla              "Ingreso no laboral total"
	cap label var    ii_m              "Ingreso individual total - monetario" 
	cap label var    ii                "Ingreso individual total"
	cap label var    perii             "Perceptor ingresos"
	cap label var    n_perila_h        "Número de perceptores de ingreso laboral en el hogar"
	cap label var    n_perii_h         "Número de perceptores de ingreso individual en el hogar"
	cap label var    ilf_m             "Ingreso laboral total familiar - monetario"
	cap label var    ilf               "Ingreso laboral total familiar"
	cap label var    inlaf_m           "Ingreso no laboral total familiar - monetario"
	cap label var    inlaf             "Ingreso no laboral total familiar"
	cap label var    itf_m             "Ingreso total familiar - monetario"
	cap label var    itf_sin_ri        "Ingreso total familiar sin renta imputada"
	cap label var    renta_imp         "Renta imputada de la vivienda propia"
	cap label var    itf               "Ingreso total familiar"
	cap label var    cohi              "Indicador de respuesta de ingresos: =1 si coherente - individual"
	cap label var    cohh              "Indicador de respuesta de ingresos: =1 si respuesta del hogar coherente"
	cap label var    coh_oficial       "Indicador de respuesta de ingresos: =1 si respuesta del hogar coherente - para estimación oficial"
	cap label var    ilpc_m            "Ingreso laboral per cápita - monetario" 
	cap label var    ilpc              "Ingreso laboral per cápita" 
	cap label var    inlpc_m           "Ingreso no laboral per cápita - monetario" 
	cap label var    inlpc             "Ingreso no laboral per cápita"
	cap label var    ipcf_sr           "Ingreso per cápita familiar sin renta implícita"
	cap label var    ipcf_m            "Ingreso per cápita familiar - monetario" 
	cap label var    ipcf              "Ingreso per cápita familiar" 
	cap label var    iea               "Ingreso equivalente A" 
	cap label var    ieb               "Ingreso equivalente B" 
	cap label var    iec               "Ingreso equivalente C" 
	cap label var    ied               "Ingreso equivalente D" 
	cap label var    iee               "Ingreso equivalente E" 
	cap label var    ilea_m            "Ingreso laboral equivalente - monetario" 
	cap label var    lp_extrema	       "Línea de pobreza extrema  oficial"
	cap label var    lp_moderada       "Línea de pobreza moderada oficial"
	cap label var    ing_pob_ext       "Ingreso utilizado para estimar la pobreza extrema oficial"
	cap label var    ing_pob_mod       "Ingreso utilizado para estimar la pobreza moderada oficial"
	cap label var    ing_pob_mod_lp    "Ingreso oficial / Linea de Pobreza"
	cap label var    p_reg	       		"Factor ajuste por precios regionales"
	cap label var    ipc	       		"IPC mes base" 
	cap label var    pipcf	       		"Percentiles ingreso per cápita familiar"
	cap label var    dipcf	       		"Deciles ingreso per cápita familiar"
	cap label var    p_ing_ofi	   		"Percentiles ingreso oficial para estimar pobreza"
	cap label var    d_ing_ofi	   		"Deciles ingreso oficial para estimar pobreza"
	cap label var    piea	       		"Percentiles ingreso equivalente A"
	cap label var    qiea	       		"Quintiles ingreso equivalente A"
	cap label var    pondera_i	   		"Ponderador para variables de ingreso"  
	cap label var    ipc05	       		"Índice de Precios al Consumidor Promedio de 2005"
	cap label var    ipc11	       		"Índice de Precios al Consumidor Promedio de 2011"
	cap label var    ppp05	       		"Factor de Ajuste de PPP 2005"
	cap label var    ppp11	       		"Factor de Ajuste de PPP 2011"
	cap label var    ipcf_cpi05	       "Ingreso per cápita familiar en valores de 2005"
	cap label var    ipcf_cpi11	       "Ingreso per cápita familiar en valores de 2011"
	cap label var    ipcf_ppp05	       "Ingreso per cápita familiar en dólares de 2005"
	cap label var    ipcf_ppp11	       "Ingreso per cápita familiar en dólares de 2011"
	
	**GMD 2.0 (Spanish)
	cap label var etablet                "Electronic Tablet"
	
	

	cap label define relacion_es 			1 "Jefe" 2 "Cónyuge - Esposo/a" 3 "Hijo/a - Hijastro/a" 4 "Padre - Madre - Suegro/a" 5 "Otro Pariente" 6 "No Pariente"
	cap label define hogarsec_es			0 "No" 1 "Si"
	cap label define presec_es 0 "No" 1 "Si"
	cap label define gedad1_es 			1 "[0,14]" 2 "[15,24]" 3 "[25,40]" 4 "[41,64]" 5 "[65+]"
	cap label define hombre_es 			0 "Mujer" 1 "Hombre"
	cap label define jefe_es 0 "No Jefe" 1 "Jefe"
	cap label define conyuge_es 			0 "No Cónyuge" 1 "Cónyuge"
	cap label define hijo_es 				0 "No Hijo" 1 "Hijo"
	cap label define casado_es 			0 "No Casado" 1 "Casado"
	cap label define soltero_es 			0 "No Soltero" 1 "Soltero"
	cap label define raza_es 				1 "Indígena" 2 "Afroamericano" 3 "Indígena y Afroamericano" 4 "Otro"
	cap label define lengua_es			1 "Lengua Occidental" 4 "Lengua Indígena" 5 "Lengua Afroamericana" 6 "Otra lengua" 7 "Pregunta binaria"
	cap label define propieta_es 			0 "No Propietario" 1 "Propietario"
	cap label define precaria_es  			0 "No Precario" 1 "Precario"
	cap label define matpreca_es  			0 "Materiales no Precarios" 1 "Materiales Precarios"
	cap label define urbano_es  			0 "Rural" 1 "Urbano"
	cap label define migrante_es  			0 "No migrante" 1 "Migrante"
	cap label define migra_ext_es  			0 "No" 1 "Si"
	cap label define migra_rur_es 			0 "No" 1 "Si"
	cap label define migra_rec_es  			0 "No" 1 "Si"
	cap label define agua_es  				0 "No tiene" 1 "Tiene"
	cap label define banio_es  				0 "No tiene" 1 "Tiene"
	cap label define cloacas_es  			0 "No tiene" 1 "Tiene"
	cap label define elect_es  				0 "No tiene" 1 "Tiene"
	cap label define telef_es  				0 "No tiene" 1 "Tiene"
	cap label define heladera_es  			0 "No tiene" 1 "Tiene"
	cap label define lavarropas_es  		0 "No tiene" 1 "Tiene"
	cap label define aire_es  				0 "No tiene" 1 "Tiene"
	cap label define calefaccion_fija_es  	0 "No tiene" 1 "Tiene"
	cap label define telefono_fijo_es  		0 "No tiene" 1 "Tiene"
	cap label define celular_es  			0 "No tiene" 1 "Tiene"
	cap label define celular_ind_es  		0 "No tiene" 1 "Tiene"
	cap label define televisor_es  			0 "No tiene" 1 "Tiene"
	cap label define tv_cable_es  			0 "No tiene" 1 "Tiene"
	cap label define video_es  				0 "No tiene" 1 "Tiene"
	cap label define computadora_es  		0 "No tiene" 1 "Tiene"
	cap label define internet_casa_es  		0 "No tiene" 1 "Tiene"
	cap label define uso_internet_es  		0 "No utiliza" 1 "Utiliza"
	cap label define auto_es  				0 "No tiene" 1 "Tiene"
	cap label define moto_es  				0 "No tiene" 1 "Tiene"
	cap label define bici_es  				0 "No tiene" 1 "Tiene"
	cap label define alfabeto_es  			0 "No Alfabetizado" 1 "Alfabetizado"
	cap label define asiste_es  			0 "No asiste" 1 "Asiste"
	cap label define edu_pub_es  			0 "Establecimiento privado" 1 "Establecimiento Público"
	cap label define nivedu_es  			1 "[0,8]" 2 "[9,13]" 3 "[14+]" 
	cap label define nivel_es  				0 "Nunca Asistió" 1 "Primaria Incompleta" 2 "Primaria Completa" 3 "Secundaria Incompleta" 4 "Secundaria Completa" 5 "Superior Incompleta" 6 "Superior Completa"
	cap label define pea_es  				0 "Inactivo" 1 "Activo"
	cap label define ocupado_es  			0 "No ocupado" 1 "Ocupado"
	cap label define desocupa_es  			0 "No desocupado" 1 "Desocupado"
	cap label define deseo_emp_es  			0 "No" 1 "Si"
	cap label define relab_es  				1 "Empleador" 2 "Asalariado" 3 "Cuentapropista" 4 "Sin Salario" 5 "Desocupado"
	cap label define relab_s_es  			1 "Empleador" 2 "Asalariado" 3 "Cuentapropista" 4 "Sin Salario" 5 "Desocupado"
	cap label define relab_o_es  			1 "Empleador" 2 "Asalariado" 3 "Cuentapropista" 4 "Sin Salario" 5 "Desocupado"
	cap label define asal_es  				0 "No asalariado" 1 "Asalariado" 
	cap label define empresa_es  			1 "Grande" 2 "Chica" 3 "Pública"
	cap label define categ_lab_es  			1 "No informal" 2 "Informal" 
	cap label define sector1d_es  			1 "Agricultura, Ganadería, Caza y Silvicultura" 2 "Pesca" 3 "Explotación de Minas y Canteras" 4 "Industrias Manufactureras" 5 "Suministro de Electricidad, Gas y Agua" 6 "Construcción" 7 "Comercio" 8 "Hoteles y Restaurantes" 9 "Transporte, Almacenamiento y Comunicaciones" 10 "Intermediación Financiera" 11 "Actividades Inmobiliarias, Empresariales y de Alquiler" 12 "Administración Pública y Defensa" 13 "Enseñanza" 14 "Servicios Sociales y de Salud" 15 "Otras Actividades de Servicios Comunitarios, Sociales y Personales" 16 "Hogares Privados con Servicio Doméstico" 17 "Organizaciones y Órganos Extraterritoriales" 
	cap label define contrato_es 			0 "No tiene" 1 "Tiene"
	cap label define ocuperma_es  			0 "Temporaria" 1 "Permanente"
	cap label define djubila_es  			0 "No" 1 "Si"
	cap label define dsegsale_es  			0 "No" 1 "Si"
	cap label define daguinaldo_es  		0 "No" 1 "Si"
	cap label define dvacaciones_es  		0 "No" 1 "Si"
	cap label define sindicato_es  			0 "No" 1 "Si"
	cap label define prog_empleo_es  		0 "No" 1 "Si"
	cap label define asistencia_es  		0 "No" 1 "Si"
	cap label define dsegsal_es  			0 "No" 1 "Si"
	cap label define estado_civil_es ///
	1 "Casado" ///
	2 "Nunca casado" ///
	3 "unión libre" ///
	4 "divorciado/separado" ///
	5 "viudo/a" 
	
	*GMD 2.0 (Spanish)
	cap label define etablet_es  			0 "No" 1 "Si"
	
	cap label values relacion 			relacion_es
	cap label values hogarsec 			hogarsec_es
	cap label values presec presec_es
	cap label values gedad1 			gedad1_es
	cap label values hombre 			hombre_es
	cap label values jefe jefe_es
	cap label values conyuge 			conyuge_es
	cap label values hijo 				hijo_es
	cap label values casado 			casado_es
	cap label values soltero 			soltero_es
	cap label values raza 				raza_es
	cap label values lengua 			lengua_es
	cap label values propieta 			propieta_es 
	cap label values precaria 			precaria_es
	cap label values matpreca 			matpreca_es 
	cap label values urbano 			urbano_es 
	cap label values migrante 			migrante_es 
	cap label values migra_ext 			migra_ext_es 
	cap label values migra_rur 			migra_rur_es 
	cap label values migra_rec 			migra_rec_es 
	cap label values agua 				agua_es 
	cap label values banio 				banio_es 
	cap label values cloacas 			cloacas_es 
	cap label values elect 				elect_es 
	cap label values telef 				telef_es 
	cap label values heladera 			heladera_es 
	cap label values lavarropas 		lavarropas_es 
	cap label values aire 				aire_es 
	cap label values calefaccion_fija 	calefaccion_fija_es 
	cap label values telefono_fijo 		telefono_fijo_es 
	cap label values celular 			celular_es 
	cap label values celular_ind 		celular_ind_es 
	cap label values televisor 			televisor_es 
	cap label values tv_cable 			tv_cable_es 
	cap label values video 				video_es 
	cap label values computadora 		computadora_es 
	cap label values internet_casa 		internet_casa_es 
	cap label values uso_internet 		uso_internet_es 
	cap label values auto 				auto_es 
	cap label values moto 				moto_es 
	cap label values bici 				bici_es 
	cap label values alfabeto 			alfabeto_es 
	cap label values asiste 			asiste_es 
	cap label values edu_pub 			edu_pub_es 
	cap label values nivedu 			nivedu_es 
	cap label values nivel 				nivel_es 
	cap label values pea 				pea_es 
	cap label values ocupado 			ocupado_es 
	cap label values desocupa 			desocupa_es  
	cap label values deseo_emp 			deseo_emp_es  
	cap label values relab 				relab_es 
	cap label values relab_s 			relab_s_es 
	cap label values relab_o 			relab_o_es 
	cap label values asal 				asal_es 
	cap label values empresa 			empresa_es 
	cap label values categ_lab 			categ_lab_es 
	cap label values sector1d 			sector1d_es 
	cap label values contrato 			contrato_es 
	cap label values ocuperma 			ocuperma_es 
	cap label values djubila 			djubila_es 
	cap label values dsegsale 			dsegsale_es 
	cap label values daguinaldo 		daguinaldo_es 
	cap label values dvacaciones 		dvacaciones_es 
	cap label values sindicato 			sindicato_es 
	cap label values prog_empleo 		prog_empleo_es 
	cap label values asistencia 		asistencia_es 
	cap label values dsegsal 			dsegsal_es 
	cap label values estado_civil       estado_civil_es
	cap label values etablet            etablet_es
	
	
	
	*2 define language
	if ("`lang'" == "") local lang "en"
	
	label language `lang'
}

if "`project'"!="03"  {
	
	

	* 1.1 it is originally in Spanish
	qui cap label language es, delete
	qui cap label language es, new
	
	
	*1.2 Portuguese
	qui cap label language pt, delete
	qui cap label language pt, new
	
	cap lab var   pais   "Pais"
	cap lab var   ano   "Ano"
	cap lab var   lp_2usd   "Linha de Pobreza USD2.5/dia"
	cap lab var   lp_2usd_ppp   "Linha de Pobreza USD2.5/dia PPP"
	cap lab var   lp_4usd   "Linha de Pobreza USD4/dia"
	cap lab var   lp_4usd_ppp   "Linha de Pobreza USD4/dia PPP"
	cap lab var   id   "Identificador único do domicílio"
	cap lab var   com   "Identificador do membro do domicílio"
	cap lab var   pondera   "Fator de ponderação"
	cap lab var   pondera_i   "Fator de ponderação para a renda"
	cap lab var   relacion   "Relação de parentesco com chefe do domícilio"
	cap lab var   hogar   "Indicador do domicílio"
	cap lab var   hogarsec   "Membro de domicílio secundário"
	cap lab var   edad   "Idade"
	cap lab var   miembros   "Número de membros do domicílio principal"
	cap lab var   hombre   "Sexo"
	cap lab var   jefe   "Dummy de chefe do domicílio"
	cap lab var   conyuge   "Dummy para cônjuge do chefe do domicílio"
	cap lab var   hijo   "Dummy para filho do chefe do domicílio"
	cap lab var   casado   "Dummy para estado civil: casado ou unido"
	cap lab var   raza   "Etnia"
	cap lab var   propieta   "Proprietário da habitação?"
	cap lab var   habita   "Número de aposentos de uso exclusivo do domicílio"
	cap lab var   precaria   "Habitação em local precário"
	cap lab var   matpreca   "Material de construção da habitação é precário?"
	cap lab var   agua   "Habitação possui instalação de água?"
	cap lab var   banio   "Há banheiro na habitação?"
	cap lab var   cloacas   "Banheiro é conectado a rede de esgoto?"
	cap lab var   elect   "Habitação possui acesso a eletricidade?"
	cap lab var   heladera   "Habitação possui geladeira?"
	cap lab var   lavarropas   "Habitação possui máquina de lavar roupa?"
	cap lab var   aire   "Habitação possui ar-condicionado?"
	cap lab var   calefaccion_f~a   "Habitação possui calefação fixa?"
	cap lab var   telefono   "Habitação possui telefone?"
	cap lab var   telefono_fijo   "Habitação possui telefone fixo?"
	cap lab var   celular   "Algum membro do domicílio possui telefone celular?"
	cap lab var   televisor   "Habitação possui televisão?"
	cap lab var   tv_cable   "Habitação possui tv a cabo ou por satélite?"
	cap lab var   video   "Habitação possui VCR ou DVD?"
	cap lab var   computadora   "Habitação possui computador?"
	cap lab var   internet_casa   "Habitação tem acesso a internet?"
	cap lab var   auto   "Habitação possui automóvel?"
	cap lab var   moto   "Habitação possui motocicleta?"
	cap lab var   bici   "Habitação possui bicicleta?"
	cap lab var   alfabeto   "Dummy de alfabetização"
	cap lab var   asiste   "Dummy de frequência ao sistema educativo"
	cap lab var   edu_pub   "Dummy de tipo de estabelecimento educativo frequentado"
	cap lab var   aedu   "Anos de educação completos"
	cap lab var   nivel   "Nível máximo de educação alcançado"
	cap lab var   stratum   "Variável de estratificação"
	cap lab var   psu   "Unidade Primária de Amostragem"
	cap lab var   reg_uf   "Unidade da Federação"
	cap lab var   reg_upa   "Delimitação de município"
	cap lab var   reg_v4727   "Código de área censitária"
	cap lab var   reg_v4728   "Código de unidade censitária"
	cap lab var   region   "Região geográfica"
	cap lab var   urbano   "Dummy de área de residência"
	cap lab var   migrante   "Condição migratória"
	cap lab var   pea   "Dummy de condição de atividade: economicamente ativo"
	cap lab var   ocupado   "Dummy de condição de atividade: ocupado"
	cap lab var   desocupa   "Dummy de condição de atividade: desocupado"
	cap lab var   durades   "Duração de desemprego em meses"
	cap lab var   deseo_emp   "Deseja conseguir outro emprego ou trabalhar mais horas?"
	cap lab var   hstrt   "Horas trabalhadas em todas as ocupações"
	cap lab var   hstrp   "Horas trabalhadas na ocupação principal"
	cap lab var   antigue   "Antiguidade na ocupação principal"
	cap lab var   relab   "Relação de trabalho na ocupação principal"
	cap lab var   empresa   "Tipo de empresa na qual trabalha"
	cap lab var   categ_lab   "Categoria de trabalho - Informalidade produtiva"
	cap lab var   sector1d   "Setor de atividade - 1 dígito CIIU"
	cap lab var   contrato   "Possui contrato de trabalhado assinado?"
	cap lab var   djubila   "Possui direito a pensão no emprego?"
	cap lab var   ocuperma   "Ocupação é permanente ou temporária?"
	cap lab var   dsegsale   "Possui direito a seguro-saúde?"
	cap lab var   daguinaldo   "Possui direito a décimo-terceiro salario?"
	cap lab var   dvacaciones   "Possui direito a férias remuneradas?"
	cap lab var   sindicato   "É afiliado a algum sindicato?"
	cap lab var   ip   "Rendimento na ocupação principal"
	cap lab var   ila   "Rendimento total do trabalho"
	cap lab var   wage   "Rendimento por hora na ocupação principal"
	cap lab var   iasal   "Rendimento pelo trabalho assalariado"
	cap lab var   ictap   "Rendimento pelo trabalho por conta própria"
	cap lab var   ipatr   "Rendimento pelo trabalho como patrão"
	cap lab var   iol   "Outros rendimentos do trabalho"
	cap lab var   cohi   "Dummy = 1 se coerente (individual)"
	cap lab var   inla   "Rendimento não-laboral total"
	cap lab var   ijubi   "Rendimento de aposentadoria e pensão"
	cap lab var   icap   "Rendimento de capital"
	cap lab var   itran   "Rendimento por transferências"
	cap lab var   itrane   "Rendimento por transferências estatais"
	cap lab var   ionl   "Outros rendimentos não-laborais"
	cap lab var   ii   "Rendimento individual total"
	cap lab var   renta_imp   "Rendimento imputado da habitação própria"
	cap lab var   itf   "Rendimento total do domicílio"
	cap lab var   cohh   "Dummy = 1 se coerente (domicílio)"
	cap lab var   ipcf   "Rendimento per capita familiar"
	cap lab var   p_reg   "Fator de ajuste de preços regionais"
	cap lab var   ipcf_cpi05   "Rendimento per capita familiar em valores de 2005"
	cap lab var   ipcf_ppp05   "Rendimento per capita familiar em dólares de 2005"
	cap lab var   encuesta   "Nome da pesquisa domiciliar"
	cap lab var   tipo   "Categoria da base de dados"
	cap lab var   ipc_sedlac   "Índice de preços - SEDLAC"
	cap lab var   ppp05   "Fator de conversão PPP (2005)"
	cap lab var   ipc05_sedlac   ""
	cap lab var   conversion   ""
	cap lab var   ipcf_ppp   "Rendimento per capita familiar em dolares (PPC)"
	cap lab var   ila_ppp   "Rendimento total do trabalho em dolares (PPC)"
	cap lab var   inla_ppp   "Rendimento total não-laboral em dolares (PPC)"
	
	cap lab define   relacion_pt ///   
	1 "Chefe" ///
	2 "Conjuge" ///
	3 "Filho" ///
	4 "Pais/Sogros" ///
	5 "Outro parente" ///
	6 "Não Parente" 
	
	cap lab define   hogarsec_pt ///   
	0 "Não " ///
	1 "Sim" 
	
	cap lab define   hombre_pt ///   
	0 "Mulher" ///
	1 "Homem" 
	cap lab define   jefe_pt ///   
	0 "Não chefe" ///
	1 "Chefe" 
	cap lab define   conyuge_pt ///   
	0 "Não cônjuge" ///
	1 "Cônjuge" 
	cap lab define   hijo_pt ///   
	0 "Não filho" ///
	1 "Filho" 
	cap lab define   casado_pt ///   
	0 "Não casado" ///
	1 "Casado" 
	cap lab define   raza_pt ///   
	1 "Branco" ///
	2 "Mestiço" ///
	3 "Indígena" ///
	4 "Afro-americano" ///
	5 "Outro"  */
	cap lab define   propieta_pt ///   
	0 "Não proprietário" ///
	1 "Proprietário" 
	cap lab define   precaria_pt ///   
	0 "Não precário" ///
	1 "Precário" 
	cap lab define   matpreca_pt ///   
	0 "Materiais não precários" ///
	1 "Materiais precários" 
	cap lab define   agua_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   banio_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   cloacas_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   elect_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   heladera_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   lavarropas_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   aire_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   calefaccion_fija_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   telefono_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   telefono_fijo_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   celular_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   televisor_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   tv_cable_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   video_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   computadora_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   internet_casa_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   auto_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   moto_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   bici_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   alfabeto_pt ///   
	0 "Não alfabetizado" ///
	1 "Alfabetizado" 
	cap lab define   asiste_pt ///   
	0 "Não frequenta" ///
	1 "Frequenta" 
	cap lab define   edu_pub_pt ///   
	0 "Estabelecimento Privado" ///
	1 "Estabelecimento público" 
	cap lab define   nivel_pt ///   
	0 "Nunca frequentou" ///
	1 "Educação primária incompleta" ///
	2 "Educação primária completa" ///
	3 "Educação secundária incompleta" ///
	4 "Educação secundária completa" ///
	5 "Educação terciária incompleta" ///
	6 "Educação terciária completa" 
	/* cap lab define region_pt ///   
	1 "Norte" ///
	2 "Nordeste" ///
	3 "Sudeste" ///
	4 "Sul" ///
	5 "Centro-Oeste"  */
	cap lab define   urbano_pt ///   
	0 "Rural" ///
	1 "Urbano" 
	cap lab define   migrante_pt ///   
	0 "Não migrante" ///
	1 "Migrante" 
	cap lab define   pea_pt ///   
	0 "Inativo" ///
	1 "Ativo" 
	cap lab define   ocupado_pt ///   
	0 "Não ocupado" ///
	1 "Ocupado" 
	cap lab define   desocupa_pt ///   
	0 "Não desocupado" ///
	1 "Desocupado" 
	cap lab define   deseo_emp_pt ///   
	0 "Não" ///
	1 "Sim" 
	cap lab define   relab_pt ///   
	1 "Empregador" ///
	2 "Assalariado" ///
	3 "Conta própria" ///
	4 "Sem salário" ///
	5 "Desocupado" 
	cap lab define   empresa_pt ///   
	1 "Grande" ///
	2 "Pequena" ///
	3 "Pública" 
	cap lab define   categ_lab_pt ///   
	1 "Não informal" ///
	2 "Informal" 
	cap lab define   sector1d_pt ///   
	1 "Agricultura, pecuária, caça e silvicultura" ///
	2 "Pesca" ///
	3 "Exploração de minas e pedreiras" ///
	4 "Industrias manufatureiras" ///
	5 "Eletricidade, gás e água" ///
	6 "Construção" ///
	7 "Comércio" ///
	8 "Hotéis e restaurantes" ///
	9 "Transporte, armazenamento e comunicações" ///
	10 "Intermediação financeira" ///
	11 "Atividades imobiliárias, empresariais e de aluguéis" ///
	12 "Administração pública e defesa" ///
	13 "Educação" ///
	14 "Serviços sociais e de saúde" ///
	15 "Outras atividades de serviços comunitários, sociais e pessoais" ///
	16 "Serviços domésticos" ///
	17 "Organizações e órgãos extraterritoriais" 
	cap lab define   contrato_pt ///   
	0 "Não possui" ///
	1 "Possui" 
	cap lab define   ocuperma_pt ///   
	0 "Temporário" ///
	1 "Permanente" 
	cap lab define   djubila_pt ///   
	0 "Não" ///
	1 "Sim" 
	cap lab define   dsegsale_pt ///   
	0 "Não" ///
	1 "Sim" 
	cap lab define   daguinaldo_pt ///   
	0 "Não" ///
	1 "Sim" 
	cap lab define   dvacaciones_pt ///   
	0 "Não" ///
	1 "Sim" 
	cap lab define   sindicato_pt ///   
	0 "Não" ///
	1 "Sim" 
	
	
	
	
	* cap label values relacion relacion_pt
	cap label values hogarsec hogarsec_pt
	cap label values hombre hombre_pt
	cap label values jefe jefe_pt
	cap label values conyuge conyuge_pt
	cap label values hijo hijo_pt
	cap label values casado casado_pt
	/* cap label values raza raza_pt */
	cap label values propieta propieta_pt
	cap label values precaria precaria_pt
	cap label values matpreca matpreca_pt
	cap label values agua agua_pt
	cap label values banio banio_pt
	cap label values cloacas cloacas_pt
	cap label values elect elect_pt
	cap label values heladera heladera_pt
	cap label values lavarropas lavarropas_pt
	cap label values aire aire_pt
	cap label values calefaccion_fija calefaccion_fija_pt
	cap label values telefono telefono_pt
	cap label values telefono_fijo telefono_fijo_pt
	cap label values celular celular_pt
	cap label values televisor televisor_pt
	cap label values tv_cable tv_cable_pt
	cap label values video video_pt
	cap label values computadora computadora_pt
	cap label values internet_casa internet_casa_pt
	cap label values auto auto_pt
	cap label values moto moto_pt
	cap label values bici bici_pt
	cap label values alfabeto alfabeto_pt
	cap label values asiste asiste_pt
	cap label values edu_pub edu_pub_pt
	cap label values nivel nivel_pt
	* cap label values region region_pt
	cap label values urbano urbano_pt
	cap label values migrante migrante_pt
	cap label values pea pea_pt
	cap label values ocupado ocupado_pt
	cap label values desocupa desocupa_pt
	cap label values deseo_emp deseo_emp_pt
	cap label values relab relab_pt
	cap label values empresa empresa_pt
	cap label values categ_lab categ_lab_pt
	cap label values sector1d sector1d_pt
	cap label values contrato contrato_pt
	cap label values ocuperma ocuperma_pt
	cap label values djubila djubila_pt
	cap label values dsegsale dsegsale_pt
	cap label values daguinaldo daguinaldo_pt
	cap label values dvacaciones dvacaciones_pt
	cap label values sindicato sindicato_pt
	
	* 1.3 English
	qui cap label language en, delete
	qui cap label language en, new
	
	cap lab var  pais   "Country"
	cap lab var  ano   "Year"
	cap lab var  lp_2usd   "Poverty Line at USD2.5/day"
	cap lab var  lp_2usd_ppp   "Poverty Line at USD2.5/day PPP"
	cap lab var  lp_4usd   "Poverty Line at USD4/day"
	cap lab var  lp_4usd_ppp   "Poverty Line at USD4/day PPP"
	cap lab var  id   "Household unique identifier "
	cap lab var  com   "Identifier of household member"
	cap lab var  pondera   "Weighting factor"
	cap lab var  pondera_i   "Weighting factor for income"
	cap lab var  relacion   "Relationship with head of household"
	cap lab var  hogar   "Indicator of household "
	cap lab var  hogarsec   "Member of secondary household"
	cap lab var  edad   "Age"
	cap lab var  miembros   "Number of members in main household"
	cap lab var  hombre   "Sex"
	cap lab var  jefe   "Dummy for head of household"
	cap lab var  conyuge   "Dummy for head of household spouse"
	cap lab var  hijo   "Dummy for head of household child"
	cap lab var  casado   "Dummy for marital status: married or civil union"
	cap lab var  raza   "Ethnicity "
	cap lab var  propieta   "Owner of dwelling?"
	cap lab var  habita   "Number of exclusive rooms occupied by the household"
	cap lab var  precaria   "Dwelling in hazardous location"
	cap lab var  matpreca   "Are the dwelling's construction materials of low-quality?"
	cap lab var  agua   "Does the dwelling have access to a water supply system?"
	cap lab var  banio   "Are there toilet facilities in the dwelling?"
	cap lab var  cloacas   "Are the toilet facilities linked to the sewer?"
	cap lab var  elect   "Does the dwelling have access to electricity?"
	cap lab var  heladera   "Does the household have a fridge?"
	cap lab var  lavarropas   "Does the household have a washing machine?"
	cap lab var  aire   "Does the household have an air conditioner?"
	cap lab var  calefaccion_f~a   "Does the household have access to fixed heating?"
	cap lab var  telefono   "Does the household have a phone?"
	cap lab var  telefono_fijo   "Does the household have a fixed phone?"
	cap lab var  celular   "Does any member of the household have a mobile phone?"
	cap lab var  televisor   "Does the household have a television?"
	cap lab var  tv_cable   "Does the household have access to cable/satellite tv?"
	cap lab var  video   "Does the household have a VCR or DVD?"
	cap lab var  computadora   "Does the household have a computer?"
	cap lab var  internet_casa   "Does the household have access to internet?"
	cap lab var  auto   "Does the household have a car?"
	cap lab var  moto   "Does the household have a motorcycle?"
	cap lab var  bici   "Does the household have a bike?"
	cap lab var  alfabeto   "Dummy for literacy"
	cap lab var  asiste   "Dummy for attending education system"
	cap lab var  edu_pub   "Dummy for type of education establishment attended"
	cap lab var  aedu   "Years of education completed"
	cap lab var  nivel   "Highest level of education attainment"
	cap lab var  stratum   "Stratification variable"
	cap lab var  psu   "Primary Sampling Unit"
	cap lab var  reg_uf   "Subnational unit"
	cap lab var  reg_upa   "Municipality delimitation"
	cap lab var  reg_v4727   "Census area code"
	cap lab var  reg_v4728   "Census unit code"
	cap lab var  region   "Geographical region"
	cap lab var  urbano   "Dummy for residency area"
	cap lab var  migrante   "Dummy for migration status"
	cap lab var  pea   "Dummy of activity status: economically active"
	cap lab var  ocupado   "Dummy of activity status: employed"
	cap lab var  desocupa   "Dummy of activity status: unemployed"
	cap lab var  durades   "Duration of unemployment in months"
	cap lab var  deseo_emp   "Would  like another job or to work additional hours?"
	cap lab var  hstrt   "Total hours worked in all occupations"
	cap lab var  hstrp   "Hours worked in main occupation"
	cap lab var  antigue   "Tenure on main occupation"
	cap lab var  relab   "Type of employment in main occupation"
	cap lab var  empresa   "Type of company "
	cap lab var  categ_lab   "Category of labor - informality"
	cap lab var  sector1d   "Activity sector - 1 digit ISIC"
	cap lab var  contrato   "Has a signed work contract?"
	cap lab var  djubila   "Receives employment-based pension benefits?"
	cap lab var  ocuperma   "Permanent or temporary occupation?"
	cap lab var  dsegsale   "Receives health insurance benefits?"
	cap lab var  daguinaldo   "Receivesend-year bonus?"
	cap lab var  dvacaciones   "Benefits from paid vacations?"
	cap lab var  sindicato   "Is member of an union?"
	cap lab var  ip   "Income in main occupation"
	cap lab var  ila   "Total labor income"
	cap lab var  wage   "Hourly wage in main occupation"
	cap lab var  iasal   "Salary income in main occupation"
	cap lab var  ictap   "Self-employed income"
	cap lab var  ipatr   "Business owner income"
	cap lab var  iol   "Other labor income"
	cap lab var  cohi   "Dummy = 1 if coherent (individual)"
	cap lab var  inla   "Total non-labor income"
	cap lab var  ijubi   "Income from retirement and pensions"
	cap lab var  icap   "Capital income"
	cap lab var  itran   "Transfers income"
	cap lab var  itrane   "Public transfers income"
	cap lab var  ionl   "Other non-labor transfers"
	cap lab var  ii   "Individual total income"
	cap lab var  renta_imp   "Imputed income for home owners"
	cap lab var  itf   "Household total income"
	cap lab var  cohh   "Dummy = 1 if coherent (household)"
	cap lab var  ipcf   "Per capita household income"
	cap lab var  p_reg   "Adjustment factor for regional prices"
	cap lab var  ipcf_cpi05   "Per capita household income (2005 values)"
	cap lab var  ipcf_ppp05   "Per capita household income (2005 dollars)"
	cap lab var  encuesta   "Household survey name"
	cap lab var  tipo   "Database category"
	cap lab var  ipc_sedlac   "Price index - SEDLAC"
	cap lab var  ppp05   "PPP conversion factor (2005)"
	cap lab var  ipc05_sedlac   ""
	cap lab var  conversion   ""
	cap lab var  ipcf_ppp   "Per capita household income (PPP dollars)"
	cap lab var  ila_ppp   "Total labor income (PPP dollars)"
	cap lab var  inla_ppp   "Total non-labor income (PPP dollars)"
	
	cap lab define   relacion_en  ///   
	1 "Head" ///
	2 "Spouse - Partner" ///
	3 "Son/Daughter" ///
	4 "Parent/Parent-in-law" ///
	5 "Other relative" ///
	6 "Non relative"
	
	cap lab define   hogarsec_en  ///   
	0 "No " ///
	1 "Yes" 
	cap lab define   hombre_en  ///   
	0 "Female" ///
	1 "Male" 
	cap lab define   jefe_en  ///   
	0 "Not head" ///
	1 "Head" 
	cap lab define   conyuge_en  ///   
	0 "Not spouse" ///
	1 "Spouse" 
	cap lab define   hijo_en  ///   
	0 "Not Son or Daughter" ///
	1 "Son /Daughter" 
	cap lab define   casado_en ///   
	0 "Not married" ///
	1 "Married" 
	/* 	cap lab define   raza_en  ///   
	1 "White" ///
	2 "Mixed" ///
	3 "Native" /// 
	4 "Afro-american" ///
	5 "Other relative" */
	cap lab define   propieta_en  ///   
	0 "Not owner" ///
	1 "Owner" 
	cap lab define   precaria_en  ///   
	0 "Not hazardous" ///
	1 "Hazardous" 
	cap lab define   matpreca_en  ///   
	0 "Non low-quality material" ///
	1 "Low-quality material" 
	cap lab define   agua_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   banio_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   cloacas_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   elect_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   heladera_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   lavarropas_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   aire_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   calefaccion_fija_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   telefono_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   telefono_fijo_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   celular_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   televisor_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   tv_cable_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   video_en  ///    
	0 "No access" ///
	1 "Access" 
	cap lab define   computadora_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   internet_casa_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   auto_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   moto_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   bici_en  ///   
	0 "No access" ///
	1 "Access" 
	cap lab define   alfabeto_en  ///   
	0 "Illiterate" ///
	1 "Literate" 
	cap lab define   asiste_en  ///   
	0 "Does not attend" ///
	1 "Attend" 
	cap lab define   edu_pub_en  ///   
	0 "Private establishment" ///
	1 "Public establishment" 
	cap lab define   nivel_en  ///   
	0 "Never attended" ///
	1 "Incomplete Primary Education" ///
	2 "Complete Primary Education" ///
	3 "Incomplete Secondary Education" ///
	4 "Complete Secondary Education" ///
	5 "Incomplete Tertiary Education" ///
	6 "Complete Tertiary Education" 
	/* cap lab define   region_en  ///   
	1 "North" ///
	2 "Northeast" ///
	3 "Southeast" ///
	4 "Southeast" ///
	5 "Center-West"  */
	cap lab define   urbano_en  ///   
	0 "Rural" ///
	1 "Urban" 
	cap lab define   migrante_en  ///   
	0 "Not migrant" ///
	1 "Migrant" 
	cap lab define   pea_en  ///   
	0 "Inactive" ///
	1 "Active" 
	cap lab define   ocupado_en  ///   
	0 "Not employed" ///
	1 "Employed" 
	cap lab define   desocupa_en  ///   
	0 "Not unemployed" ///
	1 "Unemployed" 
	cap lab define   deseo_emp_en  ///   
	0 "No" ///
	1 "Yes" 
	cap lab define   relab_en  ///   
	1 "Employer" ///
	2 "Salaried worker" ///
	3 "Self-employed" ///
	4 "Not salaried" ///
	5 "Unemployed" 
	cap lab define   empresa_en  ///   
	1 "Large" ///
	2 "Small" ///
	3 "Public" 
	cap lab define   categ_lab_en  ///   
	1 "Not Informal" ///
	2 "Informal" 
	cap lab define   sector1d_en  ///   
	1 "Agriculture, hunting and forestry" ///
	2 "Fishing" ///
	3 "Mining and quarrying" ///
	4 "Manufacturing" ///
	5 "Electricity, gas and water supply" ///
	6 "Construction" ///
	7 "Wholesale and retail trade" ///
	8 "Hotels and restaurants" ///
	9 "Transport, storage and communications" ///
	10 "Financial intermediation" ///
	11 "Real estate, renting and business activities" ///
	12 "Public administration and defence" ///
	13 "Education" ///
	14 "Health and social work" ///
	15 "Other community, social and personal service activities" ///
	16 "Activities of private households as employers " ///
	17 " Extraterritorial organizations and bodies" 
	cap lab define   contrato_en  ///   
	0 "Does not have" ///
	1 "Has" 
	cap lab define   ocuperma_en  ///   
	0 "Temporary" ///
	1 "Permanent" 
	cap lab define   djubila_en  ///   
	0 "No" ///
	1 "Yes" 
	cap lab define   dsegsale_en  ///   
	0 "No" ///
	1 "Yes" 
	cap lab define   daguinaldo_en  ///   
	0 "No" ///
	1 "Yes" 
	cap lab define   dvacaciones_en  ///   
	0 "No" ///
	1 "Yes" 
	cap lab define   sindicato_en  ///   
	0 "No" ///
	1 "Yes" 
	
	
	* cap label values relacion relacion_en
	cap label values hogarsec hogarsec_en
	cap label values hombre hombre_en
	cap label values jefe jefe_en
	cap label values conyuge conyuge_en
	cap label values hijo hijo_en
	cap label values casado casado_en
	* cap label values raza raza_en
	cap label values propieta propieta_en
	cap label values precaria precaria_en
	cap label values matpreca matpreca_en
	cap label values agua agua_en
	cap label values banio banio_en
	cap label values cloacas cloacas_en
	cap label values elect elect_en
	cap label values heladera heladera_en
	cap label values lavarropas lavarropas_en
	cap label values aire aire_en
	cap label values calefaccion_fija calefaccion_fija_en
	cap label values telefono telefono_en
	cap label values telefono_fijo telefono_fijo_en
	cap label values celular celular_en
	cap label values televisor televisor_en
	cap label values tv_cable tv_cable_en
	cap label values video video_en
	cap label values computadora computadora_en
	cap label values internet_casa internet_casa_en
	cap label values auto auto_en
	cap label values moto moto_en
	cap label values bici bici_en
	cap label values alfabeto alfabeto_en
	cap label values asiste asiste_en
	cap label values edu_pub edu_pub_en
	cap label values nivel nivel_en
	* cap label values region region_en
	cap label values urbano urbano_en
	cap label values migrante migrante_en
	cap label values pea pea_en
	cap label values ocupado ocupado_en
	cap label values desocupa desocupa_en
	cap label values deseo_emp deseo_emp_en
	cap label values relab relab_en
	cap label values empresa empresa_en
	cap label values categ_lab categ_lab_en
	cap label values sector1d sector1d_en
	cap label values contrato contrato_en
	cap label values ocuperma ocuperma_en
	cap label values djubila djubila_en
	cap label values dsegsale dsegsale_en
	cap label values daguinaldo daguinaldo_en
	cap label values dvacaciones dvacaciones_en
	cap label values sindicato sindicato_en
	
	
	*2 define language
	
	if ("`lang'" == "") local lang "en"
	
	label language `lang'
	
}
end //  end of program languages 

exit 


><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><
