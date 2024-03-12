


# MCARM  ----------------------------------------------
pairs_mcarm <-
  data %>% 
  select(
    mcarm_purpose_connection,
    mcarm_help_seeking,
    mcarm_beliefs_about_civilians,
    mcarm_resentment_regret,
    mcarm_regimentation,
    mcarm_total
  ) %>% 
  GGally::ggpairs(title = 'Pair Plots: Military Identity')

pairs_mcarm %>% print()

ggsave(plot = pairs_mcarm, filename = here::here('output/figures/pairs-mcarm.jpg'))
rm(pairs_mcarm)

# Warrior Identity Scale  ----------------------------------------------
pairs_wis <-
  data %>% 
  select(
    wis_connection_total,
    wis_interdependent_total,
    wis_centrality_total,
    wis_family_total,
    wis_private_regard_total,
    wis_public_regard_total,
    wis_skills_total,
    mcarm_total
  ) %>% 
  GGally::ggpairs(title = 'Pair Plots: Military Identity')

pairs_wis %>% print()

ggsave(plot = pairs_wis, filename = here::here('output/figures/pairs-wis.jpg'))
rm(pairs_wis)



