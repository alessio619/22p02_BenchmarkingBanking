


# : =============================================================

## SELECT ---------------------------------------

### BANK ========================

selectBanca_ui <- 
    selectInput(inputId = 'select_bank_compare', 
                label = "Select Bank", 
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

selectBanca_info <- 
    selectInput(inputId = 'select_bank_info', 
                label = "", 
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



### GROUP ======================

selectGroup_ui <- 
        selectInput(inputId = 'select_group_compare', 
                    label = "Select Group", 
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





### PRODUCT ====================
selectProduct_ui <- 
    selectInput(inputId = 'select_product_compare', 
                label = "Select Product", 
                choices = benchmark_cc_items$item_code,
                selected = 'cn_1')



### FILE =======================

selectAccount_info <-
    selectInput(inputId = 'select_account_info', 
                label = "", 
                choices = c(
                    "1" = '1',
                    "2" = '2',
                    "3" = '3',
                    "4" = "4"),
                multiple = FALSE,
                selected = '1')

selectFile_info <- 
    selectInput(inputId = 'select_file_info', 
                label = "", 
                choices = c(
                    "Conto Corrente" = '1',
                    "Altro 2" = '2',
                    "Carta di Credito" = '3',
                    "Altro 4" = '4'),
                multiple = FALSE,
                selected = '1')





# : =================================================================================








