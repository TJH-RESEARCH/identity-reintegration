# Create the demo table for the manuscript
# by merging the demographics for each sample.

demographic_table <-

  left_join(
    # Label Sample 1
    demographics_1 %>% rename(n_1 = n, perc_1 = perc),
    # and sample 2
    demographics_2 %>% rename(n_2 = n, perc_2 = perc),
    
    # Join by variable and category: 
    by = c("variable" = "variable", "category" = "category")
  ) %>% 
  
  # Several NAs in sample 2 are actually 0s
  mutate(n_2 = ifelse(is.na(n_2), 0, n_2),
         perc_2 = ifelse(is.na(perc_2), 0, perc_2))


# Split into two tables; one with general demographics and another with military demos
general_demos <- c("Age", "Education Level", "Race/Ethnicity", "Gender")
demographics_general <- demographic_table %>% filter(variable %in% general_demos)
demographics_military <- demographic_table %>% filter(!(variable %in% general_demos))
  
# Print to consol
demographics_general %>% print(n = 100)
demographics_military %>% print(n = 100)

# Write to file
demographics_general %>% write_csv(here::here("output/demographics-general.csv"))
demographics_military %>% write_csv(here::here("output/demographics-military.csv"))
