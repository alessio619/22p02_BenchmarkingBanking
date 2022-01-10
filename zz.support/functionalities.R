

# A. PACKAGES ===================================================================================

library(data.table)
library(reactable)
library(reactablefmtr)
library(plotly)


# B. DATA ===================================================================================

## All -------------------------------------------------------------
benchmark_cc = fread(path(getwd(), 'yy.data', 'data', 'benchmark_cc_v1.csv'))


## By Product -------------------------------------------------------
bch_cc_t = transpose(benchmark_cc, make.names = 'code')
bch_cc_t_names = data.table('names' = colnames(benchmark_cc)[-2])
bch_cc_t_banca = data.table('banca' = c(NA, NA, 'isp', 'isp', 'uni', 'uni', 'uni', 'uni', 'ubi', 'cag', 'cag', 'cag', 'bpm', 'mps', 'mps', 'mps', 'mps', 'mps', 'mps', 'bnl', 'bnl', 'bnl', 'bpr', 'cdm'))

bch_cc_t = cbind(bch_cc_t_names, bch_cc_t)
bch_cc_t = cbind(bch_cc_t_banca, bch_cc_t)

benchmark_cc_items = benchmark_cc[, .(group = type, items = name, item_code = code)]



# C. Functionalities===================================================================================

## Functionality 1: show all ----------------------------------------
bch_all_table = reactable(benchmark_cc, theme = flatly(), highlight = TRUE)



## Functionality 2: by product --------------------------------------

filtered = 'cn_1'
bch_product_table_data_2 = bch_cc_t[-c(1:2), .(banca, cc = names, value = as.numeric(get(filtered)))]

bch_product_table_data_2 <-
reactable(
    bch_product_table_data_2,
    theme = flatly(), highlight = TRUE,
    showPageSizeOptions = FALSE, pageSizeOptions = c(5, 10, 15, 20, 25), defaultPageSize = 22,
    columns = list(
        banca = colDef(cell = function(value) {
            image <- img(src = sprintf("images/%s.png", value), height = "36px")
            tagList(
                div(style = list(display = "inline-block", width = "54px"), image)
            )
        }),
        value = colDef(cell = icon_assign(bch_product_table_data_2, buckets = 5, show_values = "right", number_fmt = scales::dollar))
    )
)

plot_ly(bch_product_table_data_2, 
        x = ~cc,
        y = ~value,
        )
bch_product_table_data_2
