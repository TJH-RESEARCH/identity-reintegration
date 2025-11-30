
# -----------------------1--------------------------------------------------
source(here::here('src/01_config/functions/function-append-results.R'))


# Label Coefficients Depending on number of clusters ----------------------
if (clustering == '3-cluster'){
  coef_names <- c('(Intercept)','Lower Identity', 'Higher Identity')
} else if(clustering == '2-cluster'){
  coef_names <- c('(Intercept)','Lower Identity')
}



# -------------------------------------------------------------------------
table <- 
  texreg::texreg(
    list(

      coeftest_civilians_1,
      coeftest_help_seeking_1,
      coeftest_purpose_1,
      coeftest_resent_1,
      coeftest_regiment_1
      
    ), 
    ci.force = T,
    ci.force.level = .95,
    ci.test = NA,
    sideways = F, 
    custom.model.names = c('Civilians', 'Help Seeking', 'Purpose','Resent', 'Regiment'),
    custom.coef.names = coef_names, 
    caption = paste("Bivariate Regressions: All Outcomes"), 
    caption.above = T
  )


# Grab the Goodness of Fit Statistics -------------------------------------

gof_stats <- texreg::texreg(
  list(
    model_civilians_1,
    model_help_seeking_1,
    model_purpose_1,
    model_resent_1,
    model_regiment_1
  ), 
  stars = numeric(0),
  custom.note = 'Unstandardized coefficients and 95\\% Confidence Intervals',
  caption = "Regressions Across Outcomes", 
  caption.above = T
)



# Make response table length given number of clusters ---------------------




if (clustering == '3-cluster'){
  table_length <- 14
} else if(clustering == '2-cluster'){
  table_length <- 12
}


results_table <- c(read_lines(table)[1:table_length], read_lines(gof_stats, skip = table_length)[c(1,2,5,6,7,8,9,10)])
results_table %>% print()
# Write -------------------------------------------------------------------
write_lines(x = results_table,
            file = paste0(here::here(), '/output/tables/bivariate-tables-', clustering, '.txt'))

append_results_tables(results_table)
erm(results_table)
  