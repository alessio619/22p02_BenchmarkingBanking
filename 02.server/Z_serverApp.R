

server_app <- function(input, output, session) {
    
    ## Functionality 2: by product --------------------------------------
    
  output$compare_products <- renderReactable({
    
    filtered = input$select_product_compare
    
    bch_product_table_data_2 = bch_cc_t[-c(1:2), .(banca, cc = names, value = as.numeric(get(filtered)))]
    
    table_compare <-
      reactable(
        bch_product_table_data_2,
        theme = flatly(), highlight = TRUE,
        showPageSizeOptions = FALSE, pageSizeOptions = c(5, 10, 15, 20, 25), defaultPageSize = 22,
        columns = list(
          banca = colDef(cell = function(value) {
            image <- img(src = sprintf("%s.png", value), height = "24px")
            tagList(
              div(style = list(display = "inline-block", width = "54px"), image)
            )
          }),
          value = colDef(cell = icon_assign(bch_product_table_data_2, buckets = 5, show_values = "right", number_fmt = scales::dollar))
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