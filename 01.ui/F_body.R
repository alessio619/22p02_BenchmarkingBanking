

# Body ----------------------------------------------------------

body_ui <- dashboardBody(
    
    tabItems(
   
    
  ## BANK INFO ===========================================================================================================================================================
                 
        tabItem(tabName = 'banks',
                
                fluidRow(
                 
                    box(width = 4, elevation = 1, icon = shiny::icon("bank"), title = "Select bank", solidHeader = TRUE, status = 'orange',
                        selectBanca_info),
                    box(width = 4, elevation = 1, icon = shiny::icon("user"), title = "Select account", solidHeader = TRUE, status = 'orange',
                        selectAccount_info),
                    box(width = 4, elevation = 1, icon = shiny::icon("file"),  title = "Select file", solidHeader = TRUE, status = 'orange',
                        selectFile_info)
                    
                        ),        

                fluidRow(
                    
                    box(width = 12, elevation = 1, headerBorder = FALSE, title = 'Document Live Viewer:', height = '69vh',
                            
                        uiOutput('fileViewer')

                    )
                )
            ),

  
  
  ## ISC PROFILES =========================================================================================================================================================
  
        tabItem(tabName = 'profiles',
                
                fluidRow(
                
                    column(width = 12, 
                           
                           tabBox(
                             id = 'giovani', width = 12,  elevation = 1, title = "Giovani", height = "350px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Giovani",
                      
                             tabPanel("giovani", "A wonderful serenity has taken possession of my entire soul"),
                             tabPanel("Familia basso", "A wonderful serenity has taken possession of my entire soul")),
                             
                           tabBox(
                             id = 'famiglie_bassa', width = 12,  elevation = 1, title = "Famiglie Bassa", height = "350px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Giovani",
                             
                             tabPanel("Famiglie bassa", "A wonderful serenity has taken possession of my entire soul"),
                             tabPanel("Familia basso", "A wonderful serenity has taken possession of my entire soul")),
                           
                           tabBox(
                             id = 'famiglie_media', width = 12,  elevation = 1, title = "Famiglie Media", height = "350px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Giovani",
                             
                             tabPanel("Giovani", "A wonderful serenity has taken possession of my entire soul"),
                             tabPanel("Familia basso", "A wonderful serenity has taken possession of my entire soul")),   
                           
                           tabBox(
                             id = 'famiglie_alta', width = 12,  elevation = 1, title = "Famiglie Alta", height = "350px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Giovani",
                             
                             tabPanel("Giovani", "A wonderful serenity has taken possession of my entire soul"),
                             tabPanel("Familia basso", "A wonderful serenity has taken possession of my entire soul")),
                           
                           tabBox(
                             id = 'pensionati_bassa', width = 12,  elevation = 1, title = "Pensionati Bassa", height = "350px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Giovani",
                             
                             tabPanel("Giovani", "A wonderful serenity has taken possession of my entire soul"),
                             tabPanel("Familia basso", "A wonderful serenity has taken possession of my entire soul")),
                           
                           tabBox(
                             id = 'pensionati_media', width = 12,  elevation = 1, title = "Pensionati Media", height = "350px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Giovani",
                             
                             tabPanel("Giovani", "A wonderful serenity has taken possession of my entire soul"),
                             tabPanel("Familia basso", "A wonderful serenity has taken possession of my entire soul"))                           
                           
                             
                      
                    
                )
                )   
        ),
        
        fluidRow(
          
          column(width = 12, 
                 
                 box(width = 12,  elevation = 1, title = "MATRICE", collapsible = TRUE, height = "500px", solidHeader = TRUE,  type = "tabs", selected = "Giovani",
                     
                     'prova'
)
                 )
          
          )
  
        ),
  
  ## MARKET OVERVIEW ======================================================================================================================================================
  
        tabItem(tabName = 'overview',
            
            infoBox(width = 12, elevation = 1,
                    
                carousel(
                    
                    id = 'banks_carousel', indicators = TRUE, width = 12,
                    
                    carouselItem(tags$img(src = "isp.png", style='height:100px; align="center";')),
                    carouselItem(tags$img(src = "uni.png", style="height:100px;"))
                ))
                
        ),
  
  
  
  ## POSITIONING SIMULATION ======================================================================================================================================================
  
        tabItem(tabName = 'sim_position',
                
                bs4DashGallery()
                
        ),   
  
  
  
  ## GROUP PRODUCT ======================================================================================================================================================
  
  tabItem(tabName = 'groups',
          
          bs4DashGallery()
          
  ),   
  
  
  
  ## PRODUCT COMPARE ======================================================================================================================================================
  
        tabItem(tabName = 'products',
                
            fluidRow(
    
                box(width = 4, icon = shiny::icon("bank"), title = 'Select Bank', color = 'success', background = 'success', gradient = TRUE, fill = TRUE, height = '8vh',
                    selectBanca_ui),
                box(width = 4, icon = shiny::icon("hand-pointer"), title = 'Select Feature', color = 'success', background = 'success', gradient = TRUE, fill = TRUE, height = '8vh',
                    selectProduct_ui),
                box(width = 4, icon = shiny::icon("run"), title = 'Simulate Feature Price', color = 'maroon', background = 'maroon', gradient = TRUE, fill = TRUE, height = '8vh',
                    div(simProduct_price, style = "display:inline-block"), 
                    div(simProduct, style = "display:inline-block"))
                
              ),
               
            fluidRow(
              
              column(width = 5, 
                
                 box(width = 12, maximizable = TRUE, height = '52vh', title = 'Market Products List', solidHeader = TRUE, status = 'gray',
                     reactableOutput('compare_products_table')),
               
                fluidRow(     
                  valueBoxOutput("product_mean_market_value"),
                  valueBoxOutput("product_mean_selected_value"),
                  valueBoxOutput("product_value_simulated_value"))
              ),
    
              column(width = 7,
                     
                     box(width = 12, maximizable = TRUE, height = '64vh', title = 'Highest - Lowest 5 Products', solidHeader = TRUE, status = 'gray', footer = 'From Selected banks, 5 highest and 5 lowest feature price and distance from the market mean.',
                         plotlyOutput('compare_products_plot', height = "63vh"))  
                     
                     )

               )
            ),
        



## SIMULATION ======================================================================================================================================================

tabItem(tabName = 'sim_product',
        
        bs4DashGallery()
        
)

    ))
