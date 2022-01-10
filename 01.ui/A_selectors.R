


# : =============================================================

## SELECT ---------------------------------------

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
                multiple = TRUE
                )

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

selectProduct_ui <- 
    selectInput(inputId = 'select_product_compare', 
                label = "Select Product", 
                choices = benchmark_cc_items$item_code,
                selected = 'cn_1')








# : =================================================================================








