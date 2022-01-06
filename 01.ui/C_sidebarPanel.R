

### SIDEBAR PANELS ###    




# : ---------




# A. UPLOAD DATA ========================================


## REGULAR UPDATE -------------------------------

sidebar_upload_ru <- 

  ### Selectors -------------------------------
     
    sidebarPanel(
        
        tags$style(".well {background-color: #fff;}"),
         
         width = 3,

        h4('Analyze Data'),
    
        hr(),

        
      ### Load Inputs Files      
          
          input_upload_1_ru,
      

          input_upload_2_ru, 
      

          input_upload_3_ru,
      

          input_upload_4_ru,
      

          input_upload_5_ru,
      

      hr(),
      
      br(),
      
      export_ru_user,
      

      hr(),
      

      

      
   ### Action Buttons --------------------------
      
      button_upload_1_ru,
   
   br()
   
    )

     




# : ---------







# B. ANALYSIS ================================================================


## REGULAR UPDATE ================================================

sidebar_analysis_ru <- 

  ## Selectors -------------------------------
     
    sidebarPanel(
         
         width = 3,

         h4('Main Analysis'),
         
         hr(),
         

   ### Aggregation Level -----------------------
   
     ### Cateogry for Aggregation   
        
         category_aggregation_ru,

   
    
     ### Time Granularity   
         
         time_granularity_ru,

   
   
     ### Data Range    
   
         datarange_ru,
   
         hr(),
   
   
     
     ### Type of View   

         type_view_ru,
   
         hr(),

   
     ### Export File name
   
        export_ru_file,
   
        hr(),

      
      
   ## Action Buttons --------------------------
      

      button_analysis_run_ru,
      
      br(),
      br(),
   
      

      uiOutput('archive_button'),
   
      br(),
      


      button_analysis_download_ru,
   
      br(),
      br()
   
   
    )



### POD Aggregate -----------------------------------------------------

sidebar_analysis_ru_pod_agg <- 

  ## Selectors -------------------------------
     
    sidebarPanel(
         
         width = 3,

         h4('Focus Analysis'),
         
         hr(),
         

   ### Aggregation Level -----------------------
   
     ### Filter Ownership to analyze  
        
         select_own_ru_agg,  
   
   
   
     ### Filter POD to analyze   
        
         select_pod_ru_agg,
   
   
   
     ### Cateogry for Aggregation   
        
         category_aggregation_ru_pod_agg,

   
    
     ### Time Granularity   
         
         time_granularity_ru_pod_agg,

   
   
     ### Data Range    
   
         datarange_ru_pod_agg,
   
         hr(),
   
   
     
     ### Type of View   

         type_view_ru_pod_agg,
   
         hr(),

   
     ### Export File name
   
        export_ru_pod_file_agg,
   
        hr(),

      
      
   ## Action Buttons --------------------------
      

      button_analysis_run_ru_pod_agg,
      
      br(),
      br(),

   

      button_analysis_download_ru_pod_agg,
   
      br(),
      br()
   
   
    )










