
# Server ---------------------------------------------------------------------------------------------------------------------

server_app <- function(input, output, session) {
    
    ## 0. FILTERS COMPARE ---------------------------------------------------
    
    df_compare = reactive({
      
      bch_cc_t_1 = bch_cc_t[, .(banca, cc = cc_names, value = as.numeric(get(input$select_product_compare)))]
      bch_cc_t = bch_cc_t_1[banca %in% c(input$select_bank_compare)]
      
      sim_val_product = data.table(banca = 'Simulation', cc = "Simulation", value = input$simProductPrice)
      
      bch_cc_t = rbind(bch_cc_t, sim_val_product)
      
      })
    
    
    
    ## 1. BANK INFO ===========================================================================================================================================================

    ### Functionality 1: File Viewer -------------------------------------
    
    output$fileViewer <- renderUI({
      
      bb_acc = bank_accounts[bank == input$select_bank_info] 
      bb_acc_names = bb_acc$acc
      
      updateSelectInput(
        inputId = 'select_account_info',
        label = NULL,
        choices = bb_acc_names,
        selected = bb_acc_names[1]
      )
      
      src_file = paste0('/fascicoli/', input$select_bank_info, '_', input$select_account_info, '/',  input$select_file_info, '.pdf')
      
    tags$iframe(style = 'height:680px; width:100%; scrolling=yes; border:1px solid white;>', 
                src = as.character(src_file))
      
    })
    
    
    
    ## 2. ISC PROFILES =========================================================================================================================================================
    
    #### INCOMPLETE
    output$profiles_sunburst <- renderPlotly({
      
      data_1_online <- isc_profiles[var_type == 'valore' & format == 'online']
      data_2_online <- isc_profiles[var_type == 'valore' & format == 'sportello']
      data_3_online <- cbind(data_2_online, data_1_online$cost)
      
      fig <- plot_ly(data_3_online, x = ~V2, y = ~cost, type = 'scatter', mode = 'markers', size = ~cost, color = ~group, colors = 'Paired',
                     sizes = c(10, 50),
                     marker = list(opacity = 0.5, sizemode = 'diameter'),
                     hoverinfo = 'text',
                     text = ~paste0(voice))
      fig <- fig %>% layout(title = '',
                            xaxis = list(showgrid = FALSE),
                            yaxis = list(showgrid = FALSE),
                            showlegend = FALSE)
      
      fig
      
    })
    
    
    
    ## 3. MARKET OVERVIEW ======================================================================================================================================================
    
    
    
    
    ## 4. POSITIONING SIMULATION ======================================================================================================================================================
    
    
    
    
    ## 5. GROUP PRODUCT ======================================================================================================================================================
    
    
    
    
    ## 6. PRODUCT COMPARE ======================================================================================================================================================
    
    ### Plot High-Low 5 --------------------------------------
    
  output$compare_products_plot <- renderPlotly({
      
      df_plot = copy(df_compare())
      df_plot = df_plot[, mean := mean(value, na.rm = TRUE)]
      df_plot1 = head(df_plot, 5)
      df_plot2 = tail(df_plot, 5)
      df_plot = rbind(df_plot1, df_plot2)

      
      fig <- plot_ly(df_plot, color = I("gray80"))
      fig <- fig %>% add_segments(x = ~mean, xend = ~value, y = ~reorder(cc, value), yend = ~cc, showLegend = FALSE)
      fig <- fig %>% add_markers(x = ~mean, y = ~reorder(cc, value), name = "mean", color = I("gray60"), showLegend = FALSE, marker = list(size = 15))
      fig <- fig %>% add_markers(x = ~value, y = ~reorder(cc, value), name = "value", color = ~banca,  marker = list(size = 30), showLegend = FALSE)
      fig <- fig %>% layout(
                        title = "",
                        xaxis = list(title = ""),
                        yaxis = list(title = ""),
                        margin = list(l = 65))
      fig
      
  })
      
  
  ### Table Selected --------------------------------------
  
  output$compare_products_table <- renderReactable({
    
      df = df_compare()
      
    table_compare <-
        
      reactable(
        df,
        
        theme = espn(font_family = "Lato", font_size = 14, header_font_family = 'Lato', cell_padding = 8), highlight = TRUE,
        showPageSizeOptions = FALSE, pageSizeOptions = c(5, 10, 15, 20, 25), defaultPageSize = 11,
        
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
          value = colDef(name = "", cell = icon_assign(df, buckets = 5, fill_color = "#39cccc", show_values = "right", number_fmt = scales::dollar))
        )
      )
      
  })
  

  
  ### Value Box Calculations --------------------------------------
  
  output$product_mean_market_value <- renderValueBox({
    
    bch_cc_t_1 = bch_cc_t[, .(banca, cc = cc_names, value = as.numeric(get(input$select_product_compare)))]
    
    valueBox('Market Products mean', subtitle = tags$p(format(mean(bch_cc_t_1$value, na.rm = TRUE), digits = 2), style = 'font-weight: bold; font-size: 250%; margin: 0%'), width = 4, color = "gray", icon = icon("database"), href = NULL, gradient = TRUE,
             value = tags$p("Market Average Price", style = "font-size: 100%"))    
    
  })
  
  
  output$product_mean_selected_value <- renderValueBox({
    valueBox('Selected Products mean', subtitle = tags$p(format(mean(df_compare()$value, na.rm = TRUE), digits = 2), style = 'font-weight: bold; font-size: 250%; margin: 0%'), width = 4, color = "success", icon = icon("database"), href = NULL, gradient = TRUE,
             value = tags$p("Selected Average Price", style = "font-size: 100%"))      
    
  })
  
  
  output$product_value_simulated_value <- renderValueBox({
    valueBox('Selected Products mean', subtitle = tags$p(format(input$simProductPrice, digits = 2), style = 'font-weight: bold; font-size: 250%; margin: 0%'), width = 4, color = "maroon", icon = icon("database"), href = NULL, gradient = TRUE,
             value = tags$p("Selected Average Price", style = "font-size: 100%"))      
    
  })
  

  
  
  
  
}