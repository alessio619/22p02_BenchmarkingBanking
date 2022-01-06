

### UI WRAPPER ###     





# : ============================================================================================================================




ui_app <- 
    
# HEADER ================================================================================

  navbarPage(
       
       title = div(img(src = "innovationteam_logo.png"), "", style = "float:left; padding-left:10px"),
       windowTitle = 'PPC - MV Sales Matrix Update',
       fluid = TRUE,
       theme = default_th,
       useWaitress(color = '#3EB595'),
       
          
       
    ## Intro Panel -------------------------------------------------------
    
            tabPanel(
                
              title = 'Instructions', 
                     
                fluidRow(
                    
                    column(
                        
                        width = 12,
                        
                        main_panel_intro)
                        
                        )
                ),
       
     
# REGULAR UPDATE ====================================================================  
        
        navbarMenu(
            
            title = 'ISC',
            

                             
        ## Upload Tab ---------------------------------
        
           tabPanel(
                
              title = 'Explorer', 
              
                sidebarLayout(
      
                    fluid = FALSE,
                    
                    sidebarPanel = sidebar_upload_explorer,
                    
                    mainPanel = main_panel_upload_explorer)
                     
                ),
        
        
                      "----",
      
          
        ## Analysis Tab ---------------------------
        
           tabPanel(
                
              title = 'Simulation', 
              
              useWaiter(),
              
                sidebarLayout(
      
                    fluid = FALSE,
                    
                    sidebarPanel = sidebar_analysis_ru,
                    
                    mainPanel = main_panel_analysis_ru)
                     

                )),
  
    
    
        
    ## Process Tab -------------------------------------------------------
    
            tabPanel(
                
              title = 'License', 
                     
                fluidRow(
                    
                    column(
                        
                        width = 11, offset = 1,
                        
                        main_panel_process)
                        
                        )
              
                )


                tags$style(type = 'text/css', '.navbar { background-color: #262626;
                           font-family: Arial;
                           font-size: 13px;
                           color: #FF0000; }',

                           '.navbar-dropdown { background-color: #262626;
                           font-family: Arial;
                           font-size: 13px;
                           color: #FF0000; }',

                           '.navbar-default .navbar-brand {
                             color: #cc3f3f;
                           }'

                           )               
                   

    
)

