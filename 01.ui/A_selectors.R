


# : =============================================================

## BANK INFO ========================

selectBanca_info <- 
    selectInput(inputId = 'select_bank_info', 
                label = NULL, 
                choices = c(
                    "Instesa San Paolo" = "isp",
                    "Unicredit" = 'uni',
                    "Credit-Agricole" = 'cag',
                    "BNL" = 'bnl',
                    "BPM" = 'bpm',
                    "Monte dei Paschi di Siena" = 'mps',
                    "UBI" = 'ubi',
                    "BPER" = 'bper',
                    "CREDEM BANCA" = 'cdm'),
                multiple = FALSE,
                selected = 'isp'
    )


selectAccount_info <-
    selectInput(inputId = 'select_account_info', 
                label = NULL, 
                choices = c(
                    "1" = '1',
                    "2" = '2',
                    "3" = '3',
                    "4" = "4"),
                multiple = FALSE,
                selected = '1')


selectFile_info <- 
    selectInput(inputId = 'select_file_info', 
                label = NULL, 
                choices = c(
                    "Conto Corrente" = '1',
                    "Altro 2" = '2',
                    "Carta di Credito" = '3',
                    "Altro 4" = '4'),
                multiple = FALSE,
                selected = '1')





## ISC PROFILES ========================

selectVar_profile <- 
    selectInput(inputId = 'select_var_profile', 
                label = NULL, 
                choices = unique(isc_profiles$voice_type_desc),
                multiple = FALSE,
                selected = 'total')


selectValue_profile <- 
    selectInput(inputId = 'select_value_profile', 
                label = NULL, 
                choices = unique(isc_profiles$var_type),
                multiple = FALSE,
                selected = 'isc')


selectFormat_profile <- 
    selectInput(inputId = 'select_format_profile', 
                label = NULL, 
                choices = unique(isc_profiles$format),
                multiple = FALSE,
                selected = 'online')



## MARKET OVERVIEW ========================

selectBanca_overview <-
    selectInput(inputId = 'select_bank_overview', 
                label = NULL, 
                choices = c(
                    "Instesa San Paolo" = "isp",
                    "Unicredit" = 'uni',
                    "Credit-Agricole" = 'cag',
                    "BNL" = 'bnl',
                    "BPM" = 'bpm',
                    "Monte dei Paschi di Siena" = 'mps',
                    "UBI" = 'ubi',
                    "BPER" = 'bper',
                    "CREDEM BANCA" = 'cdm'),
                multiple = FALSE,
                selected = 'isp'
    )    



## POSITIONING ========================




## GROUP ======================

selectGroup_ui <- 
        selectInput(inputId = 'select_group_compare', 
                    label = NULL, 
            choices = c(
                "canone" = "Canone",
                "servizi_pagamento" = "Servizi Pagamento",
                "home_banking" = "Home Banking",
                "spese_variabili" = "Spese Varaibili",
                "bonifici" = "Bonifici",
                "fid_sportello" = "fid_sportello",
                "fid_online" = "fid_online",
                "sconti" = "Sconti"),
            multiple = FALSE,
            selected = 'canone')





## PRODUCT ====================

selectBanca_ui <- 
    selectInput(inputId = 'select_bank_compare', 
                label = NULL, 
                choices = c(
                    "Instesa San Paolo" = "isp",
                    "Unicredit" = 'uni',
                    "Credit-Agricole" = 'cag',
                    "BNL" = 'bnl',
                    "BPM" = 'bpm',
                    "Monte dei Paschi di Siena" = 'mps',
                    "UBI" = 'ubi',
                    "BPER" = 'bper',
                    "CREDEM BANCA" = 'cdm'),
                multiple = TRUE,
                selected = c('isp', 'uni', 'bper')
                
    )


selectProduct_ui <- 
    selectInput(inputId = 'select_product_compare', 
                label = NULL, 
                choices = benchmark_cc_items$item_code,
                selected = 'cn_1')


simProduct_price <- 
    numericInput(
        inputId = 'simProductPrice',
        label = NULL,
        value = 0,
        min = NA,
        max = NA,
        step = NA,
        width = '92.5%'
    )



## SIMULATION =======================







# : =================================================================================








