

# Sidebar ----------------------------------------------------------

sidebar_ui <- bs4DashSidebar(

    ### Info e Fascicoli ===========================
    sidebarMenu(
        div(style="text-align:left;",
        menuItem(
            "Banks Info",
            tabName = "banks",
            selected = TRUE,
            icon = shiny::icon("bank")
        ),
        
        menuItem(
            "ISC Profiles",
            tabName = "profiles",
            icon = shiny::icon("id-badge")
        ),
        
        menuItem(
            "Overview",
            tabName = "overview",
            icon = shiny::icon("chart-bar")
        ),
        
        menuItem(
            "Positioning",
            tabName = "sim_position",
            icon = shiny::icon("bolt")
        ),
        
        menuItem(
            "Groups",
            tabName = "groups",
            icon = shiny::icon("chart-pie")
        ),
        
        menuItem(
            "Product",
            tabName = "products",
            icon = shiny::icon("align-left")
        ),
        
        menuItem(
            "Simulation",
            tabName = "sim_product",
            icon = shiny::icon("caret-right")
        )
        
        
    )),
    ## TAGS ========================================
    
    disable = FALSE,
    width = NULL,
    skin = "light",
    status = "warning",
    elevation = 3,
    collapsed = FALSE,
    minified = FALSE,
    expandOnHover = TRUE,
    fixed = TRUE,
    id = NULL,
    customArea = NULL,
    
    
    ## ITEMS ========================================
    
    ###

)

