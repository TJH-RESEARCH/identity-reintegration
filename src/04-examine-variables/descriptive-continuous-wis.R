# DESCRIPTIVE STATISTICS

## This script creates correlation tables, runs descriptives, 
## binds the results together, formats the table, then prints
## and saves a copy to a file. 



# Create Correlation Table ------------------------------------------

continuous_table <-
  data %>% 
  select(
         wis_centrality_total,
         wis_connection_total,
         wis_family_total,
         wis_interdependent_total,
         wis_private_regard_total,
         wis_public_regard_total,
         wis_skills_total) %>% 
  
  corrr::correlate() %>% 
  
  bind_cols(
    data %>% 
      select(
             wis_centrality_total,
             wis_connection_total,
             wis_family_total,
             wis_interdependent_total,
             wis_private_regard_total,
             wis_public_regard_total,
             wis_skills_total) %>% 
      psych::describe() %>% 
      tibble() %>% 
      select(mean, sd, min, max) 
  ) %>%
  mutate(across(where(is.numeric), \(x) round(x, 2))) %>% 
  select(term, mean, sd, min, max, everything()) %>% 
  rename(M = mean, 
         SD = sd,
         Min = min,
         Max = max,
         # Replace column names with numbers
         `1` = wis_centrality_total,
         `2` = wis_connection_total,
         `3` = wis_family_total,
         `4` = wis_interdependent_total,
         `5` = wis_private_regard_total,
         `6` = wis_public_regard_total,
         `7` = wis_skills_total
  ) %>% 
  mutate(term = str_replace(term, 'mcarm_', ''),
         term = str_replace(term, 'wis_', ''))
#       term = str_replace(term, 'biis_harmony', 'Identity Dissonance')
#) %>% 
#select(-`3`)


# Print:
continuous_table %>% print()
continuous_table %>% kableExtra::kbl()
continuous_table %>% kableExtra::kbl(format = 'latex') %>% 
  write_file(here::here('output/tables/continuous-table-latex.txt'))


continuous_table %>% kableExtra::kbl(format = 'latex') %>%
  append_results_tables()

# Write file --------------------------------------------------------------
continuous_table %>% write_csv(paste0(here::here(), '/output/tables/continuous-table-', clustering, '.csv'))




# Remove variable from environment
rm(continuous_table)

# Message
message('Descriptive table of cotinuous variables saved to `output/tables/continuous-table.csv`')


