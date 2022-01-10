

server_app <- function(input, output, session) {
    
    # FILTERS COMPARE ---------------------------------------------------
    
    df_compare = reactive({
      
      bch_cc_t_1 = bch_cc_t[, .(banca, cc = cc_names, value = as.numeric(get(input$select_product_compare)))]
      bch_cc_t = bch_cc_t_1[banca %in% c(input$select_bank_compare)]
      
      })
    
    
    ## Functionality 2: by product --------------------------------------
    
  output$compare_products_plot <- renderPlotly({
      
      df_plot = copy(df_compare())
      df_plot = df_plot[, mean := mean(value, na.rm = TRUE)]
      df_plot1 = head(df_plot, 5)
      df_plot2 = tail(df_plot, 5)
      df_plot = rbind(df_plot1, df_plot2)

      
      fig <- plot_ly(df_plot, color = I("gray80"), height = '680')
      fig <- fig %>% add_segments(x = ~mean, xend = ~value, y = ~reorder(cc, value), yend = ~cc, showLegend = FALSE)
      fig <- fig %>% add_markers(x = ~mean, y = ~reorder(cc, value), name = "mean", color = I("gray60"), showLegend = FALSE, marker = list(size = 10))
      fig <- fig %>% add_markers(x = ~value, y = ~reorder(cc, value), name = "value", color = '#F29F05',  marker = list(size = 20), showLegend = FALSE)
      fig <- fig %>% layout(
                        title = "",
                        xaxis = list(title = ""),
                        yaxis = list(title = ""),
                        margin = list(l = 65))
      fig
      
  })
      
  output$compare_products_table <- renderReactable({
    

      df = df_compare()
      
    table_compare <-
        
      reactable(
        df,
        
        theme = espn(font_family = "Lato", font_size = 14, header_font_family = 'Lato', cell_padding = 8), highlight = TRUE,
        showPageSizeOptions = FALSE, pageSizeOptions = c(5, 10, 15, 20, 25), defaultPageSize = 15,
        
        columns = list(
          banca = colDef(
              name = "",
              cell = function(value) {
            image <- img(src = sprintf("%s.png", value), height = "20px")
            tagList(
              div(style = list(display = "inline-block", width = "36px"), image)
            )
          }),
          cc = colDef(name = ""),
          value = colDef(name = "", cell = icon_assign(df, buckets = 5, fill_color = "#025E73", show_values = "right", number_fmt = scales::dollar))
        )
      )
      
  })

  
  
  
}