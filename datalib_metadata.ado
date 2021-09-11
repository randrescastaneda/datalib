*! v 0.2      <12fev2013>   <Joao Pedro Azevedo>
*! v 0.1      <26Apr2012>   <Joao Pedro Azevedo>

cap program drop _metadata
program define _metadata, rclass
version 10.0

	syntax [anything],							///
		COUNtry(string)							///
		Year(numlist)							///
		survey(string)							

    local country   = lower("`country'")
    local survey    = lower("`survey'")

    local blz_1990_m_name     BLZ_1990_HES_v01_M
    local blz_1990_m_title    "Household Expenditure Survey 1990"
    local blz_1990_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_1990_HES_v01_M"
    local blz_1995_m_name     BLZ_1995_SLC_v01_M
    local blz_1995_m_title    "Survey of Living Conditions 1995"
    local blz_1995_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_1995_SLC_v01_M"
    local blz_2000_m_name     BLZ_2000_PHC_v01_M
    local blz_2000_m_title    "Population and Housing Census 2000"
    local blz_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_2000_PHC_v01_M"
    local blz_2001_m_name     BLZ_2001_LSMS_v01_M
    local blz_2001_m_title    "Living Standard Measurement Survey 2001"
    local blz_2001_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_2001_LSMS_v01_M"
    local blz_2006_m_name     BLZ_2006_MICS_v01_M
    local blz_2006_m_title    "Multiple Indicator Cluster Survey 2006"
    local blz_2006_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_2006_MICS_v01_M"
    local blz_2008_m_name     BLZ_2008_HES_v01_M
    local blz_2008_m_title    "Household Expenditure Survey 2008-2009"
    local blz_2008_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_2008_HES_v01_M"
    local bra_1996_m_name     BRA_1996_LSMS_v01_M
    local bra_1996_m_title    "Living Standards Measurement Study Survey 1996-1997"
    local bra_1996_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1996_LSMS_v01_M"
    local ecu_1994_m_name     ECU_1994_ECV_v01_M
    local ecu_1994_m_title    "Encuesta Condiciones de Vida 1994"
    local ecu_1994_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1994_ECV_v01_M"
    local ecu_1995_m_name     ECU_1995_ECV_v01_M
    local ecu_1995_m_title    "Encuesta Condiciones de Vida 1995"
    local ecu_1995_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1995_ECV_v01_M"
    local ecu_1998_m_name     ECU_1998_ECV_v01_M
    local ecu_1998_m_title    "Encuesta Condiciones de Vida 1998"
    local ecu_1998_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1998_ECV_v01_M"
    local gtm_2000_m_name     GTM_2000_ENCOVI_v01_M
    local gtm_2000_m_title    "Encuesta Nacional sobre Condiciones de Vida 2000"
    local gtm_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GTM_2000_ENCOVI_v01_M"
    local guy_1992_m_name     GUY_1992_LSMS_v01_M
    local guy_1992_m_title    "Living Standards Measurements Survey / Household Income and Expenditure Survey 1992-1993"
    local guy_1992_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GUY_1992_LSMS_v01_M"
    local arg_1970_m_name     ARG_1970_PHC_v01_M
    local arg_1970_m_title    "Censo Nacional de Población, Familias y Viviendas 1970"
    local arg_1970_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1970_PHC_v01_M"
    local arg_1970_ipumsh_name     ARG_1970_PHC_v01_M_v01_A_IPUMSH
    local arg_1970_ipumsh_title    "National Population, Family, and Housing Census 1970 - IPUMS Subset"
    local arg_1970_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1970_PHC_v01_M_v01_A_IPUMSH"
    local jam_1988_m_name     JAM_1988_SLC_v01_M
    local jam_1988_m_title    "Survey of Living Conditions 1988"
    local jam_1988_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1988_SLC_v01_M"
    local jam_1989_m_name     JAM_1989_SLC1_v01_M
    local jam_1989_m_title    "Survey of Living Conditions 1989(1)"
    local jam_1989_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1989_SLC1_v01_M"
    local jam_1989_m_name     JAM_1989_SLC2_v01_M
    local jam_1989_m_title    "Survey of Living Conditions 1989(2)"
    local jam_1989_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1989_SLC2_v01_M"
    local jam_1990_m_name     JAM_1990_SLC_v01_M
    local jam_1990_m_title    "Survey of Living Conditions 1990"
    local jam_1990_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1990_SLC_v01_M"
    local jam_1991_m_name     JAM_1991_SLC_v01_M
    local jam_1991_m_title    "Survey of Living Conditions 1991"
    local jam_1991_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1991_SLC_v01_M"
    local jam_1992_m_name     JAM_1992_SLC_v01_M
    local jam_1992_m_title    "Survey of Living Conditions 1992"
    local jam_1992_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1992_SLC_v01_M"
    local jam_1993_m_name     JAM_1993_SLC_v01_M
    local jam_1993_m_title    "Survey of Living Conditions 1993"
    local jam_1993_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1993_SLC_v01_M"
    local jam_1994_m_name     JAM_1994_SLC_v01_M
    local jam_1994_m_title    "Survey of Living Conditions 1994"
    local jam_1994_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1994_SLC_v01_M"
    local jam_1995_m_name     JAM_1995_SLC_v01_M
    local jam_1995_m_title    "Survey of Living Conditions 1995"
    local jam_1995_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1995_SLC_v01_M"
    local arg_1980_ipumsh_name     ARG_1980_PHC_v01_M_v01_A_IPUMSH
    local arg_1980_ipumsh_title    "National Population and Housing Census 1980 - IPUMS Subset"
    local arg_1980_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1980_PHC_v01_M_v01_A_IPUMSH"
    local jam_1996_m_name     JAM_1996_SLC_v01_M
    local jam_1996_m_title    "Survey of Living Conditions 1996"
    local jam_1996_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1996_SLC_v01_M"
    local arg_1980_m_name     ARG_1980_PHC_v01_M
    local arg_1980_m_title    "Censo Nacional de Población y Viviendas 1980"
    local arg_1980_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1980_PHC_v01_M"
    local jam_1997_m_name     JAM_1997_SLC_v01_M
    local jam_1997_m_title    "Survey of Living Conditions 1997"
    local jam_1997_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1997_SLC_v01_M"
    local jam_1998_m_name     JAM_1998_SLC_v01_M
    local jam_1998_m_title    "Survey of Living Conditions 1998"
    local jam_1998_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1998_SLC_v01_M"
    local jam_1999_m_name     JAM_1999_SLC_v01_M
    local jam_1999_m_title    "Survey of Living Conditions 1999"
    local jam_1999_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1999_SLC_v01_M"
    local jam_2000_m_name     JAM_2000_SLC_v01_M
    local jam_2000_m_title    "Survey of Living Conditions 2000"
    local jam_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_2000_SLC_v01_M"
    local arg_1991_ipumsh_name     ARG_1991_PHC_v01_M_v01_A_IPUMSH
    local arg_1991_ipumsh_title    "National Population and Housing Census 1991 - IPUMS Subset"
    local arg_1991_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1991_PHC_v01_M_v01_A_IPUMSH"
    local arg_1991_m_name     ARG_1991_PHC_v01_M
    local arg_1991_m_title    "Censo Nacional de Población y Vivienda 1991"
    local arg_1991_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1991_PHC_v01_M"
    local arg_2001_ipumsh_name     ARG_2001_PHC_v01_M_v01_A_IPUMSH
    local arg_2001_ipumsh_title    "National Population, Households and Dwellings Census 2001 - IPUMS Subset"
    local arg_2001_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2001_PHC_v01_M_v01_A_IPUMSH"
    local arg_2001_m_name     ARG_2001_PHC_v01_M
    local arg_2001_m_title    "Censo Nacional de Población, Familias y Viviendas 2001"
    local arg_2001_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2001_PHC_v01_M"
    local bol_1976_ipumsh_name     BOL_1976_PHC_v01_M_v01_A_IPUMSH
    local bol_1976_ipumsh_title    "Census of Population and Housing 1976 - IPUMS Subset"
    local bol_1976_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_1976_PHC_v01_M_v01_A_IPUMSH"
    local bol_1976_m_name     BOL_1976_PHC_v01_M
    local bol_1976_m_title    "Censo de Población y Vivienda 1976"
    local bol_1976_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_1976_PHC_v01_M"
    local bol_1992_ipumsh_name     BOL_1992_PHC_v01_M_v01_A_IPUMSH
    local bol_1992_ipumsh_title    "National Census of Population and Housing 1992 - IPUMS Subset"
    local bol_1992_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_1992_PHC_v01_M_v01_A_IPUMSH"
    local bol_1992_m_name     BOL_1992_PHC_v01_M
    local bol_1992_m_title    "Censo Nacional de Población y Vivienda 1992"
    local bol_1992_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_1992_PHC_v01_M"
    local bol_2001_m_name     BOL_2001_PHC_v01_M
    local bol_2001_m_title    "Censo Nacional de Población y Vivienda 2001"
    local bol_2001_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_2001_PHC_v01_M"
    local bol_2001_ipumsh_name     BOL_2001_PHC_v01_M_v01_A_IPUMSH
    local bol_2001_ipumsh_title    "National Census of Population and Housing 2001 - IPUMS Subset"
    local bol_2001_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_2001_PHC_v01_M_v01_A_IPUMSH"
    local bra_1960_m_name     BRA_1960_PHC_v01_M
    local bra_1960_m_title    "Censo Demográfico 1960, Recenseamento Geral"
    local bra_1960_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1960_PHC_v01_M"
    local bra_1960_ipumsh_name     BRA_1960_PHC_v01_M_v01_A_IPUMSH
    local bra_1960_ipumsh_title    "Demographic Census 1960 - IPUMS Subset"
    local bra_1960_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1960_PHC_v01_M_v01_A_IPUMSH"
    local bra_1970_m_name     BRA_1970_PHC_v01_M
    local bra_1970_m_title    "Censo Demográfico 1970, Recenseamento Geral"
    local bra_1970_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1970_PHC_v01_M"
    local bra_1970_ipumsh_name     BRA_1970_PHC_v01_M_v01_A_IPUMSH
    local bra_1970_ipumsh_title    "Demographic Census 1970 - IPUMS Subset"
    local bra_1970_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1970_PHC_v01_M_v01_A_IPUMSH"
    local nic_1993_m_name     NIC_1993_EMNV_v01_M
    local nic_1993_m_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 1993"
    local nic_1993_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/NIC_1993_EMNV_v01_M"
    local nic_1998_m_name     NIC_1998_EMNV_v01_M
    local nic_1998_m_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 1998-1999 (Panel)"
    local nic_1998_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/NIC_1998_EMNV_v01_M"
    local bra_1980_m_name     BRA_1980_PHC_v01_M
    local bra_1980_m_title    "Censo Demográfico 1980, Recenseamento Geral"
    local bra_1980_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1980_PHC_v01_M"
    local bra_1980_ipumsh_name     BRA_1980_PHC_v01_M_v01_A_IPUMSH
    local bra_1980_ipumsh_title    "Demographic Census 1980 - IPUMS Subset"
    local bra_1980_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1980_PHC_v01_M_v01_A_IPUMSH"
    local bra_1991_m_name     BRA_1991_PHC_v01_M
    local bra_1991_m_title    "Censo Demográfico 1991, Recenseamento Geral"
    local bra_1991_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1991_PHC_v01_M"
    local bra_1991_ipumsh_name     BRA_1991_PHC_v01_M_v01_A_IPUMSH
    local bra_1991_ipumsh_title    "Demographic Census 1991 - IPUMS Subset"
    local bra_1991_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1991_PHC_v01_M_v01_A_IPUMSH"
    local bra_2000_m_name     BRA_2000_PHC_v01_M
    local bra_2000_m_title    "Censo Demográfico 2000, Recenseamento Geral"
    local bra_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_2000_PHC_v01_M"
    local bra_2000_ipumsh_name     BRA_2000_PHC_v01_M_v01_A_IPUMSH
    local bra_2000_ipumsh_title    "Demographic Census 2000 - IPUMS Subset"
    local bra_2000_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_2000_PHC_v01_M_v01_A_IPUMSH"
    local chl_1960_m_name     CHL_1960_PHC_v01_M
    local chl_1960_m_title    "Censo General de Población y Vivienda 1960"
    local chl_1960_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1960_PHC_v01_M"
    local chl_1960_ipumsh_name     CHL_1960_PHC_v01_M_v01_A_IPUMSH
    local chl_1960_ipumsh_title    "General Census of Population and Housing 1960 - IPUMS Subset"
    local chl_1960_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1960_PHC_v01_M_v01_A_IPUMSH"
    local chl_1970_m_name     CHL_1970_PHC_v01_M
    local chl_1970_m_title    "Censo Nacional de Población y Vivienda 1970"
    local chl_1970_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1970_PHC_v01_M"
    local chl_1970_ipumsh_name     CHL_1970_PHC_v01_M_v01_A_IPUMSH
    local chl_1970_ipumsh_title    "National Census of Population and Housing 1970 - IPUMS Subset"
    local chl_1970_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1970_PHC_v01_M_v01_A_IPUMSH"
    local nic_2001_m_name     NIC_2001_EMNV_v01_M
    local nic_2001_m_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 2001"
    local nic_2001_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/NIC_2001_EMNV_v01_M"
    local nic_2005_m_name     NIC_2005_EMNV_v01_M
    local nic_2005_m_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 2005"
    local nic_2005_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/NIC_2005_EMNV_v01_M"
    local chl_1982_m_name     CHL_1982_PHC_v01_M
    local chl_1982_m_title    "Censo Nacional de Población y Vivienda 1982"
    local chl_1982_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1982_PHC_v01_M"
    local chl_1982_ipumsh_name     CHL_1982_PHC_v01_M_v01_A_IPUMSH
    local chl_1982_ipumsh_title    "National Census of Population and Housing 1982 - IPUMS Subset"
    local chl_1982_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1982_PHC_v01_M_v01_A_IPUMSH"
    local chl_1992_m_name     CHL_1992_PHC_v01_M
    local chl_1992_m_title    "Censo Nacional de Población y Vivienda 1992"
    local chl_1992_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1992_PHC_v01_M"
    local chl_1992_ipumsh_name     CHL_1992_PHC_v01_M_v01_A_IPUMSH
    local chl_1992_ipumsh_title    "National Census of Population and Housing 1992 - IPUMS Subset"
    local chl_1992_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1992_PHC_v01_M_v01_A_IPUMSH"
    local chl_2002_m_name     CHL_2002_PHC_v01_M
    local chl_2002_m_title    "Censo Nacional de Población y Vivienda 2002"
    local chl_2002_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_2002_PHC_v01_M"
    local chl_2002_ipumsh_name     CHL_2002_PHC_v01_M_v01_A_IPUMSH
    local chl_2002_ipumsh_title    "National Census of Population and Housing 2002 - IPUMS Subset"
    local chl_2002_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_2002_PHC_v01_M_v01_A_IPUMSH"
    local pan_1997_m_name     PAN_1997_ENV_v01_M
    local pan_1997_m_title    "Encuesta de Niveles de Vida 1997"
    local pan_1997_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1997_ENV_v01_M"
    local col_1964_m_name     COL_1964_PHC_v01_M
    local col_1964_m_title    "Censo Nacional de Población y Vivienda 1964"
    local col_1964_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_1964_PHC_v01_M"
    local col_1964_ipumsh_name     COL_1964_PHC_v01_M_v01_A_IPUMSH
    local col_1964_ipumsh_title    "National Census of Population and Housing 1964 - IPUMS Subset"
    local col_1964_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_1964_PHC_v01_M_v01_A_IPUMSH"
    local pan_2003_m_name     PAN_2003_ENV_v01_M
    local pan_2003_m_title    "Encuesta de Niveles de Vida 2003"
    local pan_2003_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2003_ENV_v01_M"
    local pan_2008_m_name     PAN_2008_ENV_v01_M
    local pan_2008_m_title    "Encuesta de Niveles de Vida 2008"
    local pan_2008_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2008_ENV_v01_M"
    local col_1973_m_name     COL_1973_PHC_v01_M
    local col_1973_m_title    "Censo Nacional de Población y Vivienda 1973"
    local col_1973_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_1973_PHC_v01_M"
    local col_1973_ipumsh_name     COL_1973_PHC_v01_M_v01_A_IPUMSH
    local col_1973_ipumsh_title    "National Census of Population and Housing 1973 - IPUMS Subset"
    local col_1973_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_1973_PHC_v01_M_v01_A_IPUMSH"
    local col_1985_m_name     COL_1985_PHC_v01_M
    local col_1985_m_title    "Censo Nacional de Población y Vivienda 1985"
    local col_1985_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_1985_PHC_v01_M"
    local col_1985_ipumsh_name     COL_1985_PHC_v01_M_v01_A_IPUMSH
    local col_1985_ipumsh_title    "National Census of Population and Housing 1985 - IPUMS Subset"
    local col_1985_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_1985_PHC_v01_M_v01_A_IPUMSH"
    local col_1993_m_name     COL_1993_PHC_v01_M
    local col_1993_m_title    "Censo Nacional de Población y Vivienda 1993"
    local col_1993_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_1993_PHC_v01_M"
    local col_1993_ipumsh_name     COL_1993_PHC_v01_M_v01_A_IPUMSH
    local col_1993_ipumsh_title    "National Census of Population and Housing 1993 - IPUMS Subset"
    local col_1993_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_1993_PHC_v01_M_v01_A_IPUMSH"
    local mex_1960_m_name     MEX_1960_PHC_v01_M
    local mex_1960_m_title    "Censo General de Población 1960"
    local mex_1960_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1960_PHC_v01_M"
    local mex_1960_ipumsh_name     MEX_1960_PHC_v01_M_v01_A_IPUMSH
    local mex_1960_ipumsh_title    "General Census of Population 1960 - IPUMS Subset"
    local mex_1960_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1960_PHC_v01_M_v01_A_IPUMSH"
    local mex_1970_m_name     MEX_1970_PHC_v01_M
    local mex_1970_m_title    "Censo General de Población 1970"
    local mex_1970_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1970_PHC_v01_M"
    local mex_1970_ipumsh_name     MEX_1970_PHC_v01_M_v01_A_IPUMSH
    local mex_1970_ipumsh_title    "General Census of Population 1970 - IPUMS Subset"
    local mex_1970_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1970_PHC_v01_M_v01_A_IPUMSH"
    local mex_1980_m_name     MEX_1980_PHC_v01_M
    local mex_1980_m_title    "Censo General de Población y Vivienda 1980"
    local mex_1980_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1980_PHC_v01_M"
    local mex_1990_m_name     MEX_1990_PHC_v01_M
    local mex_1990_m_title    "Censo General de Población y Vivienda 1990"
    local mex_1990_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1990_PHC_v01_M"
    local mex_1990_ipumsh_name     MEX_1990_PHC_v01_M_v01_A_IPUMSH
    local mex_1990_ipumsh_title    "General Census of Population and Housing 1990 - IPUMS Subset"
    local mex_1990_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1990_PHC_v01_M_v01_A_IPUMSH"
    local mex_1995_m_name     MEX_1995_PHC_v01_M
    local mex_1995_m_title    "Conteo de Población y Vivienda 1995"
    local mex_1995_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1995_PHC_v01_M"
    local mex_1995_ipumsh_name     MEX_1995_PHC_v01_M_v01_A_IPUMSH
    local mex_1995_ipumsh_title    "Count of Population and Housing 1995 - IPUMS Subset"
    local mex_1995_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1995_PHC_v01_M_v01_A_IPUMSH"
    local mex_2000_m_name     MEX_2000_PHC_v01_M
    local mex_2000_m_title    "Censo de Poblacion y Vivienda 2000"
    local mex_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_2000_PHC_v01_M"
    local mex_2000_ipumsh_name     MEX_2000_PHC_v01_M_v01_A_IPUMSH
    local mex_2000_ipumsh_title    "Census of Population and Housing 2000 - IPUMS Subset"
    local mex_2000_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_2000_PHC_v01_M_v01_A_IPUMSH"
    local mex_2005_ipumsh_name     MEX_2005_PHC_v01_M_v01_A_IPUMSH
    local mex_2005_ipumsh_title    "Count of Population and Housing 2005 - IPUMS Subset"
    local mex_2005_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_2005_PHC_v01_M_v01_A_IPUMSH"
    local mex_2005_m_name     MEX_2005_PHC_v01_M
    local mex_2005_m_title    "Conteo de Población y Vivienda 2005"
    local mex_2005_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_2005_PHC_v01_M"
    local pan_1960_m_name     PAN_1960_PHC_v01_M
    local pan_1960_m_title    "Censo Nacional de Población y Vivienda 1960"
    local pan_1960_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1960_PHC_v01_M"
    local pan_1960_ipumsh_name     PAN_1960_PHC_v01_M_v01_A_IPUMSH
    local pan_1960_ipumsh_title    "National Census of Population and Housing 1960 - IPUMS Subset"
    local pan_1960_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1960_PHC_v01_M_v01_A_IPUMSH"
    local pan_1970_m_name     PAN_1970_PHC_v01_M
    local pan_1970_m_title    "Censo Nacional de Población y Vivienda 1970"
    local pan_1970_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1970_PHC_v01_M"
    local pan_1970_ipumsh_name     PAN_1970_PHC_v01_M_v01_A_IPUMSH
    local pan_1970_ipumsh_title    "National Census of Population and Housing 1970 - IPUMS Subset"
    local pan_1970_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1970_PHC_v01_M_v01_A_IPUMSH"
    local pan_1980_m_name     PAN_1980_PHC_v01_M
    local pan_1980_m_title    "Censo Nacional de Población y Vivienda 1980"
    local pan_1980_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1980_PHC_v01_M"
    local pan_1980_ipumsh_name     PAN_1980_PHC_v01_M_v01_A_IPUMSH
    local pan_1980_ipumsh_title    "National Census of Population and Housing 1980 - IPUMS Subset"
    local pan_1980_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1980_PHC_v01_M_v01_A_IPUMSH"
    local pan_1990_m_name     PAN_1990_PHC_v01_M
    local pan_1990_m_title    "Censo Nacional de Población y Vivienda 1990"
    local pan_1990_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1990_PHC_v01_M"
    local pan_1990_ipumsh_name     PAN_1990_PHC_v01_M_v01_A_IPUMSH
    local pan_1990_ipumsh_title    "National Census of Population and Housing 1990 - IPUMS Subset"
    local pan_1990_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1990_PHC_v01_M_v01_A_IPUMSH"
    local pan_2000_m_name     PAN_2000_PHC_v01_M
    local pan_2000_m_title    "Censo Nacional de Población y Vivienda 2000"
    local pan_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2000_PHC_v01_M"
    local pan_2000_ipumsh_name     PAN_2000_PHC_v01_M_v01_A_IPUMSH
    local pan_2000_ipumsh_title    "National Census of Population and Housing 2000 - IPUMS Subset"
    local pan_2000_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2000_PHC_v01_M_v01_A_IPUMSH"
    local per_2007_m_name     PER_2007_PHC_v01_M
    local per_2007_m_title    "Censos Nacionales 2007, Población y Vivienda"
    local per_2007_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2007_PHC_v01_M"
    local per_2007_ipumsh_name     PER_2007_PHC_v01_M_v01_A_IPUMSH
    local per_2007_ipumsh_title    "National Census 2007 - IPUMS Subset, Population and Housing"
    local per_2007_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2007_PHC_v01_M_v01_A_IPUMSH"
    local per_1993_m_name     PER_1993_PHC_v01_M
    local per_1993_m_title    "Censos Nacionales 1993, Población y Vivienda"
    local per_1993_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_1993_PHC_v01_M"
    local per_1993_ipumsh_name     PER_1993_PHC_v01_M_v01_A_IPUMSH
    local per_1993_ipumsh_title    "National Census 1993 - IPUMS Subset, Population and Housing"
    local per_1993_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_1993_PHC_v01_M_v01_A_IPUMSH"
    local lca_1991_ipumsh_name     LCA_1991_PHC_v01_M_v01_A_IPUMSH
    local lca_1991_ipumsh_title    "Population and Housing Census 1991 - IPUMS Subset"
    local lca_1991_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/LCA_1991_PHC_v01_M_v01_A_IPUMSH"
    local lca_1991_m_name     LCA_1991_PHC_v01_M
    local lca_1991_m_title    "Population and Housing Census 1991"
    local lca_1991_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/LCA_1991_PHC_v01_M"
    local lca_1980_m_name     LCA_1980_PHC_v01_M
    local lca_1980_m_title    "Population Census 1980"
    local lca_1980_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/LCA_1980_PHC_v01_M"
    local lca_1980_ipumsh_name     LCA_1980_PHC_v01_M_v01_A_IPUMSH
    local lca_1980_ipumsh_title    "Population Census 1980 - IPUMS Subset"
    local lca_1980_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/LCA_1980_PHC_v01_M_v01_A_IPUMSH"
    local lca_1960_m_name     LCA_1960_PHC_v01_M
    local lca_1960_m_title    "Population Census 1960"
    local lca_1960_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/LCA_1960_PHC_v01_M"
    local lca_1970_m_name     LCA_1970_PHC_v01_M
    local lca_1970_m_title    "Population Census 1970"
    local lca_1970_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/LCA_1970_PHC_v01_M"
    local lca_2001_m_name     LCA_2001_PHC_v01_M
    local lca_2001_m_title    "Population and Housing Census 2001"
    local lca_2001_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/LCA_2001_PHC_v01_M"
    local ven_1971_ipumsh_name     VEN_1971_PHC_v01_M_v01_A_IPUMSH
    local ven_1971_ipumsh_title    "General Census of Population and Housing 1971 - IPUMS Subset"
    local ven_1971_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_1971_PHC_v01_M_v01_A_IPUMSH"
    local ven_1981_ipumsh_name     VEN_1981_PHC_v01_M_v01_A_IPUMSH
    local ven_1981_ipumsh_title    "General Census of Population and Housing 1981 - IPUMS Subset"
    local ven_1981_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_1981_PHC_v01_M_v01_A_IPUMSH"
    local ven_1990_ipumsh_name     VEN_1990_PHC_v01_M_v01_A_IPUMSH
    local ven_1990_ipumsh_title    "General Census of Population and Housing 1990 - IPUMS Subset"
    local ven_1990_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_1990_PHC_v01_M_v01_A_IPUMSH"
    local ven_2001_ipumsh_name     VEN_2001_PHC_v01_M_v01_A_IPUMSH
    local ven_2001_ipumsh_title    "General Census of Population and Housing 2001 - IPUMS Subset"
    local ven_2001_ipumsh_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_2001_PHC_v01_M_v01_A_IPUMSH"
    local bol_2000_m_name     BOL_2000_MICS_v01_M
    local bol_2000_m_title    "Encuestas de Indicadores Múltiples por Conglomerados 2000"
    local bol_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_2000_MICS_v01_M"
    local cub_2000_m_name     CUB_2000_MICS_v01_M
    local cub_2000_m_title    "Encuestas de Indicadores Múltiples por Conglomerados 2000"
    local cub_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CUB_2000_MICS_v01_M"
    local cub_2006_m_name     CUB_2006_MICS_v01_M
    local cub_2006_m_title    "Encuestas de Indicadores Múltiples por Conglomerados 2006"
    local cub_2006_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CUB_2006_MICS_v01_M"
    local dom_2000_m_name     DOM_2000_MICS_v01_M
    local dom_2000_m_title    "Encuestas de Indicadores Múltiples por Conglomerados 2000"
    local dom_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2000_MICS_v01_M"
    local guy_2000_m_name     GUY_2000_MICS_v01_M
    local guy_2000_m_title    "Multiple Indicator Cluster Survey 2000"
    local guy_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GUY_2000_MICS_v01_M"
    local guy_2006_m_name     GUY_2006_MICS_v01_M
    local guy_2006_m_title    "Multiple Indicator Cluster Survey 2006"
    local guy_2006_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GUY_2006_MICS_v01_M"
    local per_1985_m_name     PER_1985_ENNIV_v01_M
    local per_1985_m_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 1985"
    local per_1985_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_1985_ENNIV_v01_M"
    local per_1990_m_name     PER_1990_ENNIV_v01_M
    local per_1990_m_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 1990"
    local per_1990_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_1990_ENNIV_v01_M"
    local per_1991_m_name     PER_1991_ENNIV_v01_M
    local per_1991_m_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 1991"
    local per_1991_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_1991_ENNIV_v01_M"
    local per_1994_m_name     PER_1994_ENNIV_v01_M
    local per_1994_m_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 1994"
    local per_1994_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_1994_ENNIV_v01_M"
    local hnd_2000_m_name     HND_2000_PETSE_v01_M
    local hnd_2000_m_title    "Public Expenditure Tracking Survey in Education 2000"
    local hnd_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2000_PETSE_v01_M"
    local hnd_2000_m_name     HND_2000_PETSH_v01_M
    local hnd_2000_m_title    "Public Expenditure Tracking Survey in Health 2000"
    local hnd_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2000_PETSH_v01_M"
    local tto_2006_m_name     TTO_2006_MICS_v01_M
    local tto_2006_m_title    "Multiple Indicator Cluster Survey 2006"
    local tto_2006_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/TTO_2006_MICS_v01_M"
    local tto_2000_m_name     TTO_2000_MICS_v01_M
    local tto_2000_m_title    "Multiple Indicator Cluster Survey 2000"
    local tto_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/TTO_2000_MICS_v01_M"
    local sur_2006_m_name     SUR_2006_MICS_v01_M
    local sur_2006_m_title    "Multiple Indicator Cluster Survey 2006"
    local sur_2006_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SUR_2006_MICS_v01_M"
    local sur_1999_m_name     SUR_1999_MICS_v01_M
    local sur_1999_m_title    "Multiple Indicator Cluster Survey 1999"
    local sur_1999_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SUR_1999_MICS_v01_M"
    local ven_2000_m_name     VEN_2000_MICS_v01_M
    local ven_2000_m_title    "Encuestas de Indicadores Múltiples por Conglomerados 2000, Encuesta de Hogares por Muestreo"
    local ven_2000_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_2000_MICS_v01_M"
    local per_2001_m_name     PER_2001_PETSE_v01_M
    local per_2001_m_title    "Public Expenditure Tracking Survey in Education 2001"
    local per_2001_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2001_PETSE_v01_M"
    local per_2001_m_name     PER_2001_PETSH_v01_M
    local per_2001_m_title    "Public Expenditure Tracking Survey in Health 2001"
    local per_2001_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2001_PETSH_v01_M"
    local arg_1980_sedlac_name     ARG_1980_EPH_v01_M_v01_A_SEDLAC
    local arg_1980_sedlac_title    "Encuesta Permanente de Hogares 1980 - SEDLAC - Base de Datos Armonizada"
    local arg_1980_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1980_EPH_v01_M_v01_A_SEDLAC"
    local arg_1986_sedlac_name     ARG_1986_EPH_v01_M_v01_A_SEDLAC
    local arg_1986_sedlac_title    "Encuesta Permanente de Hogares 1986 - SEDLAC - Base de Datos Armonizada"
    local arg_1986_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1986_EPH_v01_M_v01_A_SEDLAC"
    local arg_1988_sedlac_name     ARG_1988_EPH_v01_M_v01_A_SEDLAC
    local arg_1988_sedlac_title    "Encuesta Permanente de Hogares 1988 - SEDLAC - Base de Datos Armonizada"
    local arg_1988_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1988_EPH_v01_M_v01_A_SEDLAC"
    local arg_1991_sedlac_name     ARG_1991_EPH_v01_M_v01_A_SEDLAC
    local arg_1991_sedlac_title    "Encuesta Permanente de Hogares 1991 - SEDLAC - Base de Datos Armonizada"
    local arg_1991_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1991_EPH_v01_M_v01_A_SEDLAC"
    local arg_1992_sedlac_name     ARG_1992_EPH_v01_M_v01_A_SEDLAC
    local arg_1992_sedlac_title    "Encuesta Permanente de Hogares 1992 - SEDLAC - Base de Datos Armonizada"
    local arg_1992_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1992_EPH_v01_M_v01_A_SEDLAC"
    local arg_1993_sedlac_name     ARG_1993_EPH_v01_M_v01_A_SEDLAC
    local arg_1993_sedlac_title    "Encuesta Permanente de Hogares 1993 - SEDLAC - Base de Datos Armonizada"
    local arg_1993_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1993_EPH_v01_M_v01_A_SEDLAC"
    local arg_1994_sedlac_name     ARG_1994_EPH_v01_M_v01_A_SEDLAC
    local arg_1994_sedlac_title    "Encuesta Permanente de Hogares 1994 - SEDLAC - Base de Datos Armonizada"
    local arg_1994_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1994_EPH_v01_M_v01_A_SEDLAC"
    local arg_1995_sedlac_name     ARG_1995_EPH_v01_M_v01_A_SEDLAC
    local arg_1995_sedlac_title    "Encuesta Permanente de Hogares 1995 - SEDLAC - Base de Datos Armonizada"
    local arg_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1995_EPH_v01_M_v01_A_SEDLAC"
    local arg_1996_sedlac_name     ARG_1996_EPH_v01_M_v01_A_SEDLAC
    local arg_1996_sedlac_title    "Encuesta Permanente de Hogares 1996 - SEDLAC - Base de Datos Armonizada"
    local arg_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1996_EPH_v01_M_v01_A_SEDLAC"
    local arg_1997_sedlac_name     ARG_1997_EPH_v01_M_v01_A_SEDLAC
    local arg_1997_sedlac_title    "Encuesta Permanente de Hogares 1997 - SEDLAC - Base de Datos Armonizada"
    local arg_1997_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1997_EPH_v01_M_v01_A_SEDLAC"
    local arg_1998_sedlac_name     ARG_1998_EPH_v01_M_v01_A_SEDLAC
    local arg_1998_sedlac_title    "Encuesta Permanente de Hogares 1998 - SEDLAC - Base de Datos Armonizada"
    local arg_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1998_EPH_v01_M_v01_A_SEDLAC"
    local arg_1999_sedlac_name     ARG_1999_EPH_v01_M_v01_A_SEDLAC
    local arg_1999_sedlac_title    "Encuesta Permanente de Hogares 1999 - SEDLAC - Base de Datos Armonizada"
    local arg_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_1999_EPH_v01_M_v01_A_SEDLAC"
    local arg_2000_sedlac_name     ARG_2000_EPH_v01_M_v01_A_SEDLAC
    local arg_2000_sedlac_title    "Encuesta Permanente de Hogares 2000 - SEDLAC - Base de Datos Armonizada"
    local arg_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2000_EPH_v01_M_v01_A_SEDLAC"
    local arg_2001_sedlac_name     ARG_2001_EPH_v01_M_v01_A_SEDLAC
    local arg_2001_sedlac_title    "Encuesta Permanente de Hogares 2001 - SEDLAC - Base de Datos Armonizada"
    local arg_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2001_EPH_v01_M_v01_A_SEDLAC"
    local arg_2002_sedlac_name     ARG_2002_EPH_v01_M_v01_A_SEDLAC
    local arg_2002_sedlac_title    "Encuesta Permanente de Hogares 2002 - SEDLAC - Base de Datos Armonizada"
    local arg_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2002_EPH_v01_M_v01_A_SEDLAC"
    local arg_2003_sedlac_name     ARG_2003_EPH-S1_v01_M_v01_A_SEDLAC
    local arg_2003_sedlac_title    "Encuesta Permanente de Hogares 2003 - SEDLAC - Base de Datos Armonizada, Primer Semestre"
    local arg_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2003_EPH-S1_v01_M_v01_A_SEDLAC"
    local arg_2003_sedlac_name     ARG_2003_EPH-S2_v01_M_v01_A_SEDLAC
    local arg_2003_sedlac_title    "Encuesta Permanente de Hogares 2003 - SEDLAC - Base de Datos Armonizada, Segundo Semestre"
    local arg_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2003_EPH-S2_v01_M_v01_A_SEDLAC"
    local arg_2004_sedlac_name     ARG_2004_EPH-S1_v01_M_v01_A_SEDLAC
    local arg_2004_sedlac_title    "Encuesta Permanente de Hogares 2004 - SEDLAC - Base de Datos Armonizada, Primer Semestre"
    local arg_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2004_EPH-S1_v01_M_v01_A_SEDLAC"
    local arg_2004_sedlac_name     ARG_2004_EPH-S2_v01_M_v01_A_SEDLAC
    local arg_2004_sedlac_title    "Encuesta Permanente de Hogares 2004 - SEDLAC - Base de Datos Armonizada, Segundo Semestre"
    local arg_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2004_EPH-S2_v01_M_v01_A_SEDLAC"
    local arg_2005_sedlac_name     ARG_2005_EPH-S1_v01_M_v01_A_SEDLAC
    local arg_2005_sedlac_title    "Encuesta Permanente de Hogares 2005 - SEDLAC - Base de Datos Armonizada, Primer Semestre"
    local arg_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2005_EPH-S1_v01_M_v01_A_SEDLAC"
    local arg_2005_sedlac_name     ARG_2005_EPH-S2_v01_M_v01_A_SEDLAC
    local arg_2005_sedlac_title    "Encuesta Permanente de Hogares 2005 - SEDLAC - Base de Datos Armonizada, Segundo Semestre"
    local arg_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2005_EPH-S2_v01_M_v01_A_SEDLAC"
    local arg_2006_sedlac_name     ARG_2006_EPH-S1_v01_M_v01_A_SEDLAC
    local arg_2006_sedlac_title    "Encuesta Permanente de Hogares 2006 - SEDLAC - Base de Datos Armonizada, Primer Semestre"
    local arg_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2006_EPH-S1_v01_M_v01_A_SEDLAC"
    local arg_2006_sedlac_name     ARG_2006_EPH-S2_v01_M_v01_A_SEDLAC
    local arg_2006_sedlac_title    "Encuesta Permanente de Hogares 2006 - SEDLAC - Base de Datos Armonizada, Segundo Semestre"
    local arg_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2006_EPH-S2_v01_M_v01_A_SEDLAC"
    local arg_2007_sedlac_name     ARG_2007_EPH-S1_v01_M_v01_A_SEDLAC
    local arg_2007_sedlac_title    "Encuesta Permanente de Hogares 2007 - SEDLAC - Base de Datos Armonizada, Primer Semestre"
    local arg_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2007_EPH-S1_v01_M_v01_A_SEDLAC"
    local arg_2007_sedlac_name     ARG_2007_EPH-S2_v01_M_v01_A_SEDLAC
    local arg_2007_sedlac_title    "Encuesta Permanente de Hogares 2007 - SEDLAC - Base de Datos Armonizada, Segundo Semestre"
    local arg_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2007_EPH-S2_v01_M_v01_A_SEDLAC"
    local arg_2008_sedlac_name     ARG_2008_EPH-S1_v01_M_v01_A_SEDLAC
    local arg_2008_sedlac_title    "Encuesta Permanente de Hogares 2008 - SEDLAC - Base de Datos Armonizada, Primer Semestre"
    local arg_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2008_EPH-S1_v01_M_v01_A_SEDLAC"
    local arg_2008_sedlac_name     ARG_2008_EPH-S2_v01_M_v01_A_SEDLAC
    local arg_2008_sedlac_title    "Encuesta Permanente de Hogares 2008 - SEDLAC - Base de Datos Armonizada, Segundo Semestre"
    local arg_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2008_EPH-S2_v01_M_v01_A_SEDLAC"
    local arg_2009_sedlac_name     ARG_2009_EPH-S1_v01_M_v01_A_SEDLAC
    local arg_2009_sedlac_title    "Encuesta Permanente de Hogares 2009 - SEDLAC - Base de Datos Armonizada, Primer Semestre"
    local arg_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2009_EPH-S1_v01_M_v01_A_SEDLAC"
    local arg_2009_sedlac_name     ARG_2009_EPH-S2_v01_M_v01_A_SEDLAC
    local arg_2009_sedlac_title    "Encuesta Permanente de Hogares 2009 - SEDLAC - Base de Datos Armonizada, Segundo Semestre"
    local arg_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2009_EPH-S2_v01_M_v01_A_SEDLAC"
    local arg_2010_sedlac_name     ARG_2010_EPH-S1_v01_M_v01_A_SEDLAC
    local arg_2010_sedlac_title    "Encuesta Permanente de Hogares 2010 - SEDLAC - Base de Datos Armonizada, Primer Semestre"
    local arg_2010_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ARG_2010_EPH-S1_v01_M_v01_A_SEDLAC"
    local bhs_2001_sedlac_name     BHS_2001_BLCS_v01_M_v01_A_SEDLAC
    local bhs_2001_sedlac_title    "Living Conditions Survey 2001 - SEDLAC - Base de Datos Armonizada"
    local bhs_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BHS_2001_BLCS_v01_M_v01_A_SEDLAC"
    local blz_1993_sedlac_name     BLZ_1993_LFS_v01_M_v01_A_SEDLAC
    local blz_1993_sedlac_title    "Labour Force Survey 1993 - SEDLAC - Base de Datos Armonizada"
    local blz_1993_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_1993_LFS_v01_M_v01_A_SEDLAC"
    local blz_1994_sedlac_name     BLZ_1994_LFS_v01_M_v01_A_SEDLAC
    local blz_1994_sedlac_title    "Labour Force Survey 1994 - SEDLAC - Base de Datos Armonizada"
    local blz_1994_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_1994_LFS_v01_M_v01_A_SEDLAC"
    local blz_1995_sedlac_name     BLZ_1995_LFS_v01_M_v01_A_SEDLAC
    local blz_1995_sedlac_title    "Labour Force Survey 1995 - SEDLAC - Base de Datos Armonizada"
    local blz_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_1995_LFS_v01_M_v01_A_SEDLAC"
    local blz_1996_sedlac_name     BLZ_1996_LFS_v01_M_v01_A_SEDLAC
    local blz_1996_sedlac_title    "Labour Force Survey 1996 - SEDLAC - Base de Datos Armonizada"
    local blz_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_1996_LFS_v01_M_v01_A_SEDLAC"
    local blz_1997_sedlac_name     BLZ_1997_LFS_v01_M_v01_A_SEDLAC
    local blz_1997_sedlac_title    "Labour Force Survey 1997 - SEDLAC - Base de Datos Armonizada"
    local blz_1997_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_1997_LFS_v01_M_v01_A_SEDLAC"
    local blz_1998_sedlac_name     BLZ_1998_LFS_v01_M_v01_A_SEDLAC
    local blz_1998_sedlac_title    "Labour Force Survey 1998 - SEDLAC - Base de Datos Armonizada"
    local blz_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_1998_LFS_v01_M_v01_A_SEDLAC"
    local blz_1999_sedlac_name     BLZ_1999_LFS_v01_M_v01_A_SEDLAC
    local blz_1999_sedlac_title    "Labour Force Survey 1999 - SEDLAC - Base de Datos Armonizada"
    local blz_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_1999_LFS_v01_M_v01_A_SEDLAC"
    local bol_1992_sedlac_name     BOL_1992_EIH_v01_M_v01_A_SEDLAC
    local bol_1992_sedlac_title    "Encuesta Integrada de Hogares 1992 - SEDLAC - Base de Datos Armonizada"
    local bol_1992_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_1992_EIH_v01_M_v01_A_SEDLAC"
    local bol_1993_sedlac_name     BOL_1993_EIH_v01_M_v01_A_SEDLAC
    local bol_1993_sedlac_title    "Encuesta Integrada de Hogares 1993 - SEDLAC - Base de Datos Armonizada"
    local bol_1993_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_1993_EIH_v01_M_v01_A_SEDLAC"
    local bol_1997_sedlac_name     BOL_1997_ENE_v01_M_v01_A_SEDLAC
    local bol_1997_sedlac_title    "Encuesta Nacional de Empleo 1997 - SEDLAC - Base de Datos Armonizada"
    local bol_1997_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_1997_ENE_v01_M_v01_A_SEDLAC"
    local bol_1999_sedlac_name     BOL_1999_ECH_v01_M_v01_A_SEDLAC
    local bol_1999_sedlac_title    "Encuesta Continua de Hogares 1999 - SEDLAC - Base de Datos Armonizada"
    local bol_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_1999_ECH_v01_M_v01_A_SEDLAC"
    local bol_2000_sedlac_name     BOL_2000_ECH_v01_M_v01_A_SEDLAC
    local bol_2000_sedlac_title    "Encuesta Continua de Hogares 2000 - SEDLAC - Base de Datos Armonizada"
    local bol_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_2000_ECH_v01_M_v01_A_SEDLAC"
    local bol_2001_sedlac_name     BOL_2001_ECH_v01_M_v01_A_SEDLAC
    local bol_2001_sedlac_title    "Encuesta Continua de Hogares 2001 - SEDLAC - Base de Datos Armonizada"
    local bol_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_2001_ECH_v01_M_v01_A_SEDLAC"
    local bol_2002_sedlac_name     BOL_2002_ECH_v01_M_v01_A_SEDLAC
    local bol_2002_sedlac_title    "Encuesta Continua de Hogares 2002 - SEDLAC - Base de Datos Armonizada"
    local bol_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_2002_ECH_v01_M_v01_A_SEDLAC"
    local bol_2003_sedlac_name     BOL_2003_ECH_v01_M_v01_A_SEDLAC
    local bol_2003_sedlac_title    "Encuesta Continua de Hogares 2003-2004 - SEDLAC - Base de Datos Armonizada"
    local bol_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_2003_ECH_v01_M_v01_A_SEDLAC"
    local bol_2005_sedlac_name     BOL_2005_EH_v01_M_v01_A_SEDLAC
    local bol_2005_sedlac_title    "Encuesta de Hogares 2005 - SEDLAC - Base de Datos Armonizada"
    local bol_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_2005_EH_v01_M_v01_A_SEDLAC"
    local bol_2006_sedlac_name     BOL_2006_EH_v01_M_v01_A_SEDLAC
    local bol_2006_sedlac_title    "Encuesta de Hogares 2006 - SEDLAC - Base de Datos Armonizada"
    local bol_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_2006_EH_v01_M_v01_A_SEDLAC"
    local bol_2007_sedlac_name     BOL_2007_EH_v01_M_v01_A_SEDLAC
    local bol_2007_sedlac_title    "Encuesta de Hogares 2007 - SEDLAC - Base de Datos Armonizada"
    local bol_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_2007_EH_v01_M_v01_A_SEDLAC"
    local bra_1992_sedlac_name     BRA_1992_PNAD_v01_M_v01_A_SEDLAC
    local bra_1992_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 1992 - SEDLAC - Base de Datos Armonizada"
    local bra_1992_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1992_PNAD_v01_M_v01_A_SEDLAC"
    local bra_1993_sedlac_name     BRA_1993_PNAD_v01_M_v01_A_SEDLAC
    local bra_1993_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 1993 - SEDLAC - Base de Datos Armonizada"
    local bra_1993_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1993_PNAD_v01_M_v01_A_SEDLAC"
    local bra_1995_sedlac_name     BRA_1995_PNAD_v01_M_v01_A_SEDLAC
    local bra_1995_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 1995 - SEDLAC - Base de Datos Armonizada"
    local bra_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1995_PNAD_v01_M_v01_A_SEDLAC"
    local bra_1996_sedlac_name     BRA_1996_PNAD_v01_M_v01_A_SEDLAC
    local bra_1996_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 1996 - SEDLAC - Base de Datos Armonizada"
    local bra_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1996_PNAD_v01_M_v01_A_SEDLAC"
    local bra_1997_sedlac_name     BRA_1997_PNAD_v01_M_v01_A_SEDLAC
    local bra_1997_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 1997 - SEDLAC - Base de Datos Armonizada"
    local bra_1997_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1997_PNAD_v01_M_v01_A_SEDLAC"
    local bra_1998_sedlac_name     BRA_1998_PNAD_v01_M_v01_A_SEDLAC
    local bra_1998_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 1998 - SEDLAC - Base de Datos Armonizada"
    local bra_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1998_PNAD_v01_M_v01_A_SEDLAC"
    local bra_1999_sedlac_name     BRA_1999_PNAD_v01_M_v01_A_SEDLAC
    local bra_1999_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 1999 - SEDLAC - Base de Datos Armonizada"
    local bra_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_1999_PNAD_v01_M_v01_A_SEDLAC"
    local bra_2001_sedlac_name     BRA_2001_PNAD_v01_M_v01_A_SEDLAC
    local bra_2001_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 2001 - SEDLAC - Base de Datos Armonizada"
    local bra_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_2001_PNAD_v01_M_v01_A_SEDLAC"
    local bra_2002_sedlac_name     BRA_2002_PNAD_v01_M_v01_A_SEDLAC
    local bra_2002_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 2002 - SEDLAC - Base de Datos Armonizada"
    local bra_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_2002_PNAD_v01_M_v01_A_SEDLAC"
    local bra_2003_sedlac_name     BRA_2003_PNAD_v01_M_v01_A_SEDLAC
    local bra_2003_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 2003 - SEDLAC - Base de Datos Armonizada"
    local bra_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_2003_PNAD_v01_M_v01_A_SEDLAC"
    local bra_2004_sedlac_name     BRA_2004_PNAD_v01_M_v01_A_SEDLAC
    local bra_2004_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 2004 - SEDLAC - Base de Datos Armonizada"
    local bra_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_2004_PNAD_v01_M_v01_A_SEDLAC"
    local bra_2005_sedlac_name     BRA_2005_PNAD_v01_M_v01_A_SEDLAC
    local bra_2005_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 2005 - SEDLAC - Base de Datos Armonizada"
    local bra_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_2005_PNAD_v01_M_v01_A_SEDLAC"
    local bra_2006_sedlac_name     BRA_2006_PNAD_v01_M_v01_A_SEDLAC
    local bra_2006_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 2006 - SEDLAC - Base de Datos Armonizada"
    local bra_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_2006_PNAD_v01_M_v01_A_SEDLAC"
    local bra_2007_sedlac_name     BRA_2007_PNAD_v01_M_v01_A_SEDLAC
    local bra_2007_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 2007 - SEDLAC - Base de Datos Armonizada"
    local bra_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_2007_PNAD_v01_M_v01_A_SEDLAC"
    local bra_2008_sedlac_name     BRA_2008_PNAD_v01_M_v01_A_SEDLAC
    local bra_2008_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 2008 - SEDLAC - Base de Datos Armonizada"
    local bra_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_2008_PNAD_v01_M_v01_A_SEDLAC"
    local chl_1987_sedlac_name     CHL_1987_CASEN_v01_M_v01_A_SEDLAC
    local chl_1987_sedlac_title    "Encuesta de Caracterización Socioeconómica Nacional 1987 - SEDLAC - Base de Datos Armonizada"
    local chl_1987_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1987_CASEN_v01_M_v01_A_SEDLAC"
    local chl_1992_sedlac_name     CHL_1992_CASEN_v01_M_v01_A_SEDLAC
    local chl_1992_sedlac_title    "Encuesta de Caracterización Socioeconómica Nacional 1992 - SEDLAC - Base de Datos Armonizada"
    local chl_1992_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1992_CASEN_v01_M_v01_A_SEDLAC"
    local chl_1994_sedlac_name     CHL_1994_CASEN_v01_M_v01_A_SEDLAC
    local chl_1994_sedlac_title    "Encuesta de Caracterización Socioeconómica Nacional 1994 - SEDLAC - Base de Datos Armonizada"
    local chl_1994_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1994_CASEN_v01_M_v01_A_SEDLAC"
    local chl_1996_sedlac_name     CHL_1996_CASEN_v01_M_v01_A_SEDLAC
    local chl_1996_sedlac_title    "Encuesta de Caracterización Socioeconómica Nacional 1996 - SEDLAC - Base de Datos Armonizada"
    local chl_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1996_CASEN_v01_M_v01_A_SEDLAC"
    local chl_1998_sedlac_name     CHL_1998_CASEN_v01_M_v01_A_SEDLAC
    local chl_1998_sedlac_title    "Encuesta de Caracterización Socioeconómica Nacional 1998 - SEDLAC - Base de Datos Armonizada"
    local chl_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1998_CASEN_v01_M_v01_A_SEDLAC"
    local chl_2000_sedlac_name     CHL_2000_CASEN_v01_M_v01_A_SEDLAC
    local chl_2000_sedlac_title    "Encuesta de Caracterización Socioeconómica Nacional 2000 - SEDLAC - Base de Datos Armonizada"
    local chl_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_2000_CASEN_v01_M_v01_A_SEDLAC"
    local chl_2003_sedlac_name     CHL_2003_CASEN_v01_M_v01_A_SEDLAC
    local chl_2003_sedlac_title    "Encuesta de Caracterización Socioeconómica Nacional 2003 - SEDLAC - Base de Datos Armonizada"
    local chl_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_2003_CASEN_v01_M_v01_A_SEDLAC"
    local chl_2006_sedlac_name     CHL_2006_CASEN_v01_M_v01_A_SEDLAC
    local chl_2006_sedlac_title    "Encuesta de Caracterización Socioeconómica Nacional 2006 - SEDLAC - Base de Datos Armonizada"
    local chl_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_2006_CASEN_v01_M_v01_A_SEDLAC"
    local chl_2009_sedlac_name     CHL_2009_CASEN_v01_M_v01_A_SEDLAC
    local chl_2009_sedlac_title    "Encuesta de Caracterización Socioeconómica Nacional 2009 - SEDLAC - Base de Datos Armonizada"
    local chl_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_2009_CASEN_v01_M_v01_A_SEDLAC"
    local col_1992_sedlac_name     COL_1992_ENH_v01_M_v01_A_SEDLAC
    local col_1992_sedlac_title    "Encuesta Nacional de Hogares 1992 - SEDLAC - Base de Datos Armonizada, Fuerza de Trabajo"
    local col_1992_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_1992_ENH_v01_M_v01_A_SEDLAC"
    local col_1996_sedlac_name     COL_1996_ENH_v01_M_v01_A_SEDLAC
    local col_1996_sedlac_title    "Encuesta Nacional de Hogares 1996 - SEDLAC - Base de Datos Armonizada, Fuerza de Trabajo"
    local col_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_1996_ENH_v01_M_v01_A_SEDLAC"
    local col_1999_sedlac_name     COL_1999_ENH_v01_M_v01_A_SEDLAC
    local col_1999_sedlac_title    "Encuesta Nacional de Hogares 1999 - SEDLAC - Base de Datos Armonizada, Fuerza de Trabajo"
    local col_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_1999_ENH_v01_M_v01_A_SEDLAC"
    local col_2000_sedlac_name     COL_2000_ENH_v01_M_v01_A_SEDLAC
    local col_2000_sedlac_title    "Encuesta Nacional de Hogares 2000 - SEDLAC - Base de Datos Armonizada, Fuerza de Trabajo"
    local col_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_2000_ENH_v01_M_v01_A_SEDLAC"
    local col_2001_sedlac_name     COL_2001_ECH_v01_M_v01_A_SEDLAC
    local col_2001_sedlac_title    "Encuesta Continua de Hogares 2001 - SEDLAC - Base de Datos Armonizada"
    local col_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_2001_ECH_v01_M_v01_A_SEDLAC"
    local col_2003_sedlac_name     COL_2003_ECH_v01_M_v01_A_SEDLAC
    local col_2003_sedlac_title    "Encuesta Continua de Hogares 2003 - SEDLAC - Base de Datos Armonizada"
    local col_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_2003_ECH_v01_M_v01_A_SEDLAC"
    local col_2003_sedlac_name     COL_2003_ECV_v01_M_v01_A_SEDLAC
    local col_2003_sedlac_title    "Encuesta de Calidad de Vida 2003 - SEDLAC - Base de Datos Armonizada"
    local col_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_2003_ECV_v01_M_v01_A_SEDLAC"
    local col_2004_sedlac_name     COL_2004_ECH_v01_M_v01_A_SEDLAC
    local col_2004_sedlac_title    "Encuesta Continua de Hogares 2004 - SEDLAC - Base de Datos Armonizada"
    local col_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_2004_ECH_v01_M_v01_A_SEDLAC"
    local col_2006_sedlac_name     COL_2006_GEIH_v01_M_v01_A_SEDLAC
    local col_2006_sedlac_title    "Gran Encuesta Integrada de Hogares 2006 - SEDLAC - Base de Datos Armonizada"
    local col_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_2006_GEIH_v01_M_v01_A_SEDLAC"
    local col_2007_sedlac_name     COL_2007_GEIH_v01_M_v01_A_SEDLAC
    local col_2007_sedlac_title    "Gran Encuesta Integrada de Hogares 2007 - SEDLAC - Base de Datos Armonizada"
    local col_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_2007_GEIH_v01_M_v01_A_SEDLAC"
    local col_2008_sedlac_name     COL_2008_GEIH_v01_M_v01_A_SEDLAC
    local col_2008_sedlac_title    "Gran Encuesta Integrada de Hogares 2008 - SEDLAC - Base de Datos Armonizada"
    local col_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_2008_GEIH_v01_M_v01_A_SEDLAC"
    local cri_1989_sedlac_name     CRI_1989_EHPM_v01_M_v01_A_SEDLAC
    local cri_1989_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1989 - SEDLAC - Base de Datos Armonizada"
    local cri_1989_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1989_EHPM_v01_M_v01_A_SEDLAC"
    local cri_1990_sedlac_name     CRI_1990_EHPM_v01_M_v01_A_SEDLAC
    local cri_1990_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1990 - SEDLAC - Base de Datos Armonizada"
    local cri_1990_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1990_EHPM_v01_M_v01_A_SEDLAC"
    local cri_1991_sedlac_name     CRI_1991_EHPM_v01_M_v01_A_SEDLAC
    local cri_1991_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1991 - SEDLAC - Base de Datos Armonizada"
    local cri_1991_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1991_EHPM_v01_M_v01_A_SEDLAC"
    local cri_1992_sedlac_name     CRI_1992_EHPM_v01_M_v01_A_SEDLAC
    local cri_1992_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1992 - SEDLAC - Base de Datos Armonizada"
    local cri_1992_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1992_EHPM_v01_M_v01_A_SEDLAC"
    local cri_1993_sedlac_name     CRI_1993_EHPM_v01_M_v01_A_SEDLAC
    local cri_1993_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1993 - SEDLAC - Base de Datos Armonizada"
    local cri_1993_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1993_EHPM_v01_M_v01_A_SEDLAC"
    local cri_1994_sedlac_name     CRI_1994_EHPM_v01_M_v01_A_SEDLAC
    local cri_1994_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1994 - SEDLAC - Base de Datos Armonizada"
    local cri_1994_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1994_EHPM_v01_M_v01_A_SEDLAC"
    local cri_1995_sedlac_name     CRI_1995_EHPM_v01_M_v01_A_SEDLAC
    local cri_1995_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1995 - SEDLAC - Base de Datos Armonizada"
    local cri_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1995_EHPM_v01_M_v01_A_SEDLAC"
    local cri_1996_sedlac_name     CRI_1996_EHPM_v01_M_v01_A_SEDLAC
    local cri_1996_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1996 - SEDLAC - Base de Datos Armonizada"
    local cri_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1996_EHPM_v01_M_v01_A_SEDLAC"
    local cri_1997_sedlac_name     CRI_1997_EHPM_v01_M_v01_A_SEDLAC
    local cri_1997_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1997 - SEDLAC - Base de Datos Armonizada"
    local cri_1997_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1997_EHPM_v01_M_v01_A_SEDLAC"
    local cri_1998_sedlac_name     CRI_1998_EHPM_v01_M_v01_A_SEDLAC
    local cri_1998_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1998 - SEDLAC - Base de Datos Armonizada"
    local cri_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1998_EHPM_v01_M_v01_A_SEDLAC"
    local cri_1999_sedlac_name     CRI_1999_EHPM_v01_M_v01_A_SEDLAC
    local cri_1999_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1999 - SEDLAC - Base de Datos Armonizada"
    local cri_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1999_EHPM_v01_M_v01_A_SEDLAC"
    local cri_2000_sedlac_name     CRI_2000_EHPM_v01_M_v01_A_SEDLAC
    local cri_2000_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2000 - SEDLAC - Base de Datos Armonizada"
    local cri_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_2000_EHPM_v01_M_v01_A_SEDLAC"
    local cri_2001_sedlac_name     CRI_2001_EHPM_v01_M_v01_A_SEDLAC
    local cri_2001_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2001 - SEDLAC - Base de Datos Armonizada"
    local cri_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_2001_EHPM_v01_M_v01_A_SEDLAC"
    local cri_2002_sedlac_name     CRI_2002_EHPM_v01_M_v01_A_SEDLAC
    local cri_2002_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2002 - SEDLAC - Base de Datos Armonizada"
    local cri_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_2002_EHPM_v01_M_v01_A_SEDLAC"
    local cri_2003_sedlac_name     CRI_2003_EHPM_v01_M_v01_A_SEDLAC
    local cri_2003_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2003 - SEDLAC - Base de Datos Armonizada"
    local cri_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_2003_EHPM_v01_M_v01_A_SEDLAC"
    local cri_2004_sedlac_name     CRI_2004_EHPM_v01_M_v01_A_SEDLAC
    local cri_2004_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2004 - SEDLAC - Base de Datos Armonizada"
    local cri_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_2004_EHPM_v01_M_v01_A_SEDLAC"
    local cri_2005_sedlac_name     CRI_2005_EHPM_v01_M_v01_A_SEDLAC
    local cri_2005_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2005 - SEDLAC - Base de Datos Armonizada"
    local cri_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_2005_EHPM_v01_M_v01_A_SEDLAC"
    local cri_2006_sedlac_name     CRI_2006_EHPM_v01_M_v01_A_SEDLAC
    local cri_2006_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2006 - SEDLAC - Base de Datos Armonizada"
    local cri_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_2006_EHPM_v01_M_v01_A_SEDLAC"
    local cri_2007_sedlac_name     CRI_2007_EHPM_v01_M_v01_A_SEDLAC
    local cri_2007_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2007 - SEDLAC - Base de Datos Armonizada"
    local cri_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_2007_EHPM_v01_M_v01_A_SEDLAC"
    local cri_2008_sedlac_name     CRI_2008_EHPM_v01_M_v01_A_SEDLAC
    local cri_2008_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2008 - SEDLAC - Base de Datos Armonizada"
    local cri_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_2008_EHPM_v01_M_v01_A_SEDLAC"
    local cri_2009_sedlac_name     CRI_2009_EHPM_v01_M_v01_A_SEDLAC
    local cri_2009_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2009 - SEDLAC - Base de Datos Armonizada"
    local cri_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_2009_EHPM_v01_M_v01_A_SEDLAC"
    local dom_1996_sedlac_name     DOM_1996_ENFT_v01_M_v01_A_SEDLAC
    local dom_1996_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 1996 - SEDLAC - Base de Datos Armonizada"
    local dom_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_1996_ENFT_v01_M_v01_A_SEDLAC"
    local dom_1997_sedlac_name     DOM_1997_ENFT_v01_M_v01_A_SEDLAC
    local dom_1997_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 1997 - SEDLAC - Base de Datos Armonizada"
    local dom_1997_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_1997_ENFT_v01_M_v01_A_SEDLAC"
    local dom_2000_sedlac_name     DOM_2000_ENFT_v01_M_v01_A_SEDLAC
    local dom_2000_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 2000 - SEDLAC - Base de Datos Armonizada"
    local dom_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2000_ENFT_v01_M_v01_A_SEDLAC"
    local dom_2002_sedlac_name     DOM_2002_ENFT_v01_M_v01_A_SEDLAC
    local dom_2002_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 2002 - SEDLAC - Base de Datos Armonizada"
    local dom_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2002_ENFT_v01_M_v01_A_SEDLAC"
    local dom_2003_sedlac_name     DOM_2003_ENFT_v01_M_v01_A_SEDLAC
    local dom_2003_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 2003 - SEDLAC - Base de Datos Armonizada"
    local dom_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2003_ENFT_v01_M_v01_A_SEDLAC"
    local dom_2004_sedlac_name     DOM_2004_ENFT_v01_M_v01_A_SEDLAC
    local dom_2004_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 2004 - SEDLAC - Base de Datos Armonizada"
    local dom_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2004_ENFT_v01_M_v01_A_SEDLAC"
    local dom_2005_sedlac_name     DOM_2005_ENFT_v01_M_v01_A_SEDLAC
    local dom_2005_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 2005 - SEDLAC - Base de Datos Armonizada"
    local dom_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2005_ENFT_v01_M_v01_A_SEDLAC"
    local dom_2006_sedlac_name     DOM_2006_ENFT_v01_M_v01_A_SEDLAC
    local dom_2006_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 2006 - SEDLAC - Base de Datos Armonizada"
    local dom_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2006_ENFT_v01_M_v01_A_SEDLAC"
    local dom_2007_sedlac_name     DOM_2007_ENFT_v01_M_v01_A_SEDLAC
    local dom_2007_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 2007 - SEDLAC - Base de Datos Armonizada"
    local dom_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2007_ENFT_v01_M_v01_A_SEDLAC"
    local dom_2008_sedlac_name     DOM_2008_ENFT_v01_M_v01_A_SEDLAC
    local dom_2008_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 2008 - SEDLAC - Base de Datos Armonizada"
    local dom_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2008_ENFT_v01_M_v01_A_SEDLAC"
    local dom_2009_sedlac_name     DOM_2009_ENFT_v01_M_v01_A_SEDLAC
    local dom_2009_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 2009 - SEDLAC - Base de Datos Armonizada"
    local dom_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2009_ENFT_v01_M_v01_A_SEDLAC"
    local ecu_1994_sedlac_name     ECU_1994_ECV_v01_M_v01_A_SEDLAC
    local ecu_1994_sedlac_title    "Encuesta de Condiciones de Vida 1994 - SEDLAC - Base de Datos Armonizada"
    local ecu_1994_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1994_ECV_v01_M_v01_A_SEDLAC"
    local ecu_1995_sedlac_name     ECU_1995_ECV_v01_M_v01_A_SEDLAC
    local ecu_1995_sedlac_title    "Encuesta de Condiciones de Vida 1995 - SEDLAC - Base de Datos Armonizada"
    local ecu_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1995_ECV_v01_M_v01_A_SEDLAC"
    local ecu_1995_sedlac_name     ECU_1995_EPED_v01_M_v01_A_SEDLAC
    local ecu_1995_sedlac_title    "Encuesta Periódica de Empleo, Desempleo y Subempleo 1995 - SEDLAC - Base de Datos Armonizada"
    local ecu_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1995_EPED_v01_M_v01_A_SEDLAC"
    local ecu_1998_sedlac_name     ECU_1998_ECV_v01_M_v01_A_SEDLAC
    local ecu_1998_sedlac_title    "Encuesta de Condiciones de Vida 1998 - SEDLAC - Base de Datos Armonizada"
    local ecu_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1998_ECV_v01_M_v01_A_SEDLAC"
    local ecu_1998_sedlac_name     ECU_1998_EPED_v01_M_v01_A_SEDLAC
    local ecu_1998_sedlac_title    "Encuesta Periódica de Empleo, Desempleo y Subempleo en el Área Urbano 1998 - SEDLAC - Base de Datos Armonizada"
    local ecu_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1998_EPED_v01_M_v01_A_SEDLAC"
    local ecu_1999_sedlac_name     ECU_1999_ECV_v01_M_v01_A_SEDLAC
    local ecu_1999_sedlac_title    "Encuesta de Condiciones de Vida 1999 - SEDLAC - Base de Datos Armonizada"
    local ecu_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1999_ECV_v01_M_v01_A_SEDLAC"
    local ecu_2000_sedlac_name     ECU_2000_EPED_v01_M_v01_A_SEDLAC
    local ecu_2000_sedlac_title    "Encuesta Periódica de Empleo, Desempleo y Subempleo 2000 - SEDLAC - Base de Datos Armonizada"
    local ecu_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_2000_EPED_v01_M_v01_A_SEDLAC"
    local ecu_2003_sedlac_name     ECU_2003_ENEMDU_v01_M_v01_A_SEDLAC
    local ecu_2003_sedlac_title    "Encuesta Nacional de Empleo Desempleo y Subempleo 2003 - SEDLAC - Base de Datos Armonizada"
    local ecu_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_2003_ENEMDU_v01_M_v01_A_SEDLAC"
    local ecu_2004_sedlac_name     ECU_2004_ENEMDU_v01_M_v01_A_SEDLAC
    local ecu_2004_sedlac_title    "Encuesta Nacional de Empleo Desempleo y Subempleo 2004 - SEDLAC - Base de Datos Armonizada"
    local ecu_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_2004_ENEMDU_v01_M_v01_A_SEDLAC"
    local ecu_2005_sedlac_name     ECU_2005_ENEMDU_v01_M_v01_A_SEDLAC
    local ecu_2005_sedlac_title    "Encuesta Nacional de Empleo Desempleo y Subempleo 2005 - SEDLAC - Base de Datos Armonizada"
    local ecu_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_2005_ENEMDU_v01_M_v01_A_SEDLAC"
    local ecu_2006_sedlac_name     ECU_2006_ECV_v01_M_v01_A_SEDLAC
    local ecu_2006_sedlac_title    "Encuesta de Condiciones de Vida 2006 - SEDLAC - Base de Datos Armonizada"
    local ecu_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_2006_ECV_v01_M_v01_A_SEDLAC"
    local ecu_2006_sedlac_name     ECU_2006_ENEMDU_v01_M_v01_A_SEDLAC
    local ecu_2006_sedlac_title    "Encuesta Nacional de Empleo Desempleo y Subempleo 2006 - SEDLAC - Base de Datos Armonizada"
    local ecu_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_2006_ENEMDU_v01_M_v01_A_SEDLAC"
    local ecu_2007_sedlac_name     ECU_2007_ENEMDU_v01_M_v01_A_SEDLAC
    local ecu_2007_sedlac_title    "Encuesta Nacional de Empleo Desempleo y Subempleo 2007 - SEDLAC - Base de Datos Armonizada"
    local ecu_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_2007_ENEMDU_v01_M_v01_A_SEDLAC"
    local ecu_2008_sedlac_name     ECU_2008_ENEMDU_v01_M_v01_A_SEDLAC
    local ecu_2008_sedlac_title    "Encuesta Nacional de Empleo Desempleo y Subempleo 2008 - SEDLAC - Base de Datos Armonizada"
    local ecu_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_2008_ENEMDU_v01_M_v01_A_SEDLAC"
    local ecu_2009_sedlac_name     ECU_2009_ENEMDU_v01_M_v01_A_SEDLAC
    local ecu_2009_sedlac_title    "Encuesta Nacional de Empleo Desempleo y Subempleo 2009 - SEDLAC - Base de Datos Armonizada"
    local ecu_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_2009_ENEMDU_v01_M_v01_A_SEDLAC"
    local gtm_2000_sedlac_name     GTM_2000_ENCOVI_v01_M_v01_A_SEDLAC
    local gtm_2000_sedlac_title    "Encuesta Nacional de Condiciones de Vida 2000 - SEDLAC - Base de Datos Armonizada"
    local gtm_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GTM_2000_ENCOVI_v01_M_v01_A_SEDLAC"
    local gtm_2002_sedlac_name     GTM_2002_ENEI_v01_M_v01_A_SEDLAC
    local gtm_2002_sedlac_title    "Encuesta Nacional de Empleo e Ingresos 2002 - SEDLAC - Base de Datos Armonizada"
    local gtm_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GTM_2002_ENEI_v01_M_v01_A_SEDLAC"
    local gtm_2003_sedlac_name     GTM_2003_ENEI_v01_M_v01_A_SEDLAC
    local gtm_2003_sedlac_title    "Encuesta Nacional de Empleo e Ingresos 2003 - SEDLAC - Base de Datos Armonizada"
    local gtm_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GTM_2003_ENEI_v01_M_v01_A_SEDLAC"
    local gtm_2004_sedlac_name     GTM_2004_ENEI_v01_M_v01_A_SEDLAC
    local gtm_2004_sedlac_title    "Encuesta Nacional de Empleo e Ingresos 2004 - SEDLAC - Base de Datos Armonizada"
    local gtm_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GTM_2004_ENEI_v01_M_v01_A_SEDLAC"
    local gtm_2006_sedlac_name     GTM_2006_ENCOVI_v01_M_v01_A_SEDLAC
    local gtm_2006_sedlac_title    "Encuesta Nacional de Condiciones de Vida 2006 - SEDLAC - Base de Datos Armonizada"
    local gtm_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GTM_2006_ENCOVI_v01_M_v01_A_SEDLAC"
    local guy_1992_sedlac_name     GUY_1992_LSMS_v01_M_v01_A_SEDLAC
    local guy_1992_sedlac_title    "Household Income and Expenditure Survey / Living Standard Measurement Study 1992-1993 - SEDLAC - Base de Datos Armonizada"
    local guy_1992_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GUY_1992_LSMS_v01_M_v01_A_SEDLAC"
    local hnd_1991_sedlac_name     HND_1991_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_1991_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 1991 - SEDLAC - Base de Datos Armonizada"
    local hnd_1991_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1991_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_1992_sedlac_name     HND_1992_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_1992_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 1992 - SEDLAC - Base de Datos Armonizada"
    local hnd_1992_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1992_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_1993_sedlac_name     HND_1993_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_1993_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 1993 - SEDLAC - Base de Datos Armonizada"
    local hnd_1993_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1993_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_1994_sedlac_name     HND_1994_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_1994_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 1994 - SEDLAC - Base de Datos Armonizada"
    local hnd_1994_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1994_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_1995_sedlac_name     HND_1995_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_1995_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 1995 - SEDLAC - Base de Datos Armonizada"
    local hnd_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1995_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_1996_sedlac_name     HND_1996_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_1996_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 1996 - SEDLAC - Base de Datos Armonizada"
    local hnd_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1996_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_1997_sedlac_name     HND_1997_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_1997_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 1997 - SEDLAC - Base de Datos Armonizada"
    local hnd_1997_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1997_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_1998_sedlac_name     HND_1998_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_1998_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 1998 - SEDLAC - Base de Datos Armonizada"
    local hnd_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1998_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_1999_sedlac_name     HND_1999_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_1999_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 1999 - SEDLAC - Base de Datos Armonizada"
    local hnd_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1999_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_2001_sedlac_name     HND_2001_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_2001_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 2001 - SEDLAC - Base de Datos Armonizada"
    local hnd_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2001_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_2002_sedlac_name     HND_2002_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_2002_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 2002 - SEDLAC - Base de Datos Armonizada"
    local hnd_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2002_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_2003_sedlac_name     HND_2003_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_2003_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 2003 - SEDLAC - Base de Datos Armonizada"
    local hnd_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2003_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_2004_sedlac_name     HND_2004_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_2004_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 2004 - SEDLAC - Base de Datos Armonizada"
    local hnd_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2004_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_2005_sedlac_name     HND_2005_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_2005_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 2005 - SEDLAC - Base de Datos Armonizada"
    local hnd_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2005_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_2006_sedlac_name     HND_2006_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_2006_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 2006 - SEDLAC - Base de Datos Armonizada"
    local hnd_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2006_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_2007_sedlac_name     HND_2007_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_2007_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 2007 - SEDLAC - Base de Datos Armonizada"
    local hnd_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2007_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_2008_sedlac_name     HND_2008_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_2008_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 2008 - SEDLAC - Base de Datos Armonizada"
    local hnd_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2008_EPHPM_v01_M_v01_A_SEDLAC"
    local hnd_2009_sedlac_name     HND_2009_EPHPM_v01_M_v01_A_SEDLAC
    local hnd_2009_sedlac_title    "Encuesta Permanente de Hogares de Propósitos Múltiples 2009 - SEDLAC - Base de Datos Armonizada"
    local hnd_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2009_EPHPM_v01_M_v01_A_SEDLAC"
    local hti_2001_sedlac_name     HTI_2001_ECVH_v01_M_v01_A_SEDLAC
    local hti_2001_sedlac_title    "Enquête sur les Conditions de Vie 2001 - SEDLAC - Base de Datos Armonizada"
    local hti_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HTI_2001_ECVH_v01_M_v01_A_SEDLAC"
    local jam_1990_sedlac_name     JAM_1990_SLC_v01_M_v01_A_SEDLAC
    local jam_1990_sedlac_title    "Survey of Living Conditions 1990 - SEDLAC - Base de Datos Armonizada"
    local jam_1990_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1990_SLC_v01_M_v01_A_SEDLAC"
    local jam_1996_sedlac_name     JAM_1996_SLC_v01_M_v01_A_SEDLAC
    local jam_1996_sedlac_title    "Survey of Living Conditions 1996 - SEDLAC - Base de Datos Armonizada"
    local jam_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1996_SLC_v01_M_v01_A_SEDLAC"
    local jam_1999_sedlac_name     JAM_1999_SLC_v01_M_v01_A_SEDLAC
    local jam_1999_sedlac_title    "Survey of Living Conditions 1999 - SEDLAC - Base de Datos Armonizada"
    local jam_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1999_SLC_v01_M_v01_A_SEDLAC"
    local jam_2001_sedlac_name     JAM_2001_SLC_v01_M_v01_A_SEDLAC
    local jam_2001_sedlac_title    "Survey of Living Conditions 2001 - SEDLAC - Base de Datos Armonizada"
    local jam_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_2001_SLC_v01_M_v01_A_SEDLAC"
    local jam_2002_sedlac_name     JAM_2002_SLC_v01_M_v01_A_SEDLAC
    local jam_2002_sedlac_title    "Survey of Living Conditions 2002 - SEDLAC - Base de Datos Armonizada"
    local jam_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_2002_SLC_v01_M_v01_A_SEDLAC"
    local mex_1989_sedlac_name     MEX_1989_ENIGH_v01_M_v01_A_SEDLAC
    local mex_1989_sedlac_title    "Encuesta Nacional de Ingresos y Gastos de los Hogares 1989 - SEDLAC - Base de Datos Armonizada"
    local mex_1989_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1989_ENIGH_v01_M_v01_A_SEDLAC"
    local mex_1992_sedlac_name     MEX_1992_ENIGH_v01_M_v01_A_SEDLAC
    local mex_1992_sedlac_title    "Encuesta Nacional de Ingresos y Gastos de los Hogares 1992 - SEDLAC - Base de Datos Armonizada"
    local mex_1992_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1992_ENIGH_v01_M_v01_A_SEDLAC"
    local mex_1994_sedlac_name     MEX_1994_ENIGH_v01_M_v01_A_SEDLAC
    local mex_1994_sedlac_title    "Encuesta Nacional de Ingresos y Gastos de los Hogares 1994 - SEDLAC - Base de Datos Armonizada"
    local mex_1994_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1994_ENIGH_v01_M_v01_A_SEDLAC"
    local mex_1996_sedlac_name     MEX_1996_ENIGH_v01_M_v01_A_SEDLAC
    local mex_1996_sedlac_title    "Encuesta Nacional de Ingresos y Gastos de los Hogares 1996 - SEDLAC - Base de Datos Armonizada"
    local mex_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1996_ENIGH_v01_M_v01_A_SEDLAC"
    local mex_1998_sedlac_name     MEX_1998_ENIGH_v01_M_v01_A_SEDLAC
    local mex_1998_sedlac_title    "Encuesta Nacional de Ingresos y Gastos de los Hogares 1998 - SEDLAC - Base de Datos Armonizada"
    local mex_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_1998_ENIGH_v01_M_v01_A_SEDLAC"
    local mex_2000_sedlac_name     MEX_2000_ENIGH_v01_M_v01_A_SEDLAC
    local mex_2000_sedlac_title    "Encuesta Nacional de Ingresos y Gastos de los Hogares 2000 - SEDLAC - Base de Datos Armonizada"
    local mex_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_2000_ENIGH_v01_M_v01_A_SEDLAC"
    local mex_2002_sedlac_name     MEX_2002_ENIGH_v01_M_v01_A_SEDLAC
    local mex_2002_sedlac_title    "Encuesta Nacional de Ingresos y Gastos de los Hogares 2002 - SEDLAC - Base de Datos Armonizada"
    local mex_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_2002_ENIGH_v01_M_v01_A_SEDLAC"
    local mex_2004_sedlac_name     MEX_2004_ENIGH_v01_M_v01_A_SEDLAC
    local mex_2004_sedlac_title    "Encuesta Nacional de Ingresos y Gastos de los Hogares 2004 - SEDLAC - Base de Datos Armonizada"
    local mex_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_2004_ENIGH_v01_M_v01_A_SEDLAC"
    local mex_2005_sedlac_name     MEX_2005_ENIGH_v01_M_v01_A_SEDLAC
    local mex_2005_sedlac_title    "Encuesta Nacional de Ingresos y Gastos de los Hogares 2005 - SEDLAC - Base de Datos Armonizada"
    local mex_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_2005_ENIGH_v01_M_v01_A_SEDLAC"
    local mex_2006_sedlac_name     MEX_2006_ENIGH_v01_M_v01_A_SEDLAC
    local mex_2006_sedlac_title    "Encuesta Nacional de Ingresos y Gastos de los Hogares 2006 - SEDLAC - Base de Datos Armonizada"
    local mex_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_2006_ENIGH_v01_M_v01_A_SEDLAC"
    local mex_2008_sedlac_name     MEX_2008_ENIGH_v01_M_v01_A_SEDLAC
    local mex_2008_sedlac_title    "Encuesta Nacional de Ingresos y Gastos de los Hogares 2008 - SEDLAC - Base de Datos Armonizada"
    local mex_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_2008_ENIGH_v01_M_v01_A_SEDLAC"
    local nic_1993_sedlac_name     NIC_1993_EMNV_v01_M_v01_A_SEDLAC
    local nic_1993_sedlac_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 1993 - SEDLAC - Base de Datos Armonizada"
    local nic_1993_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/NIC_1993_EMNV_v01_M_v01_A_SEDLAC"
    local nic_1998_sedlac_name     NIC_1998_EMNV_v01_M_v01_A_SEDLAC
    local nic_1998_sedlac_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 1998 - SEDLAC - Base de Datos Armonizada"
    local nic_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/NIC_1998_EMNV_v01_M_v01_A_SEDLAC"
    local nic_2001_sedlac_name     NIC_2001_EMNV_v01_M_v01_A_SEDLAC
    local nic_2001_sedlac_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 2001 - SEDLAC - Base de Datos Armonizada"
    local nic_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/NIC_2001_EMNV_v01_M_v01_A_SEDLAC"
    local nic_2005_sedlac_name     NIC_2005_EMNV_v01_M_v01_A_SEDLAC
    local nic_2005_sedlac_title    "Encuesta Nacional de Hogares sobre Medición de Niveles de Vida 2005 - SEDLAC - Base de Datos Armonizada"
    local nic_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/NIC_2005_EMNV_v01_M_v01_A_SEDLAC"
    local pan_1989_sedlac_name     PAN_1989_EMO_v01_M_v01_A_SEDLAC
    local pan_1989_sedlac_title    "Encuesta de Hogares 1989 - SEDLAC - Base de Datos Armonizada, Mano de Obra"
    local pan_1989_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1989_EMO_v01_M_v01_A_SEDLAC"
    local pan_1991_sedlac_name     PAN_1991_EMO_v01_M_v01_A_SEDLAC
    local pan_1991_sedlac_title    "Encuesta de Hogares 1991 - SEDLAC - Base de Datos Armonizada, Mano de Obra"
    local pan_1991_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1991_EMO_v01_M_v01_A_SEDLAC"
    local pan_1995_sedlac_name     PAN_1995_EH_v01_M_v01_A_SEDLAC
    local pan_1995_sedlac_title    "Encuesta de Hogares 1995 - SEDLAC - Base de Datos Armonizada"
    local pan_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1995_EH_v01_M_v01_A_SEDLAC"
    local pan_1997_sedlac_name     PAN_1997_EH_v01_M_v01_A_SEDLAC
    local pan_1997_sedlac_title    "Encuesta de Hogares 1997 - SEDLAC - Base de Datos Armonizada"
    local pan_1997_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1997_EH_v01_M_v01_A_SEDLAC"
    local pan_1998_sedlac_name     PAN_1998_EH_v01_M_v01_A_SEDLAC
    local pan_1998_sedlac_title    "Encuesta de Hogares 1998 - SEDLAC - Base de Datos Armonizada"
    local pan_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1998_EH_v01_M_v01_A_SEDLAC"
    local pan_1999_sedlac_name     PAN_1999_EH_v01_M_v01_A_SEDLAC
    local pan_1999_sedlac_title    "Encuesta de Hogares 1999 - SEDLAC - Base de Datos Armonizada"
    local pan_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_1999_EH_v01_M_v01_A_SEDLAC"
    local pan_2000_sedlac_name     PAN_2000_EH_v01_M_v01_A_SEDLAC
    local pan_2000_sedlac_title    "Encuesta de Hogares 2000 - SEDLAC - Base de Datos Armonizada"
    local pan_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2000_EH_v01_M_v01_A_SEDLAC"
    local pan_2001_sedlac_name     PAN_2001_EH_v01_M_v01_A_SEDLAC
    local pan_2001_sedlac_title    "Encuesta de Hogares 2001 - SEDLAC - Base de Datos Armonizada"
    local pan_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2001_EH_v01_M_v01_A_SEDLAC"
    local pan_2002_sedlac_name     PAN_2002_EH_v01_M_v01_A_SEDLAC
    local pan_2002_sedlac_title    "Encuesta de Hogares 2002 - SEDLAC - Base de Datos Armonizada"
    local pan_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2002_EH_v01_M_v01_A_SEDLAC"
    local pan_2003_sedlac_name     PAN_2003_EH_v01_M_v01_A_SEDLAC
    local pan_2003_sedlac_title    "Encuesta de Hogares 2003 - SEDLAC - Base de Datos Armonizada"
    local pan_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2003_EH_v01_M_v01_A_SEDLAC"
    local pan_2003_sedlac_name     PAN_2003_ENV_v01_M_v01_A_SEDLAC
    local pan_2003_sedlac_title    "Encuesta de Niveles de Vida 2003 - SEDLAC - Base de Datos Armonizada"
    local pan_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2003_ENV_v01_M_v01_A_SEDLAC"
    local pan_2004_sedlac_name     PAN_2004_EH_v01_M_v01_A_SEDLAC
    local pan_2004_sedlac_title    "Encuesta de Hogares 2004 - SEDLAC - Base de Datos Armonizada"
    local pan_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2004_EH_v01_M_v01_A_SEDLAC"
    local pan_2005_sedlac_name     PAN_2005_EH_v01_M_v01_A_SEDLAC
    local pan_2005_sedlac_title    "Encuesta de Hogares 2005 - SEDLAC - Base de Datos Armonizada"
    local pan_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2005_EH_v01_M_v01_A_SEDLAC"
    local pan_2006_sedlac_name     PAN_2006_EH_v01_M_v01_A_SEDLAC
    local pan_2006_sedlac_title    "Encuesta de Hogares 2006 - SEDLAC - Base de Datos Armonizada"
    local pan_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2006_EH_v01_M_v01_A_SEDLAC"
    local pan_2008_sedlac_name     PAN_2008_ENV_v01_M_v01_A_SEDLAC
    local pan_2008_sedlac_title    "Encuesta de Niveles de Vida 2008 - SEDLAC - Base de Datos Armonizada"
    local pan_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2008_ENV_v01_M_v01_A_SEDLAC"
    local pan_2009_sedlac_name     PAN_2009_EH_v01_M_v01_A_SEDLAC
    local pan_2009_sedlac_title    "Encuesta de Hogares 2009 - SEDLAC - Base de Datos Armonizada"
    local pan_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PAN_2009_EH_v01_M_v01_A_SEDLAC"
    local per_1997_sedlac_name     PER_1997_ENAHO_v01_M_v01_A_SEDLAC
    local per_1997_sedlac_title    "Encuesta Nacional de Hogares 1997 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_1997_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_1997_ENAHO_v01_M_v01_A_SEDLAC"
    local per_1998_sedlac_name     PER_1998_ENAHO_v01_M_v01_A_SEDLAC
    local per_1998_sedlac_title    "Encuesta Nacional de Hogares 1998 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_1998_ENAHO_v01_M_v01_A_SEDLAC"
    local per_1999_sedlac_name     PER_1999_ENAHO_v01_M_v01_A_SEDLAC
    local per_1999_sedlac_title    "Encuesta Nacional de Hogares 1999 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_1999_ENAHO_v01_M_v01_A_SEDLAC"
    local per_2000_sedlac_name     PER_2000_ENAHO_v01_M_v01_A_SEDLAC
    local per_2000_sedlac_title    "Encuesta Nacional de Hogares 2000 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2000_ENAHO_v01_M_v01_A_SEDLAC"
    local per_2002_sedlac_name     PER_2002_ENAHO_v01_M_v01_A_SEDLAC
    local per_2002_sedlac_title    "Encuesta Nacional de Hogares 2002 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2002_ENAHO_v01_M_v01_A_SEDLAC"
    local per_2003_sedlac_name     PER_2003_ENAHO_v01_M_v01_A_SEDLAC
    local per_2003_sedlac_title    "Encuesta Nacional de Hogares 2003 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2003_ENAHO_v01_M_v01_A_SEDLAC"
    local per_2004_sedlac_name     PER_2004_ENAHO_v01_M_v01_A_SEDLAC
    local per_2004_sedlac_title    "Encuesta Nacional de Hogares 2004 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2004_ENAHO_v01_M_v01_A_SEDLAC"
    local per_2005_sedlac_name     PER_2005_ENAHO_v01_M_v01_A_SEDLAC
    local per_2005_sedlac_title    "Encuesta Nacional de Hogares 2005 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2005_ENAHO_v01_M_v01_A_SEDLAC"
    local per_2006_sedlac_name     PER_2006_ENAHO_v01_M_v01_A_SEDLAC
    local per_2006_sedlac_title    "Encuesta Nacional de Hogares 2006 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2006_ENAHO_v01_M_v01_A_SEDLAC"
    local per_2007_sedlac_name     PER_2007_ENAHO_v01_M_v01_A_SEDLAC
    local per_2007_sedlac_title    "Encuesta Nacional de Hogares 2007 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2007_ENAHO_v01_M_v01_A_SEDLAC"
    local per_2008_sedlac_name     PER_2008_ENAHO_v01_M_v01_A_SEDLAC
    local per_2008_sedlac_title    "Encuesta Nacional de Hogares 2008 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2008_ENAHO_v01_M_v01_A_SEDLAC"
    local per_2009_sedlac_name     PER_2009_ENAHO_v01_M_v01_A_SEDLAC
    local per_2009_sedlac_title    "Encuesta Nacional de Hogares 2009 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2009_ENAHO_v01_M_v01_A_SEDLAC"
    local pry_1990_sedlac_name     PRY_1990_EPH_v01_M_v01_A_SEDLAC
    local pry_1990_sedlac_title    "Encuesta Permanente de Hogares 1990 - SEDLAC - Base de Datos Armonizada"
    local pry_1990_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_1990_EPH_v01_M_v01_A_SEDLAC"
    local pry_1995_sedlac_name     PRY_1995_EPH_v01_M_v01_A_SEDLAC
    local pry_1995_sedlac_title    "Encuesta Permanente de Hogares 1995 - SEDLAC - Base de Datos Armonizada"
    local pry_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_1995_EPH_v01_M_v01_A_SEDLAC"
    local pry_1997_sedlac_name     PRY_1997_EPH_v01_M_v01_A_SEDLAC
    local pry_1997_sedlac_title    "Encuesta Permanente de Hogares 1997 - SEDLAC - Base de Datos Armonizada"
    local pry_1997_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_1997_EPH_v01_M_v01_A_SEDLAC"
    local pry_1999_sedlac_name     PRY_1999_EPH_v01_M_v01_A_SEDLAC
    local pry_1999_sedlac_title    "Encuesta Permanente de Hogares 1999 - SEDLAC - Base de Datos Armonizada"
    local pry_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_1999_EPH_v01_M_v01_A_SEDLAC"
    local pry_2001_sedlac_name     PRY_2001_EPH_v01_M_v01_A_SEDLAC
    local pry_2001_sedlac_title    "Encuesta Permanente de Hogares 2001 - SEDLAC - Base de Datos Armonizada"
    local pry_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2001_EPH_v01_M_v01_A_SEDLAC"
    local pry_2002_sedlac_name     PRY_2002_EPH_v01_M_v01_A_SEDLAC
    local pry_2002_sedlac_title    "Encuesta Permanente de Hogares 2002 - SEDLAC - Base de Datos Armonizada"
    local pry_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2002_EPH_v01_M_v01_A_SEDLAC"
    local pry_2003_sedlac_name     PRY_2003_EPH_v01_M_v01_A_SEDLAC
    local pry_2003_sedlac_title    "Encuesta Permanente de Hogares 2003 - SEDLAC - Base de Datos Armonizada"
    local pry_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2003_EPH_v01_M_v01_A_SEDLAC"
    local pry_2004_sedlac_name     PRY_2004_EPH_v01_M_v01_A_SEDLAC
    local pry_2004_sedlac_title    "Encuesta Permanente de Hogares 2004 - SEDLAC - Base de Datos Armonizada"
    local pry_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2004_EPH_v01_M_v01_A_SEDLAC"
    local pry_2005_sedlac_name     PRY_2005_EPH_v01_M_v01_A_SEDLAC
    local pry_2005_sedlac_title    "Encuesta Permanente de Hogares 2005 - SEDLAC - Base de Datos Armonizada"
    local pry_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2005_EPH_v01_M_v01_A_SEDLAC"
    local pry_2006_sedlac_name     PRY_2006_EPH_v01_M_v01_A_SEDLAC
    local pry_2006_sedlac_title    "Encuesta Permanente de Hogares 2006 - SEDLAC - Base de Datos Armonizada"
    local pry_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2006_EPH_v01_M_v01_A_SEDLAC"
    local pry_2007_sedlac_name     PRY_2007_EPH_v01_M_v01_A_SEDLAC
    local pry_2007_sedlac_title    "Encuesta Permanente de Hogares 2007 - SEDLAC - Base de Datos Armonizada"
    local pry_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2007_EPH_v01_M_v01_A_SEDLAC"
    local pry_2008_sedlac_name     PRY_2008_EPH_v01_M_v01_A_SEDLAC
    local pry_2008_sedlac_title    "Encuesta Permanente de Hogares 2008 - SEDLAC - Base de Datos Armonizada"
    local pry_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2008_EPH_v01_M_v01_A_SEDLAC"
    local pry_2009_sedlac_name     PRY_2009_EPH_v01_M_v01_A_SEDLAC
    local pry_2009_sedlac_title    "Encuesta Permanente de Hogares 2009 - SEDLAC - Base de Datos Armonizada"
    local pry_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2009_EPH_v01_M_v01_A_SEDLAC"
    local slv_1991_sedlac_name     SLV_1991_EHPM_v01_M_v01_A_SEDLAC
    local slv_1991_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1991 - SEDLAC - Base de Datos Armonizada"
    local slv_1991_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_1991_EHPM_v01_M_v01_A_SEDLAC"
    local slv_1995_sedlac_name     SLV_1995_EHPM_v01_M_v01_A_SEDLAC
    local slv_1995_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1995 - SEDLAC - Base de Datos Armonizada"
    local slv_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_1995_EHPM_v01_M_v01_A_SEDLAC"
    local slv_1996_sedlac_name     SLV_1996_EHPM_v01_M_v01_A_SEDLAC
    local slv_1996_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1996 - SEDLAC - Base de Datos Armonizada"
    local slv_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_1996_EHPM_v01_M_v01_A_SEDLAC"
    local slv_1998_sedlac_name     SLV_1998_EHPM_v01_M_v01_A_SEDLAC
    local slv_1998_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1998 - SEDLAC - Base de Datos Armonizada"
    local slv_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_1998_EHPM_v01_M_v01_A_SEDLAC"
    local slv_1999_sedlac_name     SLV_1999_EHPM_v01_M_v01_A_SEDLAC
    local slv_1999_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 1999 - SEDLAC - Base de Datos Armonizada"
    local slv_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_1999_EHPM_v01_M_v01_A_SEDLAC"
    local slv_2000_sedlac_name     SLV_2000_EHPM_v01_M_v01_A_SEDLAC
    local slv_2000_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2000 - SEDLAC - Base de Datos Armonizada"
    local slv_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_2000_EHPM_v01_M_v01_A_SEDLAC"
    local slv_2001_sedlac_name     SLV_2001_EHPM_v01_M_v01_A_SEDLAC
    local slv_2001_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2001 - SEDLAC - Base de Datos Armonizada"
    local slv_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_2001_EHPM_v01_M_v01_A_SEDLAC"
    local slv_2002_sedlac_name     SLV_2002_EHPM_v01_M_v01_A_SEDLAC
    local slv_2002_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2002 - SEDLAC - Base de Datos Armonizada"
    local slv_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_2002_EHPM_v01_M_v01_A_SEDLAC"
    local slv_2003_sedlac_name     SLV_2003_EHPM_v01_M_v01_A_SEDLAC
    local slv_2003_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2003 - SEDLAC - Base de Datos Armonizada"
    local slv_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_2003_EHPM_v01_M_v01_A_SEDLAC"
    local slv_2004_sedlac_name     SLV_2004_EHPM_v01_M_v01_A_SEDLAC
    local slv_2004_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2004 - SEDLAC - Base de Datos Armonizada"
    local slv_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_2004_EHPM_v01_M_v01_A_SEDLAC"
    local slv_2005_sedlac_name     SLV_2005_EHPM_v01_M_v01_A_SEDLAC
    local slv_2005_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2005 - SEDLAC - Base de Datos Armonizada"
    local slv_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_2005_EHPM_v01_M_v01_A_SEDLAC"
    local slv_2006_sedlac_name     SLV_2006_EHPM_v01_M_v01_A_SEDLAC
    local slv_2006_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2006 - SEDLAC - Base de Datos Armonizada"
    local slv_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_2006_EHPM_v01_M_v01_A_SEDLAC"
    local slv_2007_sedlac_name     SLV_2007_EHPM_v01_M_v01_A_SEDLAC
    local slv_2007_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2007 - SEDLAC - Base de Datos Armonizada"
    local slv_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_2007_EHPM_v01_M_v01_A_SEDLAC"
    local slv_2008_sedlac_name     SLV_2008_EHPM_v01_M_v01_A_SEDLAC
    local slv_2008_sedlac_title    "Encuesta de Hogares de Propósitos Múltiples 2008 - SEDLAC - Base de Datos Armonizada"
    local slv_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_2008_EHPM_v01_M_v01_A_SEDLAC"
    local sur_1999_sedlac_name     SUR_1999_EHS_v01_M_v01_A_SEDLAC
    local sur_1999_sedlac_title    "Expenditure Household Survey 1999 - SEDLAC - Base de Datos Armonizada"
    local sur_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SUR_1999_EHS_v01_M_v01_A_SEDLAC"
    local ury_1989_sedlac_name     URY_1989_ECH_v01_M_v01_A_SEDLAC
    local ury_1989_sedlac_title    "Encuesta Continua de Hogares 1989 - SEDLAC - Base de Datos Armonizada"
    local ury_1989_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_1989_ECH_v01_M_v01_A_SEDLAC"
    local ury_1992_sedlac_name     URY_1992_ECH_v01_M_v01_A_SEDLAC
    local ury_1992_sedlac_title    "Encuesta Continua de Hogares 1992 - SEDLAC - Base de Datos Armonizada"
    local ury_1992_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_1992_ECH_v01_M_v01_A_SEDLAC"
    local ury_1995_sedlac_name     URY_1995_ECH_v01_M_v01_A_SEDLAC
    local ury_1995_sedlac_title    "Encuesta Continua de Hogares 1995 - SEDLAC - Base de Datos Armonizada"
    local ury_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_1995_ECH_v01_M_v01_A_SEDLAC"
    local ury_1996_sedlac_name     URY_1996_ECH_v01_M_v01_A_SEDLAC
    local ury_1996_sedlac_title    "Encuesta Continua de Hogares 1996 - SEDLAC - Base de Datos Armonizada"
    local ury_1996_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_1996_ECH_v01_M_v01_A_SEDLAC"
    local ury_1997_sedlac_name     URY_1997_ECH_v01_M_v01_A_SEDLAC
    local ury_1997_sedlac_title    "Encuesta Continua de Hogares 1997 - SEDLAC - Base de Datos Armonizada"
    local ury_1997_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_1997_ECH_v01_M_v01_A_SEDLAC"
    local ury_1998_sedlac_name     URY_1998_ECH_v01_M_v01_A_SEDLAC
    local ury_1998_sedlac_title    "Encuesta Continua de Hogares 1998 - SEDLAC - Base de Datos Armonizada"
    local ury_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_1998_ECH_v01_M_v01_A_SEDLAC"
    local ury_2000_sedlac_name     URY_2000_ECH_v01_M_v01_A_SEDLAC
    local ury_2000_sedlac_title    "Encuesta Continua de Hogares 2000 - SEDLAC - Base de Datos Armonizada"
    local ury_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_2000_ECH_v01_M_v01_A_SEDLAC"
    local ury_2001_sedlac_name     URY_2001_ECH_v01_M_v01_A_SEDLAC
    local ury_2001_sedlac_title    "Encuesta Continua de Hogares 2001 - SEDLAC - Base de Datos Armonizada"
    local ury_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_2001_ECH_v01_M_v01_A_SEDLAC"
    local ury_2002_sedlac_name     URY_2002_ECH_v01_M_v01_A_SEDLAC
    local ury_2002_sedlac_title    "Encuesta Continua de Hogares 2002 - SEDLAC - Base de Datos Armonizada"
    local ury_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_2002_ECH_v01_M_v01_A_SEDLAC"
    local ury_2003_sedlac_name     URY_2003_ECH_v01_M_v01_A_SEDLAC
    local ury_2003_sedlac_title    "Encuesta Continua de Hogares 2003 - SEDLAC - Base de Datos Armonizada"
    local ury_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_2003_ECH_v01_M_v01_A_SEDLAC"
    local ury_2004_sedlac_name     URY_2004_ECH_v01_M_v01_A_SEDLAC
    local ury_2004_sedlac_title    "Encuesta Continua de Hogares 2004 - SEDLAC - Base de Datos Armonizada"
    local ury_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_2004_ECH_v01_M_v01_A_SEDLAC"
    local ury_2005_sedlac_name     URY_2005_ECH_v01_M_v01_A_SEDLAC
    local ury_2005_sedlac_title    "Encuesta Continua de Hogares 2005 - SEDLAC - Base de Datos Armonizada"
    local ury_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_2005_ECH_v01_M_v01_A_SEDLAC"
    local ury_2006_sedlac_name     URY_2006_ECH_v01_M_v01_A_SEDLAC
    local ury_2006_sedlac_title    "Encuesta Continua de Hogares 2006 - SEDLAC - Base de Datos Armonizada"
    local ury_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_2006_ECH_v01_M_v01_A_SEDLAC"
    local ury_2007_sedlac_name     URY_2007_ECH_v01_M_v01_A_SEDLAC
    local ury_2007_sedlac_title    "Encuesta Continua de Hogares 2007 - SEDLAC - Base de Datos Armonizada"
    local ury_2007_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_2007_ECH_v01_M_v01_A_SEDLAC"
    local ury_2008_sedlac_name     URY_2008_ECH_v01_M_v01_A_SEDLAC
    local ury_2008_sedlac_title    "Encuesta Continua de Hogares 2008 - SEDLAC - Base de Datos Armonizada"
    local ury_2008_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_2008_ECH_v01_M_v01_A_SEDLAC"
    local ury_2009_sedlac_name     URY_2009_ECH_v01_M_v01_A_SEDLAC
    local ury_2009_sedlac_title    "Encuesta Continua de Hogares 2009 - SEDLAC - Base de Datos Armonizada"
    local ury_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/URY_2009_ECH_v01_M_v01_A_SEDLAC"
    local ven_1989_sedlac_name     VEN_1989_EHM_v01_M_v01_A_SEDLAC
    local ven_1989_sedlac_title    "Encuesta de Hogares por Muestreo 1989 - SEDLAC - Base de Datos Armonizada"
    local ven_1989_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_1989_EHM_v01_M_v01_A_SEDLAC"
    local ven_1992_sedlac_name     VEN_1992_EHM_v01_M_v01_A_SEDLAC
    local ven_1992_sedlac_title    "Encuesta de Hogares por Muestreo 1992 - SEDLAC - Base de Datos Armonizada"
    local ven_1992_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_1992_EHM_v01_M_v01_A_SEDLAC"
    local ven_1995_sedlac_name     VEN_1995_EHM_v01_M_v01_A_SEDLAC
    local ven_1995_sedlac_title    "Encuesta de Hogares por Muestreo 1995 - SEDLAC - Base de Datos Armonizada"
    local ven_1995_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_1995_EHM_v01_M_v01_A_SEDLAC"
    local ven_1998_sedlac_name     VEN_1998_EHM_v01_M_v01_A_SEDLAC
    local ven_1998_sedlac_title    "Encuesta de Hogares por Muestreo 1998 - SEDLAC - Base de Datos Armonizada"
    local ven_1998_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_1998_EHM_v01_M_v01_A_SEDLAC"
    local ven_1999_sedlac_name     VEN_1999_EHM_v01_M_v01_A_SEDLAC
    local ven_1999_sedlac_title    "Encuesta de Hogares por Muestreo 1999 - SEDLAC - Base de Datos Armonizada"
    local ven_1999_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_1999_EHM_v01_M_v01_A_SEDLAC"
    local ven_2000_sedlac_name     VEN_2000_EHM_v01_M_v01_A_SEDLAC
    local ven_2000_sedlac_title    "Encuesta de Hogares por Muestreo 2000 - SEDLAC - Base de Datos Armonizada"
    local ven_2000_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_2000_EHM_v01_M_v01_A_SEDLAC"
    local ven_2001_sedlac_name     VEN_2001_EHM_v01_M_v01_A_SEDLAC
    local ven_2001_sedlac_title    "Encuesta de Hogares por Muestreo 2001 - SEDLAC - Base de Datos Armonizada"
    local ven_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_2001_EHM_v01_M_v01_A_SEDLAC"
    local ven_2002_sedlac_name     VEN_2002_EHM_v01_M_v01_A_SEDLAC
    local ven_2002_sedlac_title    "Encuesta de Hogares por Muestreo 2002 - SEDLAC - Base de Datos Armonizada"
    local ven_2002_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_2002_EHM_v01_M_v01_A_SEDLAC"
    local ven_2003_sedlac_name     VEN_2003_EHM_v01_M_v01_A_SEDLAC
    local ven_2003_sedlac_title    "Encuesta de Hogares por Muestreo 2003 - SEDLAC - Base de Datos Armonizada"
    local ven_2003_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_2003_EHM_v01_M_v01_A_SEDLAC"
    local ven_2004_sedlac_name     VEN_2004_EHM_v01_M_v01_A_SEDLAC
    local ven_2004_sedlac_title    "Encuesta de Hogares por Muestreo 2004 - SEDLAC - Base de Datos Armonizada"
    local ven_2004_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_2004_EHM_v01_M_v01_A_SEDLAC"
    local ven_2005_sedlac_name     VEN_2005_EHM_v01_M_v01_A_SEDLAC
    local ven_2005_sedlac_title    "Encuesta de Hogares por Muestreo 2005 - SEDLAC - Base de Datos Armonizada"
    local ven_2005_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_2005_EHM_v01_M_v01_A_SEDLAC"
    local ven_2006_sedlac_name     VEN_2006_EHM_v01_M_v01_A_SEDLAC
    local ven_2006_sedlac_title    "Encuesta de Hogares por Muestreo 2006 - SEDLAC - Base de Datos Armonizada"
    local ven_2006_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_2006_EHM_v01_M_v01_A_SEDLAC"
    local bra_2009_sedlac_name     BRA_2009_PNAD_v01_M_v01_A_SEDLAC
    local bra_2009_sedlac_title    "Pesquisa Nacional por Amostra de Domicílios 2009 - SEDLAC - Base de Datos Armonizada"
    local bra_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRA_2009_PNAD_v01_M_v01_A_SEDLAC"
    local chl_1990_sedlac_name     CHL_1990_CASEN_v01_M_v01_A_SEDLAC
    local chl_1990_sedlac_title    "Encuesta de Caracterización Socioeconómica Nacional 1990 - SEDLAC - Base de Datos Armonizada"
    local chl_1990_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CHL_1990_CASEN_v01_M_v01_A_SEDLAC"
    local col_2009_sedlac_name     COL_2009_GEIH_v01_M_v01_A_SEDLAC
    local col_2009_sedlac_title    "Gran Encuesta Integrada de Hogares 2009 - SEDLAC - Base de Datos Armonizada"
    local col_2009_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_2009_GEIH_v01_M_v01_A_SEDLAC"
    local per_2001_sedlac_name     PER_2001_ENAHO_v01_M_v01_A_SEDLAC
    local per_2001_sedlac_title    "Encuesta Nacional de Hogares 2001 - SEDLAC - Base de Datos Armonizada, Condiciones de Vida y Pobreza"
    local per_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2001_ENAHO_v01_M_v01_A_SEDLAC"
    local dom_2001_sedlac_name     DOM_2001_ENFT_v01_M_v01_A_SEDLAC
    local dom_2001_sedlac_title    "Encusta Nacional de Fuerza de Trabajo 2001 - SEDLAC - Base de Datos Armonizada"
    local dom_2001_sedlac_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2001_ENFT_v01_M_v01_A_SEDLAC"
    local tto_2010_wb_name     TTO_2010_ES_v01_M_WB
    local tto_2010_wb_title    "Enterprise Survey 2010"
    local tto_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/TTO_2010_ES_v01_M_WB"
    local pry_2010_wb_name     PRY_2010_ES_v01_M_WB
    local pry_2010_wb_title    "Enterprise Survey 2010"
    local pry_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2010_ES_v01_M_WB"
    local sur_2010_wb_name     SUR_2010_ES_v01_M_WB
    local sur_2010_wb_title    "Enterprise Survey 2010"
    local sur_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SUR_2010_ES_v01_M_WB"
    local lca_2010_wb_name     LCA_2010_ES_v01_M_WB
    local lca_2010_wb_title    "Enterprise Survey 2010"
    local lca_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/LCA_2010_ES_v01_M_WB"
    local dma_2010_wb_name     DMA_2010_ES_v01_M_WB
    local dma_2010_wb_title    "Enterprise Survey 2010"
    local dma_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DMA_2010_ES_v01_M_WB"
    local blz_2010_wb_name     BLZ_2010_ES_v01_M_WB
    local blz_2010_wb_title    "Enterprise Survey 2010"
    local blz_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_2010_ES_v01_M_WB"
    local atg_2010_wb_name     ATG_2010_ES_v01_M_WB
    local atg_2010_wb_title    "Enterprise Survey 2010"
    local atg_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ATG_2010_ES_v01_M_WB"
    local ven_2010_wb_name     VEN_2010_ES_v01_M_WB
    local ven_2010_wb_title    "Enterprise Survey 2010"
    local ven_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VEN_2010_ES_v01_M_WB"
    local vct_2010_wb_name     VCT_2010_ES_v01_M_WB
    local vct_2010_wb_title    "Enterprise Survey 2010"
    local vct_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/VCT_2010_ES_v01_M_WB"
    local slv_2010_wb_name     SLV_2010_ES_v01_M_WB
    local slv_2010_wb_title    "Enterprise Survey 2010"
    local slv_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_2010_ES_v01_M_WB"
    local nic_2010_wb_name     NIC_2010_ES_v01_M_WB
    local nic_2010_wb_title    "Enterprise Survey 2010"
    local nic_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/NIC_2010_ES_v01_M_WB"
    local mex_2010_wb_name     MEX_2010_ES_v01_M_WB
    local mex_2010_wb_title    "Enterprise Survey 2010"
    local mex_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/MEX_2010_ES_v01_M_WB"
    local kna_2010_wb_name     KNA_2010_ES_v01_M_WB
    local kna_2010_wb_title    "Enterprise Survey 2010"
    local kna_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/KNA_2010_ES_v01_M_WB"
    local hnd_2010_wb_name     HND_2010_ES_v01_M_WB
    local hnd_2010_wb_title    "Enterprise Survey 2010"
    local hnd_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2010_ES_v01_M_WB"
    local guy_2010_wb_name     GUY_2010_ES_v01_M_WB
    local guy_2010_wb_title    "Enterprise Survey 2010"
    local guy_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GUY_2010_ES_v01_M_WB"
    local dom_2010_wb_name     DOM_2010_ES_v01_M_WB
    local dom_2010_wb_title    "Enterprise Survey 2010"
    local dom_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/DOM_2010_ES_v01_M_WB"
    local brb_2010_wb_name     BRB_2010_ES_v01_M_WB
    local brb_2010_wb_title    "Enterprise Survey 2010"
    local brb_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BRB_2010_ES_v01_M_WB"
    local bhs_2010_wb_name     BHS_2010_ES_v01_M_WB
    local bhs_2010_wb_title    "Enterprise Survey 2010"
    local bhs_2010_wb_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BHS_2010_ES_v01_M_WB"
    local gtm_2008_m_name     GTM_2008_ENSMI_v01_M
    local gtm_2008_m_title    "Encuesta Nacional de Salud Materno Infantil 2008-2009"
    local gtm_2008_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/GTM_2008_ENSMI_v01_M"
    local nic_2006_m_name     NIC_2006_ENDESA_v01_M
    local nic_2006_m_title    "Encuesta Nicaragüense de Demografía y Salud 2006-2007"
    local nic_2006_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/NIC_2006_ENDESA_v01_M"
    local nic_1992_m_name     NIC_1992_ESF_v01_M
    local nic_1992_m_title    "Encuesta sobre Salud Familiar 1992-1993"
    local nic_1992_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/NIC_1992_ESF_v01_M"
    local pry_2008_m_name     PRY_2008_ENDSSR_v01_M
    local pry_2008_m_title    "Encuesta Nacional de Demografía y Salud Sexual y Reproductiva 2008"
    local pry_2008_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2008_ENDSSR_v01_M"
    local slv_2008_m_name     SLV_2008_FESAL_v01_M
    local slv_2008_m_title    "Encuesta Nacional de Salud Familiar 2008"
    local slv_2008_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_2008_FESAL_v01_M"
    local slv_1998_m_name     SLV_1998_FESAL_v01_M
    local slv_1998_m_title    "Encuesta Nacional de Salud Familiar 1998"
    local slv_1998_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_1998_FESAL_v01_M"
    local slv_1993_m_name     SLV_1993_FESAL_v01_M
    local slv_1993_m_title    "Encuesta Nacional de Salud Familiar 1993"
    local slv_1993_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/SLV_1993_FESAL_v01_M"
    local ecu_2004_m_name     ECU_2004_ENDEMAIN_v01_M
    local ecu_2004_m_title    "Encuesta Demográfica y de Salud Materna e Infantil 2004"
    local ecu_2004_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_2004_ENDEMAIN_v01_M"
    local ecu_1999_m_name     ECU_1999_ENDEMAIN_v01_M
    local ecu_1999_m_title    "Encuesta Demográfica y de Salud Materna e Infantil 1999"
    local ecu_1999_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1999_ENDEMAIN_v01_M"
    local ecu_1994_m_name     ECU_1994_ENDEMAIN_v01_M
    local ecu_1994_m_title    "Encuesta de Salud Materna e Infantil 1994"
    local ecu_1994_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1994_ENDEMAIN_v01_M"
    local ecu_1989_m_name     ECU_1989_ENDEMAIN_v01_M
    local ecu_1989_m_title    "Encuesta Demográfica y de Salud Materna e Infantil 1989"
    local ecu_1989_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/ECU_1989_ENDEMAIN_v01_M"
    local blz_1991_m_name     BLZ_1991_FHS_v01_M
    local blz_1991_m_title    "Belize Family Health Survey 1991"
    local blz_1991_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_1991_FHS_v01_M"
    local cri_1992_m_name     CRI_1992_ENSR_v01_M
    local cri_1992_m_title    "Encuesta Nacional de Salud Reproductiva 1992-1993"
    local cri_1992_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/CRI_1992_ENSR_v01_M"
    local blz_1999_m_name     BLZ_1999_FHS_v01_M
    local blz_1999_m_title    "Family Health Survey 1999"
    local blz_1999_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BLZ_1999_FHS_v01_M"
    local hai_1989_m_name     HAI_1989_NCPS_v01_M
    local hai_1989_m_title    "Contraceptive Prevalence Survey 1989"
    local hai_1989_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HAI_1989_NCPS_v01_M"
    local hnd_1987_m_name     HND_1987_EFHS_v01_M
    local hnd_1987_m_title    "Epidemiology and Family Health Survey 1987"
    local hnd_1987_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1987_EFHS_v01_M"
    local hnd_1991_m_name     HND_1991_ENESF_v01_M
    local hnd_1991_m_title    "Encuesta Nacional de Epidemiología y Salud Familiar 1991-1992"
    local hnd_1991_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1991_ENESF_v01_M"
    local hnd_1996_m_name     HND_1996_ENESF_v01_M
    local hnd_1996_m_title    "Encuesta Nacional de Epidemiología y Salud Familiar 1996"
    local hnd_1996_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1996_ENESF_v01_M"
    local hnd_1996_m_name     HND_1996_ENSM_v01_M
    local hnd_1996_m_title    "Encuesta Nacional de Salud Masculina 1996"
    local hnd_1996_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_1996_ENSM_v01_M"
    local hnd_2001_m_name     HND_2001_ENESF-ENSM_v01_M
    local hnd_2001_m_title    "Encuesta Nacional de Epidemiologia y Salud Familiar / Encuesta Nacional de Salud Masculina 2001"
    local hnd_2001_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/HND_2001_ENESF-ENSM_v01_M"
    local jam_1993_m_name     JAM_1993_CPS_v01_M
    local jam_1993_m_title    "Contraceptive Prevalence Survey 1993"
    local jam_1993_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1993_CPS_v01_M"
    local jam_1997_m_name     JAM_1997_RHS_v01_M
    local jam_1997_m_title    "Reproductive Health Survey 1997"
    local jam_1997_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_1997_RHS_v01_M"
    local pry_2004_m_name     PRY_2004_ENDSSR_v01_M
    local pry_2004_m_title    "Encuesta Nacional de Demografía y Salud Sexual y Reproductiva 2004"
    local pry_2004_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_2004_ENDSSR_v01_M"
    local pry_1998_m_name     PRY_1998_ENSMI_v01_M
    local pry_1998_m_title    "Encuesta Nacional de Salud Materno infantil 1998"
    local pry_1998_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_1998_ENSMI_v01_M"
    local jam_2008_m_name     JAM_2008_RHS_v01_M
    local jam_2008_m_title    "Reproductive Health Survey 2008-2009"
    local jam_2008_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_2008_RHS_v01_M"
    local pry_1987_m_name     PRY_1987_EPF_v01_M
    local pry_1987_m_title    "Encuesta de Planificación Familiar 1987"
    local pry_1987_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PRY_1987_EPF_v01_M"
    local bol_2007_m_name     BOL_2007_EH_v01_M
    local bol_2007_m_title    "Encuesta de Hogares 2007"
    local bol_2007_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/BOL_2007_EH_v01_M"
    local col_2008_m_name     COL_2008_ECV_v01_M
    local col_2008_m_title    "Encuesta de Calidad de Vida 2008"
    local col_2008_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/COL_2008_ECV_v01_M"
    local tto_1992_m_name     TTO_1992_SLC_v01_M
    local tto_1992_m_title    "Survey of Living Conditions 1992"
    local tto_1992_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/TTO_1992_SLC_v01_M"
    local per_2008_m_name     PER_2008_ENAHO_v01_M
    local per_2008_m_title    "Encuesta Nacional de Hogares sobre Condiciones de Vida y Pobreza 2008"
    local per_2008_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/PER_2008_ENAHO_v01_M"
    local jam_2007_m_name     JAM_2007_SLC_v01_M
    local jam_2007_m_title    "Survey of Living Conditions 2007"
    local jam_2007_m_url      "http://microdatalib.worldbank.org/index.php/catalog/study/JAM_2007_SLC_v01_M"

    foreach c in `country' {
        foreach y in `year' {
            foreach s in `survey' {
                if ("``c'_`y'_`s'_name'" != "") {
                    noi di as text "{hline}" _newline
                    noi di as text "{p 4 4 2}{cmd:Name:} " in y "``c'_`y'_`s'_name'" as text " {p_end}"
                    noi di as text "{p 4 4 2}{cmd:Survey Title:} " in y "``c'_`y'_`s'_title'" as text " {p_end}"
                    noi di as text "{p 4 4 2}{cmd:Survey Type:} " in y "`s'" as text " {p_end}"
                    noi di in smcl "{p 4 4 2}{cmd:Link to DDI:}  {browse "_char(34)"``c'_`y'_`s'_url'"_char(34)" : Survey metadata (microdata portal)}" _newline
                    noi di as text "{hline}"
                }
            }
        }
    }

end
