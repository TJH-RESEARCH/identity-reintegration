# DESCRIPTIVE STATISTICS

## This script creates correlation tables, runs descriptives, 
## binds the results together, formats the table, then prints
## and saves a copy to a file. 



# Create Correlation Table ------------------------------------------

continuous_table <-
  data %>% 
  select(mcarm_total, 
         mcarm_purpose_connection,
         mcarm_help_seeking,
         mcarm_beliefs_about_civilians,
         mcarm_resentment_regret,
         mcarm_regimentation,
         n_deploy,
         disability_percent,
         years_separation) %>% 
  
  corrr::correlate() %>% 
  
  bind_cols(
    data %>% 
      select(mcarm_total, 
             mcarm_purpose_connection,
             mcarm_help_seeking,
             mcarm_beliefs_about_civilians,
             mcarm_resentment_regret,
             mcarm_regimentation,
             n_deploy,
             disability_percent,
             years_separation) %>% 
      psych::describe() %>% 
      tibble() %>% 
      select(mean, sd, min, max, skew, kurtosis) 
  ) %>%
  mutate(across(where(is.numeric), \(x) round(x, 2))) %>% 
  select(term, mean, sd, min, max, everything()) %>% 
  rename(M = mean, 
         SD = sd,
         Min = min,
         Max = max,
         # Replace column names with numbers
         `1` = mcarm_total, 
         `2` =  mcarm_purpose_connection,
         `3` = mcarm_help_seeking,
         `4` = mcarm_beliefs_about_civilians,
         `5` = mcarm_resentment_regret,
         `6` = mcarm_regimentation,
         `7` = n_deploy,
         `8` = disability_percent,
         `9` = years_separation
  )


# Print:
continuous_table %>% print()
continuous_table %>% kableExtra::kbl()


# Write file --------------------------------------------------------------
continuous_table %>% kableExtra::kbl(format = 'latex') %>% 
  write_file(here::here('output/tables/continuous-table-latex.txt'))
continuous_table %>% kableExtra::kbl(format = 'latex') %>%
  append_results_tables()
continuous_table %>% write_csv(paste0(here::here(), '/output/tables/continuous-table', clustering, '.csv'))



# Remove variable from environment
rm(continuous_table)

# Message
message('Descriptive table of cotinuous variables saved to `output/tables/continuous-table.csv`')


