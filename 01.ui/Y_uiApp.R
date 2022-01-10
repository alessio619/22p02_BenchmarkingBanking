

### UI WRAPPER ###     





# : ============================================================================================================================




ui_app <- 
    
# HEADER ================================================================================

  navbarPage(
       
       title = div(img(src = "innovationteam_logo.png"), "", style = "float:left; padding-left:10px"),
       windowTitle = 'Innovation Team Banking Products',
       fluid = TRUE,
       theme = default_th,
       useWaitress(color = '#3EB595'),
       
          
       
    ## Intro Panel -------------------------------------------------------
    
            tabPanel(
                
              title = 'Compare All', 
                     
                fluidRow(
                    
                    column(
                        
                        width = 12,
                        
                        fluidRow(
                          column(4, selectBanca_ui),
                          column(4, simProduct),
                          column(4, selectProduct_ui)
                        ),
                        
                        fluidRow(
                          column(5, align = "center", 
                                 h2('Market Products List'),
                                 reactableOutput('compare_products_table')),
                          column(7, align = "center", 
                                 h2('High-Low 5'),
                                 plotlyOutput('compare_products_plot'))
                        ))
                        
                        )
                )
    
)

