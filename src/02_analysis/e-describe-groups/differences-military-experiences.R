

data %>% 
  select(sex_male,
         sexual_orientation_straight,
         race_black,
         race_white,
         enlisted, 
         discharge_medical, discharge_other, 
         branch_air_force, branch_army, branch_marines, branch_navy,
         service_era_post_911, service_era_persian_gulf, service_era_vietnam,
         military_exp_combat, 
         pc_ptsd_positive_screen,
         mios_screener,
         disability,
         latent_group) %>% 
  group_by(latent_group) %>% 
  summarise(across(everything(), ~ sum(.x) / n()),
             n = n()) %>% mutate(perc = c(1)) %>% 
  bind_rows(


data %>% 
  select(sex_male,
         sexual_orientation_straight,
         race_black,
         race_white,
         enlisted, 
         discharge_medical, discharge_other, 
         branch_air_force, branch_army, branch_marines, branch_navy,
         service_era_post_911, service_era_persian_gulf, service_era_vietnam,
         military_exp_combat, 
         pc_ptsd_positive_screen,
         mios_screener,
         disability,
         latent_group) %>% 
  summarise(across(where(is.numeric), ~ sum(.x) / n()),
             n = n()) %>% 
  mutate(perc = c(1), latent_group = 'Total'),


) %>% mutate(across(where(is.numeric), ~ round(.x, 2))) %>% 
  select(perc, everything()) %>% 
  arrange(perc) %>% 
  slice(2,1,3,4,6,5,7,8) %>% 
  t() %>% 
  kableExtra::kbl(format = 'latex')


