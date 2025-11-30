
# -------------------------------------------------------------------------
source(here::here('src/01_config/functions/function-append-results.R'))


table <- 
  texreg::texreg(
    list(
      coeftest_mcarm_1,
      coeftest_mcarm_2
      
    ), 
    ci.force = T,
    single.row = T,
    ci.force.level = .95,
    ci.test = NA,
    sideways = F, 
    custom.model.names = c('Bivariate', 'Multivariate'),
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
    caption = paste("Regressions on Reintegration"), 
    caption.above = T
  )


# Grab the Goodness of Fit Statistics -------------------------------------

gof_stats <- texreg::texreg(
  list(
    model_mcarm_1,
    model_mcarm_2
  ), 
  stars = numeric(0),
  custom.note = 'Unstandardized coefficients and 95\\% Confidence Intervals',
  caption = "Regressions on Reinetegration", 
  caption.above = T
)


results_table <- c(read_lines(table)[1:23], read_lines(gof_stats, skip = 38))
results_table %>% print()
# Write -------------------------------------------------------------------
write_lines(x = results_table,
            file = paste0(here::here(), '/output/tables/mcarm-tables-', clustering, '.txt'))

append_results_tables(results_table)
rm(results_table)

