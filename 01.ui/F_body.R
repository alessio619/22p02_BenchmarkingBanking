

# Body ----------------------------------------------------------

body_ui <- dashboardBody(
    
    tabItems(

      
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
                           plotlyOutput('compare_products_plot', height = "62vh"))  
                       
                )
                
              )
      ),
 
 
 ## MARKET OVERVIEW ======================================================================================================================================================
 
 tabItem(tabName = 'overview',
         
         fluidRow(
           
           box(width = 4, elevation = 1, icon = shiny::icon("bank"), title = "Select bank", solidHeader = TRUE, status = 'orange', height = '6vh', selectBanca_overview),
           box(width = 8, elevation = 1, icon = shiny::icon("bank"), title = "Explain", solidHeader = TRUE, status = 'gray', height = '6vh', 'text description')
         ),    
         
         fluidRow(
           
           infoBox(width = 6, elevation = 1,  color = 'maroon', 
                   
                   plotlyOutput('radar_benchmark')
                   
           ),
           
           infoBox(width = 6, elevation = 1,  color = 'maroon', 
                   
                   plotlyOutput('bar_benchmark')
                   
           ),              
         ),
         
         fluidRow(
           
           infoBox(width = 12, elevation = 1,  color = 'teal',  
                   
                   plotlyOutput('scatter_matrix_benchmark')
                   
           )
         )      
 ),
         
    
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
                         
                      fluidRow(

                        box(width = 6, icon = shiny::icon("globe"), title = 'Select Group features', color = 'success', background = 'warning', gradient = TRUE, fill = TRUE, height = '8vh',
                            selectVar_profile),

                        box(width = 6, icon = shiny::icon("cloudsmith"), title = 'Select Value', color = 'success', background = 'warning', gradient = TRUE, fill = TRUE, height = '8vh',
                            selectValue_profile)
                        
                      ),
                             
                        fluidRow(
                          
                           tabBox(
                             id = 'famiglie_bassa', width = 4,  elevation = 1, title = "Famiglie Bassa", height = "345px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Table", side = "right", status = 'lightblue',
                      
                             tabPanel("Plot", plotlyOutput('radar_fambas', height = '30vh')),
                             tabPanel("Table", reactableOutput('table_fambas'))),
                             
                           tabBox(
                             id = 'famiglie_media', width = 4,  elevation = 1, title = "Famiglie Media", height = "345px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Table", side = "right", status = 'lightblue',
                             
                             tabPanel("Plot", plotlyOutput('radar_fammed', height = '30vh')),
                             tabPanel("Table", reactableOutput('table_fammed'))),
                           
                           tabBox(
                             id = 'famiglie_alta', width = 4,  elevation = 1, title = "Famiglie Alta", height = "345px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Table", side = "right", status = 'lightblue',
                             
                             tabPanel("Plot", plotlyOutput('radar_famalt', height = '30vh')),
                             tabPanel("Table", reactableOutput('table_famalt'))),   
                           
                        ),
                        
                        fluidRow(
                          
                           tabBox(
                             id = 'giovani', width = 4,  elevation = 1, title = "Giovani", height = "345px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Table", side = "right", status = 'success',
                             
                             tabPanel("Plot", plotlyOutput('radar_giovani', height = '30vh')),
                             tabPanel("Table", reactableOutput('table_giovani'))),
                           
                           tabBox(
                             id = 'pensionati_bassa', width = 4,  elevation = 1, title = "Pensionati Bassa", height = "345px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Table", side = "right", status = 'gray',
                             
                             tabPanel("Plot", plotlyOutput('radar_penbas', height = '30vh')),
                             tabPanel("Table", reactableOutput('table_penbas'))),
                           
                           tabBox(
                             id = 'pensionati_media', width = 4,  elevation = 1, title = "Pensionati Media", height = "345px", collapsible = TRUE, solidHeader = TRUE,  type = "tabs", selected = "Table", side = "right", status = 'gray',
                             
                             tabPanel("Plot", plotlyOutput('radar_penmed', height = '30vh')),
                             tabPanel("Table", reactableOutput('table_penmed'))) 
                        )
                        
                      )
                )
        
        )
  

  ## POSITIONING SIMULATION ======================================================================================================================================================
  
#        tabItem(tabName = 'sim_position',
#                
#                bs4DashGallery()
#                
#        ),   
  
  
  
  ## GROUP PRODUCT ======================================================================================================================================================
  
#  tabItem(tabName = 'groups',
#          
#          bs4DashGallery()
#          
#  ),   
  
  
  

        



## SIMULATION ======================================================================================================================================================

#tabItem(tabName = 'sim_product',
#        
#        bs4DashGallery()
#        
#)

    ))
