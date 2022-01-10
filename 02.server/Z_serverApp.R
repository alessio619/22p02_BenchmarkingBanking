

server_app <- function(input, output, session) {
    
    # FILTERS COMPARE ---------------------------------------------------
    
    filter_product = reactive({input$select_product_compare})
    filter_banca = reactive({input$select_bank_compare})
    
    
    ## Functionality 2: by product --------------------------------------
    
    
  output$compare_products <- renderReactable({
    
    bch_product_table_data_2 = bch_cc_t[-c(1:2), .(banca, cc = names, value = as.numeric(get(filter_product())))]
    
    table_compare <-
      reactable(
        bch_product_table_data_2,
        theme = espn(font_family = "Roboto", font_size = 14, header_font_family = 'Roboto', cell_padding = 8), highlight = TRUE,
        showPageSizeOptions = FALSE, pageSizeOptions = c(5, 10, 15, 20, 25), defaultPageSize = 16,
        columns = list(
          banca = colDef(
              name = "",
              cell = function(value) {
            image <- img(src = sprintf("%s.png", value), height = "24px")
            tagList(
              div(style = list(display = "inline-block", width = "54px"), image)
            )
          }),
          cc = colDef(name = ""),
          value = colDef(name = "", cell = icon_assign(bch_product_table_data_2, buckets = 5, show_values = "right", number_fmt = scales::dollar))
        )
      )
      
      add_source(
        table = table_compare,
        font_family = "roboto,-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans",
        font_size = 16,
        font_style = "normal",
        font_weight = "normal",
        background_color = "#FFFFFF",    
        margin = 4)
  })

  
  
  
}