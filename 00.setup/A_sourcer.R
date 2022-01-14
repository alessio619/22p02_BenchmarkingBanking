

# : ========================================================================================================================================================



## Sourcer ----------------------------------------------------------------

# Set up ===============================================================

source(here::here('00.setup', "B_packages.R"))
source(here::here('00.setup', "C_theme.R"))
source(here::here('00.setup', "D_preparation.R"))



# UI ===============================================================
source(here('01.ui', "A_selectors.R"))
source(here('01.ui', "B_buttons.R"))
source(here('01.ui', "C_modules.R"))
source(here('01.ui', "D_elementsUI.R"))
source(here('01.ui', "E_sidebar.R"))
source(here('01.ui', "F_body.R"))
source(here('01.ui', "Y_uiApp.R"))


# Source SERVER ===============================================================
source(here('02.server', "Z_serverApp.R"))


   






