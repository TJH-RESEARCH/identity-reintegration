library(tidyLPA)

# Sample 1 ---------------------------------------------------------------------
lpa_1 <-
  data_1 %>%
  select(starts_with("wis") & ends_with("total") & !wis_total & !wis_skills_total) %>%
  scale() %>%
  estimate_profiles(n_profiles = 2:5, 
                    models = c(1,2,3,6)) %>%
  compare_solutions(statistics = c("AIC", "BIC"))

lpa_1

# Fit profiles
lpa_1_m3n2 <-
  data_1 %>%
  select(starts_with("wis") & ends_with("total") & !wis_total & !wis_skills_total) %>%
  scale() %>% 
  estimate_profiles(models = 3, n_profiles = 2)

lpa_1_m3n5 <-
  data_1 %>%
  select(starts_with("wis") & ends_with("total") & !wis_total & !wis_skills_total) %>%
  scale() %>% 
  estimate_profiles(models = 3, n_profiles = 5)


## Compare class balance
tidyLPA::get_data(lpa_1_m3n2) %>% count(Class)
tidyLPA::get_data(lpa_1_m3n5) %>% count(Class)



# 3-2
tidyLPA::get_data(lpa_1_m3n2) %>% 
  pivot_longer(cols = c(starts_with("wis"))) %>% 
  mutate(name = str_remove(name, "wis_"),
         name = str_remove(name, "_total")
         ) %>% 
  mutate(Class = factor(Class)) %>% 
  ggplot(aes(name, value, color = Class, shape = Class)) +
  geom_jitter(size = 1, height = .1, alpha = .5) +
  geom_boxplot(size = 1, alpha = 0) +
  ggsci::scale_color_aaas() +
  theme(legend.position = "none")

ggsave(here::here("output/lpa_m3m3.jpg"), height = 5, width = 8)






# 3-5
tidyLPA::get_data(lpa_1_m3n5) %>% 
  pivot_longer(cols = c(starts_with("wis"))) %>% 
  mutate(name = str_remove(name, "wis_"),
         name = str_remove(name, "_total")
  ) %>% 
  mutate(Class = factor(Class)) %>% 
  ggplot(aes(name, value, color = Class, shape = Class)) +
  geom_jitter(size = 1, height = .1, alpha = .5) +
  geom_boxplot(size = 1, alpha = 0) +
  ggsci::scale_color_aaas() +
  theme(legend.position = "none")

ggsave(here::here("output/lpa_1_m3_n5.jpg"), height = 5, width = 8)









# Sample 2 ---------------------------------------------------------------------
lpa_2 <-
  data_2 %>%
  select(starts_with("wis") & ends_with("total") & !wis_total & !wis_skills_total) %>%
  scale() %>%
  estimate_profiles(n_profiles = 2:5, 
                    models = c(1,2,3,6)) %>%
  compare_solutions(statistics = c("AIC", "BIC"))


# Fit profiles
lpa_2_m3n5 <-
  data_2 %>%
  select(starts_with("wis") & ends_with("total") & !wis_total & !wis_skills_total) %>%
  scale() %>% 
  estimate_profiles(models = 3, n_profiles = 5)


# Fit profiles
lpa_2_m3n3 <-
  data_2 %>%
  select(starts_with("wis") & ends_with("total") & !wis_total & !wis_skills_total) %>%
  scale() %>% 
  estimate_profiles(models = 3, n_profiles = 3)


# 3-5
tidyLPA::get_data(lpa_2_m3n5) %>% 
  pivot_longer(cols = c(starts_with("wis"), mcarm_total)) %>% 
  mutate(name = str_remove(name, "wis_"),
         name = str_remove(name, "_total")
  ) %>% 
  mutate(Class = factor(Class)) %>% 
  ggplot(aes(name, value, color = Class, shape = Class)) +
  geom_jitter(size = 1, height = .1, alpha = .5) +
  geom_boxplot(size = 1, alpha = 0) +
  ggsci::scale_color_aaas() +
  theme(legend.position = "none")

ggsave(here::here("output/lpa_2_m3_n5.jpg"), height = 5, width = 8)



# 3-3
tidyLPA::get_data(lpa_2_m3n3) %>% 
  pivot_longer(cols = c(starts_with("wis"), mcarm_total)) %>% 
  mutate(name = str_remove(name, "wis_"),
         name = str_remove(name, "_total")
  ) %>% 
  mutate(Class = factor(Class)) %>% 
  ggplot(aes(name, value, color = Class, shape = Class)) +
  geom_jitter(size = 1, height = .1, alpha = .5) +
  geom_boxplot(size = 1, alpha = 0) +
  ggsci::scale_color_aaas() +
  theme(legend.position = "none")

ggsave(here::here("output/lpa_2_m3_n3.jpg"), height = 5, width = 8)
