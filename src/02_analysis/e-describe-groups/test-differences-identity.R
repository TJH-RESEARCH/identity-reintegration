

# -------------------------------------------------------------------------
aov(wis_centrality_total     ~ latent_group, data) %>% summary()

t.test(wis_centrality_total ~ latent_group, data =
         data %>% filter(latent_group != 'Lower ID')
) %>% broom::tidy()

t.test(wis_centrality_total ~ latent_group, data =
         data %>% filter(latent_group != 'Middle ID')
) %>% broom::tidy()

t.test(wis_centrality_total ~ latent_group, data =
         data %>% filter(latent_group != 'Higher ID')
) %>% broom::tidy()


# -------------------------------------------------------------------------
aov(wis_connection_total     ~ latent_group, data) %>% summary()

t.test(wis_connection_total ~ latent_group, data =
         data %>% filter(latent_group != 'Lower ID')
) %>% broom::tidy()

t.test(wis_connection_total ~ latent_group, data =
         data %>% filter(latent_group != 'Middle ID')
) %>% broom::tidy()

t.test(wis_connection_total ~ latent_group, data =
         data %>% filter(latent_group != 'Higher ID')
) %>% broom::tidy()

# -------------------------------------------------------------------------
aov(wis_family_total     ~ latent_group, data) %>% summary()

t.test(wis_family_total ~ latent_group, data =
         data %>% filter(latent_group != 'Lower ID')
) %>% broom::tidy()

t.test(wis_family_total ~ latent_group, data =
         data %>% filter(latent_group != 'Middle ID')
) %>% broom::tidy()

t.test(wis_family_total ~ latent_group, data =
         data %>% filter(latent_group != 'Higher ID')
) %>% broom::tidy()


# -------------------------------------------------------------------------
aov(wis_interdependent_total     ~ latent_group, data) %>% summary()

t.test(wis_interdependent_total ~ latent_group, data =
         data %>% filter(latent_group != 'Lower ID')
) %>% broom::tidy()

t.test(wis_interdependent_total ~ latent_group, data =
         data %>% filter(latent_group != 'Middle ID')
) %>% broom::tidy()

t.test(wis_interdependent_total ~ latent_group, data =
         data %>% filter(latent_group != 'Higher ID')
) %>% broom::tidy()



# -------------------------------------------------------------------------
aov(wis_public_regard_total     ~ latent_group, data) %>% summary()

t.test(wis_public_regard_total ~ latent_group, data =
         data %>% filter(latent_group != 'Lower ID')
) %>% broom::tidy() # No difference

t.test(wis_public_regard_total ~ latent_group, data =
         data %>% filter(latent_group != 'Middle ID')
) %>% broom::tidy()

t.test(wis_public_regard_total ~ latent_group, data =
         data %>% filter(latent_group != 'Higher ID')
) %>% broom::tidy()


# -------------------------------------------------------------------------
aov(wis_private_regard_total     ~ latent_group, data) %>% summary()

t.test(wis_private_regard_total ~ latent_group, data =
         data %>% filter(latent_group != 'Lower ID')
) %>% broom::tidy()

t.test(wis_private_regard_total ~ latent_group, data =
         data %>% filter(latent_group != 'Middle ID')
) %>% broom::tidy()

t.test(wis_private_regard_total ~ latent_group, data =
         data %>% filter(latent_group != 'Higher ID')
) %>% broom::tidy()


# -------------------------------------------------------------------------
aov(wis_skills_total     ~ latent_group, data) %>% summary()

t.test(wis_skills_total ~ latent_group, data =
         data %>% filter(latent_group != 'Lower ID')
) %>% broom::tidy()

t.test(wis_skills_total ~ latent_group, data =
         data %>% filter(latent_group != 'Middle ID')
) %>% broom::tidy()

t.test(wis_skills_total ~ latent_group, data =
         data %>% filter(latent_group != 'Higher ID')
) %>% broom::tidy()

