


# Years of Separation -----------------------------------------------------
aov(years_separation ~ latent_group, data) %>% broom::tidy() # =
aov(years_separation ~ latent_group, data) %>% TukeyHSD() %>% broom::tidy()

# Years of Service -------------------------------------------------------------------------
aov(years_service ~ latent_group, data) %>% broom::tidy() # !=
aov(years_service ~ latent_group, data) %>% TukeyHSD() %>% broom::tidy()

# Number of Deployments -------------------------------------------------------------------------
aov(n_deploy ~ latent_group, data) %>% broom::tidy()
aov(n_deploy ~ latent_group, data) %>% TukeyHSD() %>% broom::tidy()
pairwise.t.test(x = data$n_deploy, g = data$latent_group) %>% 
  broom::tidy()

# Discharge Medical ----------------------------------------------------------------
prop.test(x = c(15, 8), n = c(128, 49)) %>% broom::tidy() # No diff: Med - Low
prop.test(x = c(5, 15), n = c(5, 128))  %>% broom::tidy() # Diff: High - Med
prop.test(x = c(61, 8), n = c(69, 49))  %>% broom::tidy() # Diff: High - Low

# Enlisted ----------------------------------------------------------------
prop.test(x = c(113, 45), n = c(128, 49)) %>% broom::tidy() # Med - Low
prop.test(x = c(61, 113), n = c(69, 128))  %>% broom::tidy() # High - Med
prop.test(x = c(61, 45), n = c(69, 49))  %>% broom::tidy() # High - Low

# COMBAT-------------------------------------------------------------------------
prop.test(x = c(13, 28, 28), n = c(49, 69, 128), correct = T)  %>% broom::tidy()  # Combat!
prop.test(x = c(28, 28), n = c(69, 128))  %>% broom::tidy()  # Higher - Med !
prop.test(x = c(13, 28), n = c(49, 128))  %>% broom::tidy()  # Lower = Med
prop.test(x = c(13, 28), n = c(49, 69))  %>% broom::tidy()  # Lower - Higher

# SERVICE ERA-------------------------------------------------------------------------
prop.test(x = c(16, 27, 33), n = c(49, 69, 128))  %>% broom::tidy()  # 9/11
prop.test(x = c(27, 33), n = c(69, 128))  %>% broom::tidy()  # 9/11 # Higher - Med
prop.test(x = c(16, 33), n = c(49, 128))  %>% broom::tidy()  # 9/11 # Lower = Med
prop.test(x = c(16, 27), n = c(49, 69))  %>% broom::tidy()  # 9/11  # Lower - Higher

prop.test(x = c(12, 26, 35), n = c(49, 69, 128))  %>% broom::tidy()  # Gulf 
prop.test(x = c(26, 35), n = c(69, 128))  %>% broom::tidy()  # Gulf 
prop.test(x = c(12, 35), n = c(49, 128))  %>% broom::tidy()  # Gulf 
prop.test(x = c(12, 26), n = c(49, 69))  %>% broom::tidy()  # Gulf 

prop.test(x = c(14, 24, 58), n = c(49, 69, 128))  %>% broom::tidy()  # Vietnam
prop.test(x = c(24, 58), n = c(69, 128))  %>% broom::tidy()  # Vietnam Higher-Lower
prop.test(x = c(14, 58), n = c(49, 128))  %>% broom::tidy()  # Vietnam Lower-Middle !
prop.test(x = c(14, 24), n = c(49, 69))  %>% broom::tidy()  # Vietnam Middle-Higher

# BRANCH -------------------------------------------------------------------------
prop.test(x = c(8, 10), n = c(69, 49))  %>% broom::tidy()  # Air - Higher-Lower
prop.test(x = c(10, 24), n = c(49, 128))  %>% broom::tidy()  # Air - Lower-Middle
prop.test(x = c(8, 24), n = c(69, 128))  %>% broom::tidy()  # Air - Middle-Higher

prop.test(x = c(31, 21), n = c(69, 49))  %>% broom::tidy()  # Army - Higher-Lower
prop.test(x = c(21, 65), n = c(49, 128))  %>% broom::tidy()  # Army - Lower-Middle
prop.test(x = c(31, 65), n = c(69, 128))  %>% broom::tidy()  # Army - Middle-Higher

prop.test(x = c(9, 3), n = c(69, 49))  %>% broom::tidy()  # Marines - Higher-Lower. Not sig but too small n
prop.test(x = c(3, 9), n = c(49, 128))  %>% broom::tidy()  # Marines - Lower-Middle
prop.test(x = c(9, 9), n = c(69, 128))  %>% broom::tidy()  # Marines - Middle-Higher Not sig but too small n

prop.test(x = c(22, 16), n = c(69, 49))  %>% broom::tidy()  # Navy - Higher-Lower
prop.test(x = c(16, 30), n = c(49, 128))  %>% broom::tidy()  # Navy - Lower-Middle
prop.test(x = c(22, 39), n = c(69, 128))  %>% broom::tidy()  # Navy - Middle-Higher


