
# -----------1--------------------------------------------------------------
source(here::here('src/01_config/functions/function-append-results.R'))


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
    custom.coef.names = c('(Intercept)', #1
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
                          'Navy'),
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
  custom.note = 'Unstandardized coefficients and 95\\% Confidence Intervals',
  caption = "Regressions Across Outcomes", 
  caption.above = T
)


results_table <- c(read_lines(table)[1:38], read_lines(gof_stats, skip = 38))
results_table %>% print()
# Write -------------------------------------------------------------------
write_lines(x = results_table,
            file = paste0(here::here(), '/output/tables/full-tables-', clustering, '.txt'))

append_results_tables(results_table)
rm(results_table)
