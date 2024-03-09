
# -------------------------------------------------------------------------
source(here::here('src/01_config/functions/function-append-results.R'))


table <- 
  texreg::texreg(
    list(
      coeftest_help_seeking_1,
      coeftest_help_seeking_2
      
    ), 
    stars = 0,
    custom.note = 'Standard error in parentheses. Bold indicates p less than .05.',
    bold = .05,
    #reorder.coef = c(1,2,5,4,3,7,8,9,10,11,6),
    #custom.model.names = c('WIS 1', '2', '3', 'BIIS 1','2', '3', '4'),
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
    caption = paste("Regressions: Help Seeking", str_to_upper(str_remove(string = analysis, pattern ='variables/')), " Analysis"), 
    caption.above = T
  )


# Grab the Goodness of Fit Statistics -------------------------------------

gof_stats <- texreg::texreg(
  list(
    model_help_seeking_1,
    model_help_seeking_2
  ), 
  stars = 0,
  custom.note = 'Standard error in parentheses. Bold indicates p less than .05.',
  bold = .05,
  caption = "Regressions on Help Seeking", 
  caption.above = T
)


x = c(read_lines(table)[1:26], read_lines(gof_stats, skip = 26))
# Write -------------------------------------------------------------------
write_lines(x = x,
            file = paste0(here::here(), '/output/tables/help-seeking-tables-', analysis, '.txt'))

append_results_tables(x)
rm(x)
