
# UI Elements =====================================================================================


## Title -----------------------------------------------------------     

title_ui <- tags$a(href='http://mbsconsulting.com', HTML('<center><img src="innovationteam_logo_275_55.png" height="44" width="248"/><center>'))


## Header ----------------------------------------------------------

header_ui <- dashboardHeader(
    title = title_ui,
    disable = FALSE,
    .list = NULL,
    leftUi = NULL,
    rightUi = NULL,
    skin = "light",
    status = "olive",
    border = TRUE,
    compact = TRUE,
    sidebarIcon = shiny::icon("bars"),
    controlbarIcon = shiny::icon("th"),
    fixed = TRUE
)


## Controlbar ----------------------------------------------------------

controlbar_ui <- bs4DashControlbar(
    id = NULL,
    disable = FALSE,
    width = 250,
    collapsed = TRUE,
    overlay = TRUE,
    skin = "dark",
    pinned = NULL
)


## Footer ----------------------------------------------------------

footer_ui <- dashboardFooter(
    left = 'Powered by Innovation Team',
    right = "A Cerved Group Company"
)