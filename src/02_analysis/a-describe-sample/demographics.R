

# Helper Functions -------------------------------------------------------------
source(here::here('src/01_config/functions/function-percentage-tables.R'))
source(here::here('src/01_config/functions/function-count-percentage.R'))
source(here::here('src/01_config/functions/function-append-results.R'))

# Create Demographic Table -----------------------------------------------------


demographic_table <-
  bind_rows( 
    
    # Age ----------------------------------------------------------------------
    age = 
      data %>% 
      select(age_range) %>% 
      count(age_range) %>% 
      mutate(
        perc = n / sum(n) * 100
        ) %>% 
      rename(category = age_range),
    
    # Sex ----------------------------------------------------------------------
    sex = 
      data %>% 
      group_by(sex) %>% 
      count_perc(sort = T),
    
    # Sexual Orientation -------------------------------------------------------
    sexual_orientation_sample =
      data %>% 
      mutate(sexual_orientation = fct_lump_prop(sexual_orientation, prop = .1)) %>% 
      group_by(sexual_orientation) %>% 
      count_perc(sort = T),
    
    # Education ----------------------------------------------------------------
    education_sample = 
      data %>% 
      group_by(education) %>% 
      count(sort = F) %>% 
      ungroup() %>% 
      mutate(perc = n / sum(n) * 100) %>% 
      rename(category = 1),
    
    # Race ---------------------------------------------------------------------
    race = data %>% group_by(race) %>% count_perc(T),
    
    # Employment Status --------------------------------------------------------
    employment_status = 
      data %>% 
      mutate(employment = fct_lump_prop(employment, prop = .05)) %>% 
      group_by(employment) %>% 
      count(sort = T) %>% 
      ungroup() %>% 
      mutate(perc = n / sum(n) * 100) %>% 
      rename(category = 1),
    
    # Marital Status -----------------------------------------------------------
    marital_status = 
      data %>% 
      group_by(marital) %>% 
      count(sort = T) %>% 
      ungroup() %>% 
      mutate(perc = n / sum(n) * 100) %>% 
      rename(category = 1)
    
  ) %>% 
  mutate(perc = paste(round(perc, 1), "%")) %>% 
  mutate(category = str_to_sentence(category))


demographic_table[1,1] <- "18 to 34 years old"
demographic_table[2,1] <- "35 to 44 years old"
demographic_table[3,1] <- "45 to 54 years old"
demographic_table[4,1] <- "55 to 64 years old"
demographic_table[5,1] <- "65 to 74 years old"
demographic_table[6,1] <- "75 years and older"

demographic_table[10,1] <- "Other sexuality"



# Print -------------------------------------------------------------------
demographic_table %>% print(n = 100)

demographic_table %>% 
  kableExtra::kbl(
    caption = "Table 1: Sample Demographics",
    format = "html",
    col.names = c("Category","n","%"),
    align = "l") %>%
  kableExtra::kable_classic(full_width = F, html_font = "times")

# Save --------------------------------------------------------------------
demographic_table %>% kableExtra::kbl(format = 'latex') %>% 
  write_lines(here::here('output/tables/demographics-latex.txt'))

demographic_table %>% kableExtra::kbl(format = 'latex') %>%
  append_results_tables()

demographic_table %>% readr::write_csv(here::here('output/tables/demographics.csv'))


# Message -----------------------------------------------------------------
message('Demographic table saved to `output/tables/sample-demographics.csv`')

# Clean -------------------------------------------------------------------
rm(count_perc, create_percentage_table, demographic_table)





# Graphs ------------------------------------------------------------------
data %>% ggplot(aes(years_of_age)) + geom_density()
data %>% ggplot(aes(branch)) + geom_bar()
data %>% ggplot(aes(service_era)) + geom_bar()
ggplot(data, aes(x = '', y = 'identity', fill = branch)) + geom_col() + coord_polar(theta = "y")
data %>% ggplot(aes(highest_rank)) + geom_bar()
ggplot(data, aes(x = '', y = 'identity', fill = highest_rank)) + geom_col() + coord_polar(theta = "y")

