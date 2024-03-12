
# Explore Differences in Reintegration  -----------------------------
data %>% 
  group_by(latent_group) %>% 
  summarize(n = n(), 
            m_mcarm = mean(mcarm_total),
            m_purp = mean(mcarm_purpose_connection),
            m_hlpsk = mean(mcarm_help_seeking),
            m_civs = mean(mcarm_beliefs_about_civilians),
            m_regr = mean(mcarm_resentment_regret),
            m_regm = mean(mcarm_regimentation)
  )



# Any different in variance of outcome across groups? ---------------------
data %>% 
  group_by(latent_group) %>% 
  summarize(n = n(), 
            sd_mcarm = sd(mcarm_total),
            sd_purp = sd(mcarm_purpose_connection),
            sd_hlpsk = sd(mcarm_help_seeking),
            sd_civs = sd(mcarm_beliefs_about_civilians),
            sd_regr = sd(mcarm_resentment_regret),
            sd_regm = sd(mcarm_regimentation)
  )



