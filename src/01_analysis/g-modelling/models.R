# Reorder factors to make Middle Identity the Reference Group
data_1 <- data_1 %>% mutate(cluster_k3_label = fct_relevel(cluster_k3_label, "Medium Identity"))
data_2 <- data_2 %>% mutate(cluster_k3_label = fct_relevel(cluster_k3_label, "Medium Identity"))

# Identity Constructs ----------------------------------------------------------

## Centrality
mcarm_s1_centrality <- data_1 %>% lm(mcarm_total ~ wis_centrality_total, .)
mcarm_s1_centrality %>% summary()
mcarm_s1_centrality_adj <- data_1 %>% lm(mcarm_total ~ wis_centrality_total + race_white + race_black + sex_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s1_centrality_adj %>% summary()

mcarm_s2_centrality <- data_2 %>% lm(mcarm_total ~ wis_centrality_total, .)
mcarm_s2_centrality %>% summary()
mcarm_s1_centrality_adj <- data_2 %>% lm(mcarm_total ~ wis_centrality_total + race_white + race_black + gender_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s1_centrality_adj %>% summary()


## connection
mcarm_s1_connection <- data_1 %>% lm(mcarm_total ~ wis_connection_total, .)
mcarm_s1_connection %>% summary()
mcarm_s1_connection_adj <- data_1 %>% lm(mcarm_total ~ wis_connection_total + race_white + race_black + sex_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s1_connection_adj %>% summary()

mcarm_s2_connection <- data_2 %>% lm(mcarm_total ~ wis_connection_total, .)
mcarm_s2_connection %>% summary()
mcarm_s1_connection_adj <- data_2 %>% lm(mcarm_total ~ wis_connection_total + race_white + race_black + gender_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s1_connection_adj %>% summary()


## Military as Family
mcarm_s1_family <- data_1 %>% lm(mcarm_total ~ wis_family_total, .)
mcarm_s1_family %>% summary()
mcarm_s1_family_adj <- data_1 %>% lm(mcarm_total ~ wis_family_total + race_white + race_black + sex_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s1_family_adj %>% summary()

mcarm_s2_family <- data_2 %>% lm(mcarm_total ~ wis_family_total, .)
mcarm_s2_family %>% summary()
mcarm_s2_family_adj <- data_2 %>% lm(mcarm_total ~ wis_private_regard_total + race_white + race_black + gender_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s2_family_adj %>% summary()


## Interdependence
mcarm_s1_interdependent <- data_1 %>% lm(mcarm_total ~ wis_interdependent_total, .)
mcarm_s1_interdependent %>% summary()
mcarm_s1_interdependent_adj <- data_1 %>% lm(mcarm_total ~ wis_interdependent_total + race_white + race_black + sex_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s1_interdependent_adj %>% summary()

mcarm_s2_interdependent <- data_2 %>% lm(mcarm_total ~ wis_interdependent_total, .)
mcarm_s2_interdependent %>% summary()
mcarm_s2_interdependent_adj <- data_2 %>% lm(mcarm_total ~ wis_private_regard_total + race_white + race_black + gender_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s2_interdependent_adj %>% summary()


## Private Regard
mcarm_s1_private <- data_1 %>% lm(mcarm_total ~ wis_private_regard_total, .)
mcarm_s1_private %>% summary()
mcarm_s1_private_adj <- data_1 %>% lm(mcarm_total ~ wis_private_regard_total + race_white + race_black + sex_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s1_private_adj %>% summary()

mcarm_s2_private <- data_2 %>% lm(mcarm_total ~ wis_private_regard_total, .)
mcarm_s2_private %>% summary()
mcarm_s2_private_adj <- data_2 %>% lm(mcarm_total ~ wis_private_regard_total + race_white + race_black + gender_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s2_private_adj %>% summary()


## Public Regard
mcarm_s1_public <- data_1 %>% lm(mcarm_total ~ wis_public_regard_total, .)
mcarm_s1_public %>% summary()
mcarm_s1_public_adj <- data_1 %>% lm(mcarm_total ~ wis_public_regard_total + race_white + race_black + sex_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s1_public_adj %>% summary()

mcarm_s2_public <- data_2 %>% lm(mcarm_total ~ wis_public_regard_total, .)
mcarm_s2_public %>% summary()
mcarm_s2_public_adj <- data_2 %>% lm(mcarm_total ~ wis_public_regard_total + race_white + race_black + gender_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s2_public_adj %>% summary()


# Clusters ----------------------------------------------------------------

## Sample 1, K = 2
mcarm_s1_k2 <- data_1 %>% lm(mcarm_total ~ cluster_k2_label, .)
mcarm_s1_k2 %>% summary()
mcarm_s1_k2_adj <- data_1 %>% lm(mcarm_total ~ cluster_k2_label + race_white + race_black + sex_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s1_k2_adj %>% summary()

## Sample 1, K = 3 
mcarm_s1_k3 <- data_1 %>% lm(mcarm_total ~ cluster_k3_label, .)
mcarm_s1_k3 %>% summary()
mcarm_s1_k2_adj <- data_1 %>% lm(mcarm_total ~ cluster_k3_label + race_white + race_black + sex_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s1_k2_adj %>% summary()

## Sample 2, K = 2
mcarm_s2_k2 <- data_2 %>% lm(mcarm_total ~ cluster_k2_label, .)
mcarm_s2_k2 %>% summary()
mcarm_s2_k2_adj <- data_2 %>% lm(mcarm_total ~ cluster_k2_label + race_white + race_black + gender_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s2_k2_adj %>% summary()

## Sample 2, K = 3 
mcarm_s2_k3 <- data_2 %>% lm(mcarm_total ~ cluster_k3_label, .)
mcarm_s2_k3 %>% summary()
mcarm_s2_k3_adj <- data_2 %>% lm(mcarm_total ~ cluster_k3_label + race_white + race_black + gender_male + enlisted + service_era_post_911 + service_era_vietnam +  service_era_persian_gulf + military_exp_combat + n_deploy + branch_air_force + branch_marines + branch_navy, .)
mcarm_s2_k3_adj %>% summary()







