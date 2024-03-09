

source(here::here('src/01_config/functions/function-percentage-tables.R'))
source(here::here('src/01_config/functions/function-count-percentage.R'))

# Categorical --------------------------------------------------------------
 

categorical_table <-
  
  data %>% 
    count(unmet_needs_any) %>% 
    mutate(perc = n / sum(n) * 100) %>% 
    mutate(unmet_needs_any = 
           ifelse(unmet_needs_any == 1, 
                  'One or more unmet needs at transition', 
                  'No unmet needs at transition')) %>% 
    rename(variable = 1) %>% 
  
  bind_rows(
   
    data %>% 
      count(pc_ptsd_positive_screen) %>% 
      mutate(perc = n / sum(n) * 100) %>% 
      mutate(pc_ptsd_positive_screen = 
                ifelse(pc_ptsd_positive_screen == 1, 
                      'Probable PTSD detected', 
                      'Probable PTSD not detected')) %>% 
      rename(variable = 1)
  )



# Print: ----------------------------------------------------------
categorical_table %>% print(n = 100)
categorical_table %>%  
  kableExtra::kbl(
    caption = "Descriptive Statistics for Categorical Variables",
    format = "html",
    col.names = c("Category","n","%"),
    align = "l") %>%
  kableExtra::kable_classic(full_width = F, html_font = "times")


# Latex ----------------------------------------------------------

categorical_table %>%  
  kableExtra::kbl(
    caption = "Descriptive Statistics for Categorical Variables",
    format = "latex",
    col.names = c("Category","n","%"),
    align = "l") %>% 
  write_file(here::here('output/tables/categorical-table-latex.txt'))

categorical_table %>% kableExtra::kbl(format = 'latex') %>%
  append_results_tables()


# Write file --------------------------------------------------------------
categorical_table %>% write_csv(here::here('output/tables/categorical-table.csv'))

# Message
message('Descriptive Table: Cateogrical variables saved to `output/tables/categorical-table.csv`')

# Remove variable from environment
rm(categorical_table)



