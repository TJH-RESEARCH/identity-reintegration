
# -------------------------------------------------------------------------
source(here::here('src/01_config/functions/function-append-results.R'))


table <- 
  texreg::texreg(
    list(
      coeftest_mcarm_1,
      coeftest_civilians_1,
      coeftest_help_seeking_1,
      coeftest_purpose_1,
      coeftest_resent_1,
      coeftest_regiment_1
      
    ), 
    stars = 0,
    custom.note = 'Standard error in parentheses. Bold indicates p less than .05.',
    bold = .05,
    #reorder.coef = c(1,2,5,4,3,7,8,9,10,11,6),
    custom.model.names = c('Total', 'Civs', 'HS', 'Purp','Resent', 'Regiment'),
    #custom.coef.names = c('(Intercept)', #1
    #                      'MI Symptoms',    #2
    #                      'Combat',  
    #                      'Probable PTSD',            
    #                      'MI Event',
    #                      'Military Identity', 
    #                      'Officer',        
    ##                      'Black (Race)',   
    ##                      'White (Race)',   
    #                      'Male (Gender)',  
    #                      'Years of Service'
    #),
    caption = paste("Regressions: All Outcomes", str_to_upper(analysis), " Analysis"), 
    caption.above = T
  )


# Grab the Goodness of Fit Statistics -------------------------------------

gof_stats <- texreg::texreg(
  list(
    model_mcarm_1,
    model_civilians_1,
    model_help_seeking_1,
    model_purpose_1,
    model_resent_1,
    model_regiment_1
  ), 
  stars = 0,
  custom.note = 'Standard error in parentheses. Bold indicates p less than .05.',
  bold = .05,
  caption = "Regressions Across Outcomes", 
  caption.above = T
)


x = c(read_lines(table)[1:14], read_lines(gof_stats, skip = 14))
# Write -------------------------------------------------------------------
write_lines(x = x,
            file = paste0(here::here(), '/output/tables/results-tables-', analysis, '.txt'))

append_results_tables(x)
rm(x)
  