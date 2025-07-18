
# -----------1--------------------------------------------------------------
source(here::here('src/01_config/functions/function-append-results.R'))


# Label Coefficients Depending on number of clusters ----------------------
if (clustering == '3-cluster'){
  coef_names <- c('(Intercept)', #1
                  'Lower Identity',    #2
                  'Higher Identity',
                  'White (Race)',
                  'Black (Race)',
                  'Male (Gender)', 
                  'Enlisted',
                  'Post-9/11 Era', 
                  'Vietnam Era',
                  'Persian Gulf Era',
                  'Combat',
                  'Deployments',
                  'Air Force',
                  'Marines',
                  'Navy')
} else if(clustering == '2-cluster'){
  coef_names <- c('(Intercept)', #1
                  'Lower Identity',
                  'White (Race)',
                  'Black (Race)',
                  'Male (Gender)', 
                  'Enlisted',
                  'Post-9/11 Era', 
                  'Vietnam Era',
                  'Persian Gulf Era',
                  'Combat',
                  'Deployments',
                  'Air Force',
                  'Marines',
                  'Navy')
}





table <- 
  texreg::texreg(
    list(
      coeftest_civilians_2,
      coeftest_help_seeking_2,
      coeftest_purpose_2,
      coeftest_resent_2,
      coeftest_regiment_2
      
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
    model_civilians_2,
    model_help_seeking_2,
    model_purpose_2,
    model_resent_2,
    model_regiment_2
  ), 
  stars = numeric(0),
  custom.note = "Regressions Across Outcomes adjusted for race, gender, enlisted status, service era, prior combat deployment, number of deployments, and service branch. "
)



if (clustering == '3-cluster'){
  table_length <- 14
  skip_length <- 38
} else if(clustering == '2-cluster'){
  table_length <- 12
  skip_length <- 36
}



results_table <- c(read_lines(table)[1:table_length], read_lines(gof_stats, skip = skip_length)[c(1,4,5,6,7,8,9,10)])
results_table %>% print()
# Write -------------------------------------------------------------------
write_lines(x = results_table,
            file = paste0(here::here(), '/output/tables/full-tables-', clustering, '.txt'))

append_results_tables(results_table)
rm(results_table)
