

# Body ----------------------------------------------------------

body_ui <- dashboardBody(
    
    tabItems(
   
    
  ## BANK INFO ===========================================================================================================================================================
                 
        tabItem(tabName = 'banks',
                
                fluidRow(
                 
                    box(width = 4, elevation = 1, title = "Select bank", solidHeader = TRUE, status = 'orange', selectBanca_info),
                    box(width = 4, elevation = 1, title = "Select account", solidHeader = TRUE, status = 'orange', selectAccount_info),
                    box(width = 4, elevation = 1, title = "Select file", solidHeader = TRUE, status = 'orange', selectFile_info)
                    
                        ),        

                fluidRow(
                    
                    box(width = 12, elevation = 1, headerBorder = FALSE,
                        
                        title = 'Document Live Viewer:',
                            
                        uiOutput('fileViewer')

                    )
                )
            ),

  
  
  ## ISC PROFILES =========================================================================================================================================================
  
        tabItem(tabName = 'profiles',
                
                fluidRow(
                
                infoBox(width = 12, elevation = 1, plotlyOutput('profiles_sunburst'))
                
                )
        ),
  
  
  
  ## MARKET OVERVIEW ======================================================================================================================================================
  
        tabItem(tabName = 'overview',
            
            infoBox(width = 12, elevation = 1,
                    
                carousel(
                    
                    id = 'banks_carousel',
                    indicators = TRUE,
                    width = 12,
                    
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
    
                infoBox(selectBanca_ui),
                infoBox(simProduct),
                infoBox(selectProduct_ui)
                
              ),
               
            fluidRow(
                   box(5, align = "center", 
                          h2('Market Products List'),
                          reactableOutput('compare_products_table')),
                   box(7, align = "center", 
                          h2('High-Low 5'),
                          plotlyOutput('compare_products_plot'))
               )
            ),
        



## SIMULATION ======================================================================================================================================================

tabItem(tabName = 'sim_product',
        
        bs4DashGallery()
        
)

    ))
