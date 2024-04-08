
# -----------------------1--------------------------------------------------
source(here::here('src/01_config/functions/function-append-results.R'))


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
    custom.coef.names = c('(Intercept)', #1
                          'Lower Identity',    #2
                          'Higher Identity'),
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


results_table <- c(read_lines(table)[1:14], read_lines(gof_stats, skip = 14))
results_table %>% print()
# Write -------------------------------------------------------------------
write_lines(x = results_table,
            file = paste0(here::here(), '/output/tables/bivariate-tables.txt'))

append_results_tables(results_table)
rm(results_table)
  