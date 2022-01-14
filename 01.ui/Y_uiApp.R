





# : ============================================================================================================================




ui_app <- 
    
# HEADER ================================================================================

dashboardPage(
       
       title = 'Banking Benchmark',
       tags$li(
           class = "dropdown",
           style = "padding: 8px;",
           shinyauthr::logoutUI("logout")),
       fullscreen = TRUE,
       freshTheme = default_th,
       header = header_ui,
       sidebar = sidebar_ui,
       controlbar = controlbar_ui,
       footer = footer_ui,
       body = body_ui,
       scrollToTop = TRUE
    
)


ui_app <- secure_app(ui_app, theme = shinythemes::shinytheme("lumen"))
