

### BUTTONS ###    




# : =============================================================


## Execute ---------------------------


bttn_analysis_run <- 
    
    actionButton(
          
          inputId = 'run_sim',
          label = 'Execute & Visualize',
          icon = icon('running'),
          width = side_bar_width,
          class = "btn-danger")






## Download ------------------


bttn_analysis_download <- 
    
    downloadButton(
          
          outputId = 'download_sim',
          label = 'Export Results',
          icon = icon('file-export'),
          style = "width:100%;",
          class = "btn-primary")


