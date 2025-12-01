library(multiverse)
library(lm.beta)
library(patchwork)


# Make data_1 names consistent with data_2 names ----------------------------------------------
data_1 <- data_1 %>% rename(gender_male = sex_male, 
                            age = years_of_age, 
                            years_discharged = years_separation,
                            years_served = years_service)


# Standardize ------------------------------------------------------------------
z_score <- function(x){(x - mean(x)) / sd(x)}
data_1 <- 
  data_1 %>% 
  mutate(
    mcarm_purpose_connection = z_score(mcarm_purpose_connection),
    mcarm_help_seeking = z_score(mcarm_help_seeking),
    mcarm_beliefs_about_civilians = z_score(mcarm_beliefs_about_civilians),
    mcarm_resentment_regret = z_score(mcarm_resentment_regret),
    mcarm_regimentation = z_score(mcarm_regimentation),
    mcarm_total = z_score(mcarm_total),
    wis_centrality_total = z_score(wis_centrality_total),
    wis_connection_total = z_score(wis_connection_total),
    wis_family_total = z_score(wis_family_total),
    wis_interdependent_total = z_score(wis_interdependent_total),
    wis_private_regard_total = z_score(wis_private_regard_total),
    wis_public_regard_total = z_score(wis_public_regard_total)
    )

data_2 <- 
  data_2 %>% 
  mutate(
    mcarm_purpose_connection = z_score(mcarm_purpose_connection),
    mcarm_help_seeking = z_score(mcarm_help_seeking),
    mcarm_beliefs_about_civilians = z_score(mcarm_beliefs_about_civilians),
    mcarm_resentment_regret = z_score(mcarm_resentment_regret),
    mcarm_regimentation = z_score(mcarm_regimentation),
    mcarm_total = z_score(mcarm_total),
    wis_centrality_total = z_score(wis_centrality_total),
    wis_connection_total = z_score(wis_connection_total),
    wis_family_total = z_score(wis_family_total),
    wis_interdependent_total = z_score(wis_interdependent_total),
    wis_private_regard_total = z_score(wis_private_regard_total),
    wis_public_regard_total = z_score(wis_public_regard_total)
  )


# Instantiate the multiverse ---------------------------------------------------
M <- multiverse()


# Attach the data --------------------------------------------------------------
inside(M, {df_1 = data_1})
inside(M, {df_2 = data_2})

# Declare the decisions and options for the model
inside(M, {
  
  fit <- 
    lm(
      # Outcome Variable
      branch(outcome, 
             "MCARM Total" ~ mcarm_total,
             "Beliefs about Civilians" ~ mcarm_beliefs_about_civilians,
             "Regimentation" ~ mcarm_regimentation,
             "Regret" ~ mcarm_resentment_regret,
             "Help Seeking" ~ mcarm_help_seeking,
             "Purpose" ~ mcarm_purpose_connection
             ) ~ 
      
      # Independent Variable
      branch(predictors, 
             "Centrality" ~ wis_centrality_total,
             "Connection" ~ wis_connection_total,
             "Public Regard" ~ wis_public_regard_total,
             "Private Regard" ~ wis_private_regard_total,
             "Interdependence" ~ wis_interdependent_total,
             "Family" ~ wis_family_total,
             "WIS" ~ wis_centrality_total + wis_connection_total + wis_public_regard_total + wis_private_regard_total + wis_interdependent_total + wis_family_total
             ) +
      
      # Adjustment Sets (Control Variable options)
      branch(controls, 
             "No contols" ~ NULL, 
             # { Age, Branch, Enlisted, Era, Gender, Race, YrsSep }
             "Likely Antecedents" ~ age + branch_air_force + branch_marines + branch_navy + enlisted + service_era_post_911 + service_era_vietnam + service_era_persian_gulf + gender_male + race_white + race_black + years_discharged,
             # { Age, Branch, Combat, Deploys, Enlisted, Era, Gender, Needs, Race, YrsSep, YrsServ }
             "Potential Antecedents" ~ age + branch_air_force + branch_marines + branch_navy + enlisted + race_white + race_black + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + gender_male + race_white + race_black + years_discharged + military_exp_combat + n_deploy + unmet_needs_any + years_served
             ), 
      data = 
        branch(data_set,
               "Sample 1" ~ df_1,
               "Sample 2" ~ df_2)
    )
})
        
execute_multiverse(M)

# Write the code to summarize the results
inside(M, {
  summary <- lmtest::coeftest(fit, sandwich::vcovHC(fit, type = 'HC1'), save = TRUE) %>% broom::tidy(conf.int = TRUE)
})

execute_multiverse(M)

# Results
results <-
  expand(M) %>% 
  mutate(summary = map(.results, "summary")) %>% 
  unnest(summary)

results %>% names()



# Visualize p values -----------------------------------------------------------
theme_custom <- 
  theme(
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(face = "bold"),
    axis.text.x = element_text(angle = -90, vjust = .5),
    panel.background =  element_rect(color = "white", fill = "white"),
    panel.border = element_rect(color = "white"),
    strip.background =  element_rect(color = "white", fill = "white"),
    strip.text = element_text(face = "bold"),
    legend.position = "none",
    plot.title = element_text(face = 'bold', size = 18),
    plot.subtitle = element_text(face = 'bold', size = 14)
  )

plot_p <-
  results %>%
  filter(controls != "No Controls") %>% 
  filter(predictors != "WIS") %>% 
  filter(str_detect(term, "wis_")) %>% 
  # Fix p value rounding to 0
  mutate(p_text = round(p.value, 3),
         p_text = ifelse(p_text == 0, "<.001", p_text),
         p_text = str_replace_all(p_text, "0\\.", "."),
         # 
         outcome = fct_relevel(outcome, "MCARM Total"),
         controls = fct_relevel(controls, "Likely Antecedents")
         ) %>% 
  ggplot(aes(predictors,
             outcome, 
             fill = p.value)) +
  geom_tile(color = "white") +
  facet_wrap(vars(data_set, controls)) +
  geom_text(aes(label = p_text), color = "white", size = 5) +
  scale_fill_gradient2(midpoint = .25, low = "white", mid = "#4692b0", high = "black") +
  labs(x = "Predictor", y = "Outcome", title = "Multiverse p-values") +
  theme_custom

ggsave(plot_p, filename = here::here("output/multiverse-p.jpg"), height = 10, width = 10)



# Visualize standardized coefficients ------------------------------------------
plot_beta <-
  results %>%
  filter(controls != "No Controls") %>% 
  filter(predictors != "WIS") %>% 
  filter(str_detect(term, "wis_")) %>% 
  # Fix p value rounding to 0
  mutate(estimate = round(estimate, 2),
         # reorder levels of variables for plotting
         outcome = fct_relevel(outcome, "MCARM Total"),
         controls = fct_relevel(controls, "Likely Antecedents")
  ) %>% 
  ggplot(aes(predictors,
             outcome, 
             fill = estimate)) +
  geom_tile(color = "white", alpha = .5) +
  facet_wrap(vars(data_set, controls)) +
  geom_text(aes(label = estimate), color = "black", size = 5) +
  scale_fill_viridis_c(direction = -1) +
  scale_fill_gradient2(midpoint = 0, low = "red", mid = "white", high = "blue") +
  labs(x = "Predictor", y = "Outcome", title = "Multiverse Standardized Coefficients", subtitle = "Single Independent Variable") +
  theme_custom

ggsave(plot_beta, filename = here::here("output/multiverse-estimate.jpg"), height = 10, width = 10)



# Visualize p values -----------------------------------------------------------
# For mutually adjusted WIS
plot_p_wis <- 
  results %>%
  filter(controls != "No Controls") %>% 
  filter(predictors == "WIS") %>% 
  filter(str_detect(term, "wis_")) %>% 
  # Fix p value rounding to 0
  mutate(p_text = round(p.value, 3),
         p_text = ifelse(p_text == 0, "<.001", p_text),
         p_text = str_replace_all(p_text, "0\\.", "."),
         # 
         outcome = fct_relevel(outcome, "MCARM Total"),
         controls = fct_relevel(controls, "Likely Antecedents"),
         term = str_remove_all(term, "wis_"),
         term = str_remove_all(term, "_total"),
         term = str_replace(term, "_r", " R"),
         term = str_to_title(term),
         term = ifelse(term == "Interdependent", "Interdependence", term)
  ) %>% 
  ggplot(aes(term,
             outcome, 
             fill = p.value)) +
  geom_tile(color = "white") +
  facet_wrap(vars(data_set, controls)) +
  geom_text(aes(label = p_text), color = "white", size = 5) +
  scale_fill_gradient2(midpoint = .25, low = "white", mid = "#4692b0", high = "black") +
  labs(x = "Predictor", y = "Outcome", title = "Multiverse p-values") +
  theme_custom
ggsave(plot_p_wis, filename = here::here("output/multiverse-p-wis.jpg"), height = 10, width = 10)

#MetBrewer::MetPalettes$Hokusai2
c("#abc9c8", "#72aeb6", "#4692b0", "#2f70a1", "#134b73", "#0a3351")


# Visualize standardized coefficients ------------------------------------------
# For mutually adjusted WIS
plot_beta_wis <- 
  results %>%
  filter(controls != "No Controls") %>% 
  filter(predictors == "WIS") %>% 
  filter(str_detect(term, "wis_")) %>% 
  # Fix p value rounding to 0
  mutate(estimate = round(estimate, 2),
         # reorder levels of variables for plotting
         outcome = fct_relevel(outcome, "MCARM Total"),
         controls = fct_relevel(controls, "Likely Antecedents"),
         term = str_remove_all(term, "wis_"),
         term = str_remove_all(term, "_total"),
         term = str_replace(term, "_r", " R"),
         term = str_to_title(term),
         term = ifelse(term == "Interdependent", "Interdependence", term)
  ) %>% 
  ggplot(aes(term,
             outcome, 
             fill = estimate)) +
  geom_tile(color = "white", alpha = .5) +
  facet_wrap(vars(data_set, controls)) +
  geom_text(aes(label = estimate), color = "black", size = 5) +
  scale_fill_viridis_c(direction = -1) +
  scale_fill_gradient2(midpoint = 0, low = "red", mid = "white", high = "blue") +
  labs(x = "Predictor", y = "Outcome", subtitle = "Mutually Adjusted") +
  theme_custom

ggsave(plot_beta_wis, filename = here::here("output/multiverse-estimate-wis.jpg"), height = 10, width = 10)


plot_beta / plot_beta_wis + plot_layout(axes = "collect", axis_titles = "collect")
ggsave(filename = here::here("output/multiverse-beta.jpg"), height = 12, width = 10)


plot_p / plot_p_wis + plot_layout(axes = "collect", axis_titles = "collect")
ggsave(filename = here::here("output/multiverse-p.jpg"), height = 12, width = 10)
