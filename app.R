

# : ========================================================================================================================================================

suppressMessages(suppressWarnings(
source(here::here('00.setup', "A_sourcer.R"))))

# App ===============================================================

shinyApp(
    
      ui = ui_app,
      server = server_app
    
          )




