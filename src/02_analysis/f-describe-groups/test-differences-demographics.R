
prop.test(x = c(30, 95), n = c(49, 128)) %>% broom::tidy() # male
prop.test(x = c(51, 95), n = c(69, 128)) %>% broom::tidy() # male
prop.test(x = c(51, 30), n = c(69, 49)) %>% broom::tidy() # male


t.test(years_of_age ~ latent_group, data =
         data %>% filter(latent_group != 'Lower ID')
) %>% broom::tidy()

t.test(years_of_age ~ latent_group, data =
         data %>% filter(latent_group != 'Middle ID')
) %>% broom::tidy()

t.test(years_of_age ~ latent_group, data =
         data %>% filter(latent_group != 'Higher ID')
) %>% broom::tidy()



# Paired t-tests: Black ---------------------------------------------------

t.test(race_black ~ latent_group, data =
         data %>% filter(latent_group != 'Lower ID')
) %>% broom::tidy()

t.test(race_black ~ latent_group, data =
         data %>% filter(latent_group != 'Middle ID')
) %>% broom::tidy()

t.test(race_black ~ latent_group, data =
         data %>% filter(latent_group != 'Higher ID')
) %>% broom::tidy()

