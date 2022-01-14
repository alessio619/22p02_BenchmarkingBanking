
# Server ---------------------------------------------------------------------------------------------------------------------

server_app <- function(input, output, session) {
    
    ## 0. Authentication ---------------------------------------------------
  
  # call the server part
  # check_credentials returns a function to authenticate users
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )
  
  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })
    
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
    
    ### Radar Charts -----------------------------------
    
    output$radar_fambas <- renderPlotly({
      
      t_fambas2 = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'famiglie_bassa']
      
      plot_ly(t_fambas2, type = 'scatterpolar', r = ~cost, theta = ~voice, fill = 'toself') %>%
        layout(showlegend = F,
          polar = list(radialaxis = list(visible = T, range = c(min(t_fambas2$cost), max(t_fambas2$cost))))
        )
      
    })
    

    output$radar_fammed <- renderPlotly({
      
      t_fammed2 = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'famiglie_bassa']
      
      plot_ly(t_fammed2, type = 'scatterpolar', r = ~cost, theta = ~voice, fill = 'toself') %>%
        layout(showlegend = F,
               polar = list(radialaxis = list(visible = T, range = c(min(t_fammed2$cost), max(t_fammed2$cost))))
        )
      
    })
    
    
    output$radar_famalt <- renderPlotly({
      
      t_famalt2 = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'famiglie_bassa']
      
      plot_ly(t_famalt2, type = 'scatterpolar', r = ~cost, theta = ~voice, fill = 'toself') %>%
        layout(showlegend = F,
               polar = list(radialaxis = list(visible = T, range = c(min(t_famalt2$cost), max(t_famalt2$cost))))
        )
      
    })
    
    
    output$radar_giovani <- renderPlotly({
      
      t_giovani2 = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'famiglie_bassa']
      
      plot_ly(t_giovani2, type = 'scatterpolar', r = ~cost, theta = ~voice, fill = 'toself') %>%
        layout(showlegend = F,
               polar = list(radialaxis = list(visible = T, range = c(min(t_giovani2$cost), max(t_giovani2$cost))))
        )
      
    })
    
    
    output$radar_penmed <- renderPlotly({
      
      t_penmed2 = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'famiglie_bassa']
      
      plot_ly(t_penmed2, type = 'scatterpolar', r = ~cost, theta = ~voice, fill = 'toself') %>%
        layout(showlegend = F,
               polar = list(radialaxis = list(visible = T, range = c(min(t_penmed2$cost), max(t_penmed2$cost))))
        )
      
    })
    
    
    output$radar_penbas <- renderPlotly({
      
      t_penbas2 = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'famiglie_bassa']
      
      plot_ly(t_penbas2, type = 'scatterpolar', r = ~cost, theta = ~voice, fill = 'toself') %>%
        layout(showlegend = F,
               polar = list(radialaxis = list(visible = T, range = c(min(t_penbas2$cost), max(t_penbas2$cost))))
        )
      
    })        
    
    
    ### Groups Table ------------------------------------------------------

  
    output$table_fambas <- renderReactable({
      
      t_fambas = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'famiglie_bassa']
      t_fambas[, group := NULL]
      t_fambas[, var_type := NULL]
      
      table_fambas <-
        
        reactable(
          
          t_fambas,
          
          theme = espn(font_family = "Lato", font_size = 12, header_font_family = 'Lato', cell_padding = 8), highlight = TRUE,
          showPageSizeOptions = TRUE, pageSizeOptions = c(5, 10, 15, 20, 25), defaultPageSize = 5)
      
    })
    
    output$table_fammed <- renderReactable({
      
      t_fammed = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'famiglie_media']
      t_fammed[, group := NULL]
      t_fammed[, var_type := NULL]
      
      table_fammed <-
        
        reactable(
          
          t_fammed,
          
          theme = espn(font_family = "Lato", font_size = 12, header_font_family = 'Lato', cell_padding = 8), highlight = TRUE,
          showPageSizeOptions = TRUE, pageSizeOptions = c(5, 10, 15, 20, 25), defaultPageSize = 5)
      
    })
    
    output$table_famalt <- renderReactable({
      
      t_famalt = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'famiglie_alta']
      t_famalt[, group := NULL]
      t_famalt[, var_type := NULL]
      
      table_famalt <-
        
        reactable(
          
          t_famalt,
          
          theme = espn(font_family = "Lato", font_size = 12, header_font_family = 'Lato', cell_padding = 8), highlight = TRUE,
          showPageSizeOptions = TRUE, pageSizeOptions = c(5, 10, 15, 20, 25), defaultPageSize = 5)
      
    }) 
    
    
    output$table_giovani <- renderReactable({
      
      t_giovani = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'giovani']
      t_giovani[, group := NULL]
      t_giovani[, var_type := NULL]
      
      table_giovani <-
        
        reactable(
          
          t_giovani,
          
          theme = espn(font_family = "Lato", font_size = 12, header_font_family = 'Lato', cell_padding = 8), highlight = TRUE,
          showPageSizeOptions = TRUE, pageSizeOptions = c(5, 10, 15, 20, 25), defaultPageSize = 5)
      
    })
    
    output$table_penbas <- renderReactable({
      
      t_penbas = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'pensionati_bassa']
      t_penbas[, group := NULL]
      t_penbas[, var_type := NULL]
      
      table_penbas <-
        
        reactable(
          
          t_penbas,
          
          theme = espn(font_family = "Lato", font_size = 12, header_font_family = 'Lato', cell_padding = 8), highlight = TRUE,
          showPageSizeOptions = TRUE, pageSizeOptions = c(5, 10, 15, 20, 25), defaultPageSize = 5)
      
    })
    
    output$table_penmed <- renderReactable({
      
      t_penmed = isc_profiles[var_type == input$select_value_profile & format == input$select_format_profile & voice_type_desc == input$select_var_profile & group == 'pensionati_media']
      t_penmed[, group := NULL]
      t_penmed[, var_type := NULL]
      
      table_penmed <-
        
        reactable(
          
          t_penmed,
          
          theme = espn(font_family = "Lato", font_size = 12, header_font_family = 'Lato', cell_padding = 8), highlight = TRUE,
          showPageSizeOptions = TRUE, pageSizeOptions = c(5, 10, 15, 20, 25), defaultPageSize = 5)
      
    })  
    
    
    
    
    
    output$radar_benchmark <- renderPlotly({
      
      bch_t = transpose(benchmark_cc_grouped, make.names = 'type')
      bch_t[, cc_names := cc_names$cc_names]
      bch_t[, banca := na.omit(bch_cc_t_banca$banca)]
      
      bch_t_plot = bch_t[banca == input$select_bank_overview]
      bch_t_plot[, banca := NULL]
      bch_t_plot = melt(bch_t_plot, id.vars = 'cc_names', variable.name = 'type', value.name = 'score')
      
      
      plot_ly(bch_t_plot, type = 'scatterpolar', r = ~score, theta = ~type, name = ~cc_names, fill = 'toself') %>%
        layout(polar = list(radialaxis = list(visible = T, range = c(min(bch_t_plot$score), max(bch_t_plot$score))))
        )
      
    })      
    
    
    
    output$bar_benchmark <- renderPlotly({
      
      bch_t = transpose(benchmark_cc_grouped, make.names = 'type')
      bch_t[, cc_names := cc_names$cc_names]
      bch_t[, banca := na.omit(bch_cc_t_banca$banca)]
      
      bch_t_plot = bch_t[banca == input$select_bank_overview]
      bch_t_plot[, banca := NULL]
      bch_t_plot = melt(bch_t_plot, id.vars = 'cc_names', variable.name = 'type', value.name = 'score')
      
      plot_ly(bch_t_plot, type = 'bar', x = ~cc_names, y = ~score, name = ~type) %>%
        layout(showLegend = FALSE,
               title = "",
               xaxis = list(title = ""),
               yaxis = list(title = ""),
               margin = list(l = 65))
      
    })   
    
    
    output$scatter_matrix_benchmark <- renderPlotly({
      
      bch_t = transpose(benchmark_cc_grouped, make.names = 'type')
      bch_t[, cc_names := cc_names$cc_names]
      bch_t[, banca := na.omit(bch_cc_t_banca$banca)]
      
      bch_t_plot = melt(bch_t, id.vars = c('banca', 'cc_names'), variable.name = 'type', value.name = 'score')
      bch_t_plot = bch_t_plot[, (score = mean(score, na.rm = TRUE)), by = c('banca', 'cc_names')]
      bch_t_plot[, quality := rnorm(22, mean = 5, sd = 3)]
      
      plot_ly(bch_t_plot, type = 'scatter', mode = 'markers', x = ~V1, y = ~quality, 
              name = ~banca, text = ~cc_names, 
              marker = list(size = ~V1, opacity = 0.5)) %>%
        layout(showLegend = FALSE,
               title = "",
               xaxis = list(title = ""),
               yaxis = list(title = ""),
               margin = list(l = 65))
      
    })       
    
    
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
      fig <- fig %>% layout(showLegend = FALSE,
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