

library(tidyLPA)x




# Latent Profile Analysis -------------------------------------------------

## 1. A priori decide the max number of profiles can't be higher than 6 -
## that would hamper interpretability, and the whole point of finding
## latent groups is to reduce the 7 measures of military identity
## into something more interpretable. 
## 
## Also, with the best 7 class solution, many of the classes are too small 
## (e.g., n < 10) while others are n = 80

test_lpa <-
  data %>% 
  select(starts_with('wis') & ends_with('total') & !wis_total) %>% 
  scale() %>%
  estimate_profiles(c(2:6),
                  models = c(1,2,3,6),
                  #variances = c('equal', 'varying'),
                  #covariances = c('equal', 'varying'),
                  package = 'mclust') 


# Plot --------------------------------------------------------------------
test_lpa %>% tidyLPA::plot_profiles()

test_lpa %>% tidyLPA::

# Write Fit Data ----------------------------------------------------------
test_lpa %>% tidyLPA::get_fit() %>% write_csv('output/stats/lpa_fits.csv')

test_lpa %>% 
  compare_solutions(statistics = c("AIC", "BIC"))

## Unable to fit 3+ class solution for model 6 (unconstrained).
## Model 4 and 5 require a subscription to MPlus. These were not run, but I am curious to do so. 
## Models 1 and 2 don't fit well -- these are the highly constrained models --
## nor are they assumptions of conditional independence likely to be true.
## So I am only comparing model 3 with varying classes and model 6 with 2 classes.
## Annoyingly, the best fit is model 3 with 2 classes, but group sizes are 
## highly unbalanced thus analytically unhelpful.
## So let's remove that possibility then see what is the best fit:


data %>% 
  select(starts_with('wis') & ends_with('total') & !wis_total) %>% 
  scale() %>%
  estimate_profiles(c(3:6),
                    models = c(1,2,3,6),
                    #variances = c('equal', 'varying'),
                    #covariances = c('equal', 'varying'),
                    package = 'mclust') %>% 
  compare_solutions(statistics = c("AIC", "BIC"))


# Model 6 with two classes is the only LPA I can move forward with
# It had the best BIC (but not AIC) when compared with the model 3, 2 class solution.
# But the model 3, 2 class was the analytic hierarchy process winner, it just
# is not very useful because the extreme imbalance in group size (233 vs. 13). 
# Model 6 3 is also unbalanced, but less extremely so: 76 vs. 170.



# Look at the imbalance in groups for the winning Model 3 2-class solution:  ---------------------------------------------------------
data %>% 
  tidyLPA::estimate_profiles(
    n_profiles = 2,
    models = 3,
    package = 'mclust',
    select_vars = c('wis_centrality_total', 
                    'wis_connection_total',
                    'wis_family_total', 
                    'wis_interdependent_total',
                    'wis_private_regard_total', 
                    'wis_public_regard_total',
                    'wis_skills_total')
  ) %>% tidyLPA::get_data() %>% 
  rename(lpa = Class) %>% count(lpa)



# Apply the best Model 6 2-Factor  ---------------------------------------------------------
fit_lpa <-
  data %>%
  tidyLPA::estimate_profiles(
    n_profiles = 2,
    models = 6,
    package = 'mclust',
    select_vars = c('wis_centrality_total', 
                    'wis_connection_total',
                    'wis_family_total', 
                    'wis_interdependent_total',
                    'wis_private_regard_total', 
                    'wis_public_regard_total',
                    'wis_skills_total')
    )
  
  

# Metrics -----------------------------------------------------------------
fit_lpa %>% tidyLPA::get_fit() %>% write_csv('output/stats/lpa-fit.csv')
fit_lpa %>% tidyLPA::get_estimates()

# Save Latent Profiles ----------------------------------------------------

data <-
  fit_lpa %>% 
  tidyLPA::get_data() %>% 
  rename(lpa = Class)

data %>% count(lpa)



