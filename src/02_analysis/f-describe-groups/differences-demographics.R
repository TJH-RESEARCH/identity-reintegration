
# Explore Demographic Differences -----------------------------------------

data %>% 
  group_by(latent_group) %>% 
  summarize(n = n(), 
            perc_male = mean(sex_male),
            n_male    = sum(sex_male),
            perc_str8 = mean(sexual_orientation_straight),
            n_str8    = sum(sexual_orientation_straight),
            perc_white = mean(race_white),
            n_white = sum(race_white),
            perc_black = mean(race_black),
            n_black = sum(race_black),
            m_age = mean(years_of_age),
            sd_age = sd(years_of_age)
  )
