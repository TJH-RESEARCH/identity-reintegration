


# Append to Results Log -------------------------------------------------------------------

append_results_tables <-
  function(table){
    
    write_lines(x = table,
                append = TRUE,
                file = paste(here::here('output/results/results-tables.txt'))
    )
   
  }
    
           