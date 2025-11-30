library(multiverse)
library(lm.beta)


# Standardize variable names ----------------------------------------------
data_1 <- data_1 %>% rename(gender_male = sex_male)


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
             "Family" ~ wis_family_total
             ) +
      
      # Adjustment Sets (Control Variable options)
      branch(controls, 
             "No Controls" ~ NULL,
             "Controls" ~ race_white + race_black + gender_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy
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
results %>%
  filter(str_detect(term, "wis_")) %>% 
  # Fix p value rounding to 0
  mutate(p_text = round(p.value, 3),
         p_text = ifelse(p_text == 0, "<.001", p_text),
         p_text = str_replace_all(p_text, "0\\.", "."),
         # 
         outcome = fct_relevel(outcome, "MCARM Total"),
         controls = fct_relevel(controls, "No Controls")
         ) %>% 
  ggplot(aes(predictors,
             outcome, 
             fill = p.value)) +
  geom_tile(color = "white") +
  facet_wrap(vars(data_set, controls)) +
  geom_text(aes(label = p_text), color = "black", size = 5) +
  scale_fill_viridis_c(direction = -1) +
  scale_fill_gradient(high = "#7e7e7e", low = "white") +
  labs(x = "Predictor", y = "Outcome", title = "Multiverse p-values") +
  theme(
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(face = "bold"),
    axis.text.x = element_text(angle = -90, vjust = .5),
    panel.background =  element_rect(color = "white", fill = "white"),
    panel.border = element_rect(color = "white"),
    strip.background =  element_rect(color = "white", fill = "white"),
    strip.text = element_text(face = "bold"),
    legend.position = "none",
    plot.title = element_text(face = 'bold', size = 18)
  )
  
ggsave(filename = here::here("output/multiverse-p.jpg"), height = 10, width = 10)



# Visualize standardized coefficients ------------------------------------------
results %>%
  filter(str_detect(term, "wis_")) %>% 
  # Fix p value rounding to 0
  mutate(estimate = round(estimate, 2),
         # reorder levels of variables for plotting
         outcome = fct_relevel(outcome, "MCARM Total"),
         controls = fct_relevel(controls, "No Controls")
  ) %>% 
  ggplot(aes(predictors,
             outcome, 
             fill = estimate)) +
  geom_tile(color = "white", alpha = .5) +
  facet_wrap(vars(data_set, controls)) +
  geom_text(aes(label = estimate), color = "black", size = 5) +
  scale_fill_viridis_c(direction = -1) +
  scale_fill_gradient2(midpoint = 0, low = "red", mid = "white", high = "blue") +
  labs(x = "Predictor", y = "Outcome", title = "Multiverse Standardized Coefficients") +
  theme(
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(face = "bold"),
    axis.text.x = element_text(angle = -90, vjust = .5),
    panel.background =  element_rect(color = "white", fill = "white"),
    panel.border = element_rect(color = "white"),
    strip.background =  element_rect(color = "white", fill = "white"),
    strip.text = element_text(face = "bold"),
    legend.position = "none",
    plot.title = element_text(face = 'bold', size = 18)
  )

ggsave(filename = here::here("output/multiverse-estimate.jpg"), height = 10, width = 10)


