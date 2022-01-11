

# Body ----------------------------------------------------------

body_ui <- dashboardBody(
    
    ## Intro Panel -------------------------------------------------------
    
    tabItems(
        
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
        
        tabItem(tabName = 'profiles',
                
                bs4DashGallery()
                
        ),
        tabItem(tabName = 'products',
    fluidRow(
        column(12,
               fluidRow(
                   box(width = 4, selectBanca_ui),
                   box(width = 4, simProduct),
                   box(width = 4, selectProduct_ui)
               ),
               
               fluidRow(
                   column(5, align = "center", 
                          h2('Market Products List'),
                          reactableOutput('compare_products_table')),
                   column(7, align = "center", 
                          h2('High-Low 5'),
                          plotlyOutput('compare_products_plot'))
               ))
        
    ))
)
)