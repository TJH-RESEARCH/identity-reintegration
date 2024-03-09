


# Explore Differences in Military Experiences -----------------------------
data %>% 
  group_by(latent_group) %>% 
  summarize(n = n(), 
            perc_enlist = mean(enlisted),
            m_rank_num = mean(highest_rank_numeric),
            m_yrs_serv = mean(years_service), 
            m_yrs_sep = mean(years_separation),
            perc_dis_med = mean(discharge_medical),
            perc_dis_oth = mean(discharge_other),
            n_enlist = sum(enlisted),
            n_dismed = sum(discharge_medical),
            n_disoth = sum(discharge_other)
         )



prop.test(x = c(116, 103), n = c(133, 113)) # Enlisted
prop.test(x = c(45, 24), n = c(133, 113)) # Enlisted
prop.test(x = c(9, 19), n = c(133, 113)) # Enlisted
prop.test(x = c(4, 8), n = c(133, 113)) # Enlisted
aov(years_separation ~ latent_group, data) %>% broom::tidy()
aov(years_service ~ latent_group, data) %>% broom::tidy()
aov(n_deploy ~ latent_group, data) %>% broom::tidy()

# PTSD and Moral Injury ---------------------------------------------------
data %>% 
  group_by(latent_group) %>% 
  summarize(n = n(), 
            perc_ptsd = sum(pc_ptsd_positive_screen) / n(),
            perc_mios = mean(mios_screener),
            perc_va = mean(disability)
  )




# Military Experiences ----------------------------------------------------
data %>% 
  group_by(latent_group) %>% 
  summarize(n = n(), 
            m_n_depl = mean(n_deploy),
            perc_combat = mean(military_exp_combat),
            perc_noncmt = mean(military_exp_noncombat),
            perc_support = mean(military_exp_support),
            perc_pk = mean(military_exp_peacekeeping),
            n_combat = sum(military_exp_combat),
            n_noncmt = sum(military_exp_noncombat),
            n_support = sum(military_exp_support),
            n_pk = sum(military_exp_peacekeeping)
  )

# -------------------------------------------------------------------------
aov(n_deploy     ~ latent_group, data) %>% summary()

t.test(n_deploy ~ latent_group, data =
         data %>% filter(latent_group != 'Lower ID')
) %>% broom::tidy()

t.test(n_deploy ~ latent_group, data =
         data %>% filter(latent_group != 'Middle ID')
) %>% broom::tidy()

t.test(n_deploy ~ latent_group, data =
         data %>% filter(latent_group != 'Higher ID')
) %>% broom::tidy()


prop.test(x = c(13, 28, 28), n = c(49, 69, 128))  %>% broom::tidy()  # Combat
prop.test(x = c(16, 44, 62), n = c(49, 69, 128))  %>% broom::tidy()  # Non Combat 
prop.test(x = c(8, 27, 23), n = c(49, 69, 128))  %>% broom::tidy()  # Support
prop.test(x = c(6, 17, 13), n = c(49, 69, 128))  %>% broom::tidy()  # Peacekeeping


# Service Era -------------------------------------------------------------
data %>% 
  group_by(latent_group) %>% 
  summarize(n = n(), 
            perc_post911 = mean(service_era_post_911),
            perc_gulf = mean(service_era_persian_gulf),
            perc_vietnam = mean(service_era_vietnam),
            n_post911 = sum(service_era_post_911),
            n_gulf = sum(service_era_persian_gulf),
            n_vietnam = sum(service_era_vietnam),
            m_age = mean(years_of_age)
  )

# -------------------------------------------------------------------------
prop.test(x = c(16, 27, 33), n = c(49, 69, 128))  %>% broom::tidy()  # 9/11
prop.test(x = c(12, 26, 35), n = c(49, 69, 128))  %>% broom::tidy()  # Gulf 
prop.test(x = c(14, 24, 58), n = c(49, 69, 128))  %>% broom::tidy()  # Vietnam



# Branch -------------------------------------------------------------
data %>% 
  group_by(latent_group) %>% 
  summarize(n = n(), 
            perc_army = mean(branch_army),
            perc_air = mean(branch_air_force),
            perc_nav = mean(branch_navy),
            perc_mar = mean(branch_marines),
            n_army = sum(branch_army),
            n_air = sum(branch_air_force),
            n_nav = sum(branch_navy),
            n_mar = sum(branch_marines)
            
  )

# -------------------------------------------------------------------------
prop.test(x = c(8, 10), n = c(69, 49))  %>% broom::tidy()  # Air - Higher-Lower
prop.test(x = c(10, 24), n = c(49, 128))  %>% broom::tidy()  # Air - Lower-Middle
prop.test(x = c(8, 24), n = c(69, 128))  %>% broom::tidy()  # Air - Middle-Higher

prop.test(x = c(31, 21), n = c(69, 49))  %>% broom::tidy()  # Army - Higher-Lower
prop.test(x = c(21, 65), n = c(49, 128))  %>% broom::tidy()  # Army - Lower-Middle
prop.test(x = c(31, 65), n = c(69, 128))  %>% broom::tidy()  # Army - Middle-Higher

prop.test(x = c(9, 3), n = c(69, 49))  %>% broom::tidy()  # Marines - Higher-Lower
prop.test(x = c(3, 9), n = c(49, 128))  %>% broom::tidy()  # Marines - Lower-Middle
prop.test(x = c(9, 9), n = c(69, 128))  %>% broom::tidy()  # Marines - Middle-Higher

prop.test(x = c(22, 16), n = c(69, 49))  %>% broom::tidy()  # Navy - Higher-Lower
prop.test(x = c(16, 30), n = c(49, 128))  %>% broom::tidy()  # Navy - Lower-Middle
prop.test(x = c(22, 39), n = c(69, 128))  %>% broom::tidy()  # Navy - Middle-Higher


