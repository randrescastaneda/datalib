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


* LCSPP Users
if   ("`user'" == "wb438400" 			/// Santiago Garriga
	| "`user'" == "wb434633" 			/// Oscar Barriga
	| "`user'" == "wb454408" 			/// Liliana do couto Sousa
	| "`user'" == "wb343674" 			/// Kiyomi E. Cadena
	| "`user'" == "wb395309" 			/// Megan Rounseville
	| "`user'" == "wb384996" 			/// Andrés Castañeda
	| "`user'" == "wb419055" 			/// Daniel Valderrama
	| "`user'" == "wb456344" 			/// Natalia Garbiras
	| "`user'" == "wb273483" 			/// Leonardo Lucchetti
	| "`user'" == "wb380608" 			/// Carlos Rodriguez
	| "`user'" == "wb439769" 			/// Mateo Salazar
	| "`user'" == "wb423484" 			/// Tania Diaz
	| "`user'" == "wb384997" 			/// Bernardo Atuesta
	| "`user'" == "wb288589" 			/// María Eugenia Genoni
	| "`user'" == "wb447538" 			/// Ali Sharman
	| "`user'" == "wb463998" 			/// Martha Viveros
	| "`user'" == "wb244643" 			/// Aude-Sophie Rodella
	| "`user'" == "wb322758" 			/// Elizaveta Perova
	| "`user'" == "wb53529" 			/// Kinnon Scott
	| "`user'" == "wb471704" 			/// Stephanie Majerowicz
	| "`user'" == "wb471817"			/// Giselle del Carmen Hasbun
	| "`user'" == "wb473845"			/// Laura Moreno
	| "`user'" == "wb463689" 			/// Thiago Scot
	| "`user'" == "wb368183" 			/// María Ana Lugo
	| "`user'" == "wb224588" 			/// Samuel Freije
	| "`user'" == "wb339789"            /// German Caruso
	| "`user'" == "wb275128"            /// Alan Fuchs 
	| "`user'" == "wb484541" 			/// German Reyes
	| "`user'" == "wb487078"			/// Sarah Mohamed Kotb
	| "`user'" == "wb486701"			/// Eduardo Malasquez
	| "`user'" == "wb377460"			/// Shohei Nakamura
	| "`user'" == "wb240088"			/// Juan Carlos Parra Osorio
	| "`user'" == "wb477458"			/// Gonzalo Javier Rivera Gallegos
	| "`user'" == "wb495006"			/// Leandro Chalela
	| "`user'" == "wb253675"			/// Ana Maria Oviedo
	| "`user'" == "wb507377"			/// Jorge Soler Lopez
	| "`user'" == "wb507378"			/// Natalia Garcia Pena Bersh 
	| "`user'" == "wb507379"			/// Maria Ignacia Contreras Mediano
	| "`user'" == "wb375729"			/// Maria Laura Oliveri
	| "`user'" == "wb495589"			/// Tanida Arayavechkit   
    | "`user'" == "wb509172"			/// Christian Camilo Gomez Canon
	| "`user'" == "wb316966"			/// Sergio Daniel Olivieri 
	| "`user'" == "wb334916"			/// Maria Gabriela Farfan
	| "`user'" == "wb521296"			/// Julieth Pico Mejia
	| "`user'" == "wb522247"			/// Valentina Bonifacio 
	| "`user'" == "wb484620"			/// Paul Alan Ervin 8/22/17
	| "`user'" == "wb265844"			/// Lourdes Rodriguez Chamussy 9/13/17
	| "`user'" == "wb157614"			/// Anna Fruttero 12/1/17
	| "`user'" == "wb527059"			/// Bernardo Dantas Pereira Coelho 12/1/17
	| "`user'" == "wb368183"			/// Maria Ana Lugo 6/4/18
	| "`user'" == "wb357339"			/// Freeha Fatima
	| "`user'" == "wb546187"			/// Cristian Ezequiel Chagalj
	| "`user'" == "wb546181"			/// Luz Carazo
	| "`user'" == "wb364663"			/// Maria Eugenia Davalos 03/07/2019
	| "`user'" == "wb550905"			/// Malena Acuña 07/31/2019
	| "`user'" == "wb548031"			/// Sandra Carolina Segovia Juarez  03/07/2019
	| "`user'" == "wb544378"			/// Javier Romero 10/04/2019
	| "`user'" == "wb392669"			/// Anna Luisa Paffhausen 12/02/2019
	| "`user'" == "wb475216"			/// Diana Marcela Sanchez Castro
	| "`user'" == "wb471817"			/// Giselle Eugenia del Carmen 04/08/2020
	| "`user'" == "wb569452"			/// Karen Barreto Herrera 06/02/2020
	| "`user'" == "wb484435"			/// Flavia Giannina Sacco Capurro 03/22/2021
	| "`user'" == "wb520054"			/// Kelly Yelitza Montoya Munoz 04/05/2021
	| "`user'" == "wb485395"			/// Ruth Llovet Montanes 04/28/2021
) local accept = 2

* LCSPP Users
if   ("`user'" == "wb544378"			/// Javier Romero 10/04/2019
	| "`user'" == "wb507378"			/// Natalia Garcia Pena Bersh
	| "`user'" == "wb548031"			/// Sandra Carolina Segovia Juarez  03/07/2019
	| "`user'" == "wb475216"			/// Diana Marcela Sanchez Castro
	| "`user'" == "wb267475"         	/// Carolina Diaz Bonilla
	| "`user'" == "wb473845"			/// Laura Moreno
	| "`user'" == "wb471817"			/// Giselle Eugenia del Carmen 04/08/2020
	| "`user'" == "wb569452"			/// Karen Barreto Herrera 06/02/2020
	| "`user'" == "wb484435"			/// Flavia Giannina Sacco Capurro 03/22/2021
	| "`user'" == "wb520054"			/// Kelly Yelitza Montoya Munoz 04/05/2021
	| "`user'" == "wb485395"			/// Ruth Llovet Montanes 04/28/2021
) local accept = 1


*LCC7C:
if ("`user'" == "wb522502"				/// Gervasio Agustín Arakai 8/22/17
) local accept = 2

*GFCLC
if ("`user'" == "wb30880"				/// Nadeem M. Karmali 5/09/18
) local accept = 2


* GPVDR Users
if   ("`user'" == "wb181134" 			/// Renos Vakis 
	| "`user'" == "wb473337"			/// Rodrigo Salcedo Du Bois
	| "`user'" == "wb441903"			/// Renata Mayer Gukovas
	| "`user'" == "wb411683"			/// Moritz Meyer
	| "`user'" == "wb497793"			/// Flavio Luiz Russo Riva
	| "`user'" == "wb378870"			/// Paul Andres Corral Rodas 
	| "`user'" == "wb505536"			/// Xinxin Lyu
) local accept = 2


* LCSSD Users
if   ("`user'" == "wb426121" 			/// Xijie Lv
) local accept = 2

* EDS18 Users
if   ("`user'" == "wb449628" 			/// Jaime Roberto Díaz Palacios
) local accept = 2


* LCSSD Users
if   ("`user'" == "wb509990" 			/// Paula Andrea Cifuentes Henao 
) local accept = 2

* LCSPE Users
if   ("`user'" == "wb253268" 			/// Julio Velasco
	| "`user'" == "wb308413" 			/// Barbara Cunha
	| "`user'" == "wb286250" 			/// Calvin Dijofack
	| "`user'" == "wb317372" 			/// Adriana Cardozo
) local accept = 2

* ECSP3 Users
if   ("`user'" == "wb416046" 			/// Cesar A. Cancho
	| "`user'" == "wb408971" 			/// Aziz Atamanov
	| "`user'" == "wb454447" 			/// Briana Huie
	| "`user'" == "wb164649" 			/// Helena I. Makarenko
	| "`user'" == "wb252482" 			/// Jose Montes
	| "`user'" == "wb436991" 			/// Lidia Ceriane
	| "`user'" == "wb248276" 			/// Mariam Lomaia Khanna
	| "`user'" == "wb395877" 			/// Mikhail Matytsin
	| "`user'" == "wb411683" 			/// Moritz Meyer
	| "`user'" == "wb383202" 			/// Alisher Rajabov
	| "`user'" == "wb172683" 			/// Antonio Ramos-Izquierdo
	| "`user'" == "wb453198" 			/// Kimberly Bolch
	| "`user'" == "wb255520" 			/// Joao Pedro Azevedo
	| "`user'" == "wb456684"  			///Carlos Felipe Balcazar Salazar
	| "`user'" == "wb384053" 			///Shabana Singh
	| "`user'" == "wb259744"            ///Sailesh Tiwari
) local accept = 2

* LCRCE Users
if   ("`user'" == "wb445482" 			/// Juan Pablo Uribe
	| "`user'" == "wb359889" 			/// Luis Diego Rojas
	| "`user'" == "wb293758" 			/// Guillermo Beylis
	| "`user'" == "wb373426" 			/// Anna Maria Sanz de Galdeano 
	| "`user'" == "wb472157"			/// Emmanuel Salvador Chavez Jimenez 
	| "`user'" == "wb465237"			///  Francy Nathalie Gonzalez Prieto
	| "`user'" == "wb463662"			///  Maria Marta Ferreyra
	| "`user'" == "wb473998"			///  Joaquin Andres Urrego Garcia
	| "`user'" == "wb293758"			///  Guillermo Beylis
	| "`user'" == "wb485451"			///  Bianca Ravani Cecato
	| "`user'" == "wb518057"			/// Daniel Mateo Angel Quintana
	| "`user'" == "wb500444"			/// Julian Eduardo Diaz Gutierrez
	| "`user'" == "wb514416"			/// Luis Francisco Morano Germani
	| "`user'" == "wb523957"			/// Lucila Venturi Grosso 12.12.2017
	| "`user'" == "wb529523"			/// Johan Sebastian Melo Martin 05.09.2018
	| "`user'" == "wb536202"			/// Andrea Franco Hernandez 8.14.2018
	| "`user'" == "wb529253"			/// Maria Ignacia Paz Cuevas De Saint Pierre 08.20.2018
	| "`user'" == "wb532467"			/// Luciana Maria Galeano 10.17.2018
	| "`user'" == "wb303920"			/// Sergio Urzua 04.04.2019
	| "`user'" == "wb416727"			/// Camila Galindo 06.04.2019
	| "`user'" == "wb551265"			/// Macarena Kutscher 06.04.2019
) local accept = 2

* GSPDR users
if   ("`user'" == "wb474004" 			/// Giulia Lotti
	| "`user'" == "wb441669" 			/// Noel Muller
	| "`user'" == "wb316109" 			/// Joana Silva
	| "`user'" == "wb446192" 			/// Chiara Monti 
	| "`user'" == "wb441912" 			/// Rafael Prado Proenca   
	| "`user'" == "wb191197 " 			/// Edmundo Murrugarra
	| "`user'" == "wb442311" 			/// Paula Maria Cerutti 
	| "`user'" == "wb483485" 			/// Alejandra Martinez Cubillos 
	| "`user'"==  "wb460761"			/// Julieth SantaMaria
) local accept = 2

* LCSHS users
if   ("`user'" == "wb320459" 			/// Melissa Zumaeta Aurazo
	| "`user'" == "wb293950" 			///  Pablo Ariel Acosta
	| "`user'" == "wb452513" 			///  Emma Mercedes Monsalve
) local accept = 2


* LCSHE users
if   ("`user'" == "wb408163" 			/// Anna Popova
	| "`user'" == "wb307499" 			/// Juan Baron
	| "`user'" == "wb307456" 			/// Rafael E. de Hoyos
) local accept = 2




* LCSDU Users
if   ("`user'" == "wb357025" 			/// Oscar A. Ishizawa
	| "`user'" == "wb454240" 			/// Gonzalo L. Pita
	| "`user'" == "wb427726" 			/// Rashmin Gunasekera
	| "`user'" == "wb427809" 			/// Christoph Aubrecht
	| "`user'" == "wb456464" 			/// Kayoum Fane
	| "`user'" == "wb442509" 			/// Keren Charles
) local accept = 2

* SASEP users
if   ("`user'" == "wb327173" 			/// Minh Cong Nguyen
) local accept = 2

* LCSEG users
if   ("`user'" == "wb339884" 			/// Rigoberto Yepes-Garcia
) local accept = 2

* PRMPR users
if   ("`user'" == "wb252129" 			/// Shinya Takamatsu
	| "`user'" == "wb407844" 			/// Alexander Skinner
	| "`user'" == "wb451073" 			/// Catherine Kyung-eun Lee
) local accept = 2


* LCSPF users
if   ("`user'" == "wb308830" 			/// Nadeem M. Karmali
	| "`user'" == "wb453138" 			/// Sergio Pinto
) local accept = 2

* MNSSP users
if   ("`user'" == "wb382199" 			/// Brooks Fox Evans
	| "`user'" == "wb487791"			/// Shafia Imtiaz 
) local accept = 2

* DECPI users
if   ("`user'" == "wb460854" 			/// Diego Matias Calderon Guajardo
	| "`user'" == "wb461172" 			/// Carlos Cristobal Bennett Avaria
	| "`user'" == "wb461263" 			/// Triana Andrea Yentzen Toro
	| "`user'" == "wb464726" 			/// Jose Manuel Belmar Ahonzo
	| "`user'" == "wb20200" 			/// Claudio E. Montenegro
	| "`user'" == "wb308767"  			/// Israel Osorio-Rodarte
	| "`user'" == "wb256280" 			/// Roy Van der Weide
	| "`user'" == "wb418999"  			/// Renzo Massari
	| "`user'" == "wb372541"  			/// Espen Beer Prydz
	| "`user'" == "wb269235"  			/// Hai-Anh Dang
	| "`user'" == "wb484101"  			/// Cristian Ignacio Jara Nercasseau
	| "`user'" == "wb495618"  			/// Pedro Nicolas Cayul Pina
	| "`user'" == "wb269235"  			/// Hai-Anh H. Dang
	| "`user'" == "wb424681"  			/// Christoph Lakner 
	| "`user'" == "wb474069"  			/// Stefan Thewissen
	| "`user'" == "wb514016"  			/// Rakesh Gupta 
	| "`user'" == "wb514665"  			/// Daniel Mahler	
	| "`user'" == "wb180665"			/// Jed Friedman
) local accept = 2


* DECIE users
if   ("`user'" == "wb515898" 			/// Catalina Salas Santa
) local accept = 2



* DECAR users
if   ("`user'" == "wb352055" 			/// Anthony Mveyange
) local accept = 2 
 
* DECTI users
if   ("`user'" == "wb309100"  			/// Bob Rijkers
	| "`user'" == "wb239066" 			/// Caglar Ozden
	| "`user'" == "wb454394" 			/// Zovanga Louis Kone
	| "`user'" == "wb488098" 			/// Min Wu
) local accept = 2 
 
* ECACE users
if   ("`user'" == "wb464228" 			/// Georgi Panterov
) local accept = 2 
  
* DECHD users
if   ("`user'" == "wb76182" 			/// Deon P. Filmer
	| "`user'" == "wb63803" 			/// Adam Wagslaff
) local accept = 2
  
* ECSH4 users
if   ("`user'" == "wb341106" 			/// Josefina Posadas
	| "`user'" == "wb83335" 			/// Mary Hallward Driemeier 
	| "`user'" == "wb470780" 			/// Giulia Mancini
	| "`user'" == "wb447059" 			/// El Hadi Çaoui 
) local accept = 2  

* DECWD users
if   ("`user'" == "wb426193" 			/// Sebastian Monroy-Taborda
	| "`user'" == "wb474108" 			/// Boo Kang Seol
	| "`user'" == "wb345808" 			/// Indhira Santos
) local accept = 2  
  
* GHNDR users
if   ("`user'" == "wb380712" 			/// Patrick Eozenou
) local accept = 2 
   
* AFRVP users
if   ("`user'" == "wb465344" 			/// Tsoungui Belinga Vincent de Paul
) local accept = 2 
   

* DECFP Users
if   ("`user'" == "wb259274"        /// Reyes Aterido
    | "`user'" == "wb392503"        /// Tanja Goodwin
    | "`user'" == "wb306580"        /// Leonardo Iacovone
    | "`user'" == "wb347393"        /// Martha Martinez Lizetti
    | "`user'" == "wb202912"        /// Dino Leonardo Merotto
    | "`user'" == "wb190142"        /// David Robalino
    | "`user'" == "wb239618"        /// Maria Laura Sanchez Puerta
    | "`user'" == "wb265493"        /// Shiddharth Sharma
    | "`user'" == "wb379147"        ///  Trang Thu Tran          
) local accept = 2

* GTIDR Users
if   ("`user'" == "wb434118"         /// Harry Moroz
    | "`user'" == "wb426121"         /// Xijie Liu
) local accept = 2

* GCJDR
if   ("`user'" == "wb468874" 		/// Chengyan Gu
	| "`user'" == "wb396589"        /// Adrian Garlati
	| "`user'" == "wb461639"        /// Samantha Watson
) local accept = 2

* GEDDR Users
if   ("`user'" == "wb267504"         /// Peter Anthony Holland 
    | "`user'" == "wb469522"         /// Maximilian Murck 
	| "`user'" == "wb480551"         /// Andres Felipe Perez L. 
	| "`user'" == "wb307456"         /// Rafael de Hoyo
	| "`user'" == "wb296125"		 /// Javier Botero Alvarez 
	| "`user'" == "wb446513"		 /// Ciro Avitabile
	| "`user'" == "wb240316"		 /// Jamele Rigolini
	| "`user'" == "wb317002"		 /// Francisco Haimovich Paz
	| "`user'" == "wb484646"		 /// Uriel Kejsefman
	| "`user'" == "wb477227"		 /// Renata Freitas Lemos
) local accept = 2 

* GED04 Users
if   ("`user'" == "wb108423"         /// Melissa Ann Adelman 
    | "`user'" == "wb456002"         /// Andres Ham Gonzalez
	| "`user'" == "wb455882"		 /// Silvia Guallar Artal 
	| "`user'" == "wb479336"		 /// Karina Margarita Acevedo Gonzalez 
	| "`user'" == "wb499087"		 /// Alejandro Largomasino  
	| "`user'" == "wb381047"		 /// Monica Yanez Pagans	
	| "`user'" == "wb497155"		 /// Maria Jose Vargas Mancera 8/29/2017
) local accept = 2

* DECOS users
if   ("`user'" == "wb237548"  			/// Jaime de Jesus Filho
) local accept = 2  

* GSURR (now GSU10)users 
if   ("`user'" == "wb481936"         /// Luis Felipe Jimenez
    | "`user'" == "wb386205"         /// Juan Jose Miranda Montero
	| "`user'" == "wb353727"         /// Marco Antonio Martinez
	| "`user'" == "wb451181"         /// David Ryan Mason
	| "`user'" == "wb458187"         /// Ana Isabel Aguilera De Llano
	| "`user'" == "wb88786"          /// Zeljko Joe Kulenovic
) local accept = 2 

* EAP Users
if   ("`user'" == "wb104674"         /// Reno Dewina
	| "`user'" == "wb435514"         /// Jae Kyun
) local accept = 2 

* GGODR users
if   ("`user'" == "wb458073"  		/// Angelica Maria Sanchez Diaz
) local accept = 2  

* GPVGE users
if   ("`user'" == "wb364740"        /// Spencer Durbin
    | "`user'" == "wb364604"        /// Ana Carolina Areias
	| "`user'" == "wb453033"        /// Mario Brataj
	| "`user'" == "wb407844"        /// Alexander Skinner
	| "`user'" == "wb508804"		/// Raimundo Smith Mayer
) local accept = 2 

* GEEES users
if   ("`user'" == "wb485647"  		/// Patricia Vargas Santos Correa
) local accept = 2  

* GPSJP users
if   ("`user'" == "wb104796"  		/// David Ian Walker
	| "`user'" == "wb342318"		/// Javier Sanchez-Reaza
	| "`user'" == "wb259274"		/// Reyes Aterido
	| "`user'" == "wb277714"		/// Hernan Winkler 11.1.2017
) local accept = 2  

* GWASP users
if   ("`user'" == "wb471584"  		/// Shiqing Li
	| "`user'" == "wb337882"        /// Diana Cubas
	| "`user'" == "wb256571"        /// Luis Alberto Andres
) local accept = 2  

* GSU12 & Other users
if   ("`user'" == "wb313527"  		/// Mark Roberts
	| "`user'" == "wb463662"        /// Maria Marta Ferreyra    
	| "`user'" == "wb445300"        /// Luis Eduardo Quintero 
	| "`user'" == "wb489530"		/// Jane Park
) local accept = 2  

* GCCPT users
if   ("`user'" == "wb451818"  		/// Tamaro Kane
) local accept = 2 

* GSP02 Users
if   ("`user'" == "wb234947"         /// Oleksiy Ivaschenko  
    | "`user'" == "wb435514"         /// Jae Kyun Kim
) local accept = 2

* GWAWP users
if   ("`user'" == "wb507970"  		/// Sebastien Gael Desbureaux
) local accept = 2 
if (regexm("`user'","^wb1000000[0-9][0-9][0-9]$"))  local accept = 2

* GSP0 Users
if   ("`user'" == "wb332916"         /// Ignacio Raul Apella 
) local accept = 2

* GSP04 Users
if   ("`user'" == "wb336563"         /// Gonzalo Javier Reyes Hartley
	| "`user'" == "wb246538"		 /// Vanessa Moreira da Silva
	| "`user'" == "wb235212"		 /// Junko Onishi
	| "`user'" == "wb370199"		 /// Nancy Rocio Banegas Raudales
	| "`user'" == "wb274249"		 /// Aylin Isik-Dikmelik 12.12.2017
	| "`user'" == "wb376322"		 /// Lucia Solbes Castro 12.12.2017
	| "`user'" == "wb470783"		 /// Clemente Avila Parra 12.12.2017
	| "`user'" == "wb235212"		 /// Junko Onishi 9.11.2018
	| "`user'" == "wb492043"		 /// Alexander Matthew Spevack 9.11.2018
	| "`user'" == "wb255713"		/// Miriam Montenegro 9.11.2018
	| "`user'" == "wb370199" 		/// Nancy Rocio Banegas Raudales 9.11.2018
) local accept = 2

* GPSJB Users
if   ("`user'" == "wb503142"  		/// Veronica Michel Gutierrez
) local accept = 2  

* LCCSV Users
if   ("`user'" == "wb505573"  		/// Juan Antonio Melendez Azcunaga
) local accept = 2  

* GHN04 Users
if	 ("`user'" == "wb376781"	///	Aakash Mohpal
	| "`user'" == "wb395905"	/// Evelyn Rodriguez
	| "`user'" == "wb422601"	/// Guillermo Paraje
	| "`user'" == "wb520347"	/// Milagros Alejandra Chocce Falla 9.20.2017
) local accept = 2

* GMF04
if	 ("`user'" == "wb323424"		/// Fernando Gabriel Im 11.7.2017
	| "`user'" == "wb305062"		/// Ewa Joanna Korczyc 11.7.2017
) local accept = 2
* GFA04
if ("`user'" == "wb495368"		/// Ashwini Rekha Sebastian 03.16.2018
  | "`user'" == "wb529922"		/// Abhishek Sharma 03.30.2018
) local accept = 2

* GMTLC
if ("`user'" == "wb359889"		/// Luis Diego Rojas Alvarado 01.08.2019
) local accept = 2



* SPJGP users / HDNSP users
if   ("`user'" == "wb289471" 			/// Maddalena Honorati
	| "`user'" == "wb66071" 			/// Ruslan Yemtsov
	| "`user'" == "wb332802" 			/// Claudia Rodriguez Alas
	| "`user'" == "wb427727" 			/// Gabriela da Silva E. Cunha
	| "`user'" == "wb342143" 			/// Michael Weber
	| "`user'" == "wb367592" 			/// victoria Strokova
	| "`user'" == "wb461621"			/// Zanieb Majoka
	| "`user'" == "wb465642"			/// Ana Sofia Martinez Cordova
	| "`user'" == "wb486617"			/// Linghui Zhu
	| "`user'" == "wb420242"			///	Ana Veronica Lopez 02/20/2019
	| "`user'" == "wb234947"      		///   Oleksiy Ivaschenko 02/20/2019
	| "`user'" == "wb431495"      		///   Marina Novikova 02/20/2019
	| "`user'" == "wb538723"      		///   Usama Zafar 02/20/2019
) local accept = 2

* GGEVP
if ("`user'" == "wb326454"				/// Laura Chioda 04.03.2019
	| "`user'" == "wb531889"			/// Rajdev Kaur Brar 04.03.2019
) local accept = 2

* DECMG
if ("`user'" == "wb536119"				/// Roxanne Rahnama Hazaveh 05.24.2019
	| "`user'" == "wb446741"			/// Pierre Bachas 05.24.2019
) local accept = 2







* Check acceptance

if (`accept' == 2) | (`accept' == 3) {
	qui {
		local root "${rootdatalib}/sedlac"
		tempname hh
		file open `hh' using "`root'/_log\log_nousers.csv", write text append
		local date : di %tdN/D/CY date("$S_DATE", "DMY")
		local username = c(username)
		file write `hh' "`date', $S_TIME, `username'" _n
		file close `hh'
	} // end of qui 

	disp "Good things always evolve for the better: DATALIBWEB is a data system specifically designed to enable users to access the most up to date versions of non-harmonized (original/raw) and harmonized datasets of different collections across Global Practices. It can perform computations relevant for poverty and shared prosperity analysis based on the microdata from various harmonized collections: EAPPOV, ECAPOV, MNAPOV, SARMD, SEDLAC, LABLAC, SSAPOV, and the global collection GPWG/GMD. It also can help users to access to the original/raw data for further country-specific analysis. Please, in the Intranet go to: " _cont
	disp `"{browse "datalibweb":http://datalibweb}"' _cont
	disp in red " Get the file from this link:" _cont
	disp `"{browse "datalibweb":http://ecaweb/povdata/datalibweb/_ado/datalibweb.zip}"' _cont
	disp in red " Copy with replacement all the folders (personal and plus) into c:/ado, without changing the folder structure" _cont
	
	if (`accept' == 3) local accept = 1
	if (`accept' == 2) error
	
}		// if (`accept' == 0) 

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

	disp in red "-Good things always evolve for the better: DATALIBWEB is a data system specifically designed to enable users to access the most up to date versions of non-harmonized (original/raw) and harmonized datasets of different collections across Global Practices. It can perform computations relevant for poverty and shared prosperity analysis based on the microdata from various harmonized collections: EAPPOV, ECAPOV, MNAPOV, SARMD, SEDLAC, LABLAC, SSAPOV, and the global collection GPWG/GMD. It also can help users to access to the original/raw data for further country-specific analysis. Please, send and email to " _cont
	disp `"{browse "mailto:LAC_Stats@worldbank.org":LAC_Stats@worldbank.org}"' _cont
	disp in red " for more information"
	error 
}		// if (`accept' == 0) 

if (`accept' == 2) {
	qui {
		local root "${rootdatalib}/sedlac"
		tempname hh
		file open `hh' using "`root'/_log\log_nousers.csv", write text append
		local date : di %tdN/D/CY date("$S_DATE", "DMY")
		local username = c(username)
		file write `hh' "`date', $S_TIME, `username'" _n
		file close `hh'
	} // end of qui 

	disp "-Good things always evolve for the better: DATALIBWEB is a data system specifically designed to enable users to access the most up to date versions of non-harmonized (original/raw) and harmonized datasets of different collections across Global Practices. It can perform computations relevant for poverty and shared prosperity analysis based on the microdata from various harmonized collections: EAPPOV, ECAPOV, MNAPOV, SARMD, SEDLAC, LABLAC, SSAPOV, and the global collection GPWG/GMD. It also can help users to access to the original/raw data for further country-specific analysis. Please, in the Intranet go to: " _cont
	disp `"{browse "datalibweb":http://datalibweb}"' _cont
	disp in red " Get the file from this link:" _cont
	disp `"{browse "datalibweb":http://ecaweb/povdata/datalibweb/_ado/datalibweb.zip}"' _cont
	disp in red " Copy with replacement all the folders (personal and plus) into c:/ado, without changing the folder structure"
	error

	
}		// if (`accept' == 0) 

end

exit

Get the file from this link: http://ecaweb/povdata/datalibweb/_ado/datalibweb.zip 
Copy with replacement all the folders (personal and plus) into c:/ado, without changing the folder structure.
