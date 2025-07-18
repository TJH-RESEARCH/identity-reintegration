

# There are models using the WIS in the literature

## I want to use the coefficients of these models to predict 
## outcomes for my own sample, with the idea that identity should be a wash. 
## Because some aspects predict good outcomes, some predict bad, but they tend
## to correlate within individuals. 
## So what can we practically expect? THat someone with high identity in general
## will score highly on the aspects of identity and that these, including 
## the good ones and bad ones will cancel each other out in areas related
## to reintegration and wellbeing.



# Social Connection -------------------------------------------------------
## From Flack and Kite
# Coefficients:
# private = .30
# Public = .19
# Connection = .21
# Interdependence = -.23
# Family = -.24
# Centrality = -.15


data <-
  data %>% 
  mutate(
    predicted_social_connection_fk = 
      wis_private_regard_total * .30 + 
      wis_public_regard_total * .19 +
      wis_connection_total * .21 +
      wis_interdependent_total * -.23 + 
      wis_family_total * -.24 + 
      wis_centrality_total * -.15
  )




# Ruben and LaPiere -------------------------------------------------------
data <-
  data %>% 
  mutate(
    predicted_ptsd_symptoms_rl =
      wis_private_regard_total * -.37 + 
      wis_public_regard_total * .44 +
      wis_connection_total * -.03 +
      wis_family_total * .37 + 
      wis_centrality_total * -.14
    # wis_interdependent_total * .01 + # Is this "commitment"? Low coefficient doesnt affect much to levae in or out
    # Identity exploration? * .04
  )


data <-
  data %>% 
  mutate(
    predicted_depression_rl = 
      wis_private_regard_total * -.39 + 
      wis_public_regard_total * -.14 +
      wis_connection_total * -.18 +
      wis_family_total * .24 + 
      wis_centrality_total * .12 #+
    # wis_interdependent_total * .14 + # Is this "commitment"? Low coefficient doesnt affect much to levae in or out
    # Identity exploration? * 07
  )


data <-
  data %>% 
  mutate(
    predicted_social_support_rl = 
      wis_private_regard_total * .38 + 
      wis_public_regard_total * .18 +
      wis_connection_total * .08 +
      wis_family_total * -.19 + 
      wis_centrality_total * -.05
    # wis_interdependent_total * .01 + # Is this "commitment"? Low coefficient doesnt affect much to levae in or out
    # Identity exploration? * -.06
  )



data <-
  data %>% 
  mutate(
    predicted_suicidal_ideation_rl = 
      wis_private_regard_total * -.31 + 
      wis_public_regard_total * .01 +
      wis_connection_total * -.17 +
      wis_family_total * .26 + 
      wis_centrality_total * .13
    #wis_interdependent_total * .01 + # Is this "commitment"? Low coefficient doesnt affect much to levae in or out
    # Identity exploration? * .09
  )




data <-
  data %>% 
  mutate(
    predicted_life_satisfaction_rl = 
      wis_private_regard_total * .22 + 
      wis_public_regard_total * .13 +
      wis_connection_total * .15 +
      wis_family_total * -.25 + 
      wis_centrality_total * -.11
    #wis_interdependent_total * .03 + # Is this "commitment"? Low coefficient doesnt affect much to levae in or out
    # Identity exploration? * -.02
  )


data <-
  data %>% 
  mutate(
    predicted_anxiety_rl = 
      wis_private_regard_total * -.31 + 
      wis_public_regard_total * .06 +
      wis_connection_total * -.15 +
      wis_family_total * .43 + 
      wis_centrality_total * .01
    #wis_interdependent_total * .13 + # Is this "commitment"? Low coefficient doesnt affect much to levae in or out
    # Identity exploration? * -.03
  )



data <-
  data %>% 
  mutate(
    predicted_stress_rl = 
      wis_private_regard_total * -.27 + 
      wis_public_regard_total * -.06 +
      wis_connection_total * -.13 +
      wis_family_total * .39 + 
      wis_centrality_total * .05
    #wis_interdependent_total * .11 + # Is this "commitment"? Low coefficient doesnt affect much to levae in or out
    # Identity exploration? * .11
  )








data %>% 
  ggplot(aes(predicted_social_connection_fk, y = cluster)) + 
  scale_y_discrete(limits = c('Higher Identity', "Medium Identity", "Lower Identity")) +
  geom_boxplot()

data %>% 
  ggplot(aes(predicted_social_support_rl, y = cluster)) + 
  scale_y_discrete(limits = c('Higher Identity', "Medium Identity", "Lower Identity")) +
  geom_boxplot()

data %>% 
  ggplot(aes(predicted_ptsd_symptoms_rl, y = cluster)) + 
  scale_y_discrete(limits = c('Higher Identity', "Medium Identity", "Lower Identity")) +
  geom_boxplot() + geom_point(position = 'jitter', 
                              aes(color = factor(pc_ptsd_positive_screen))) +
  labs(color = 'PC-PTSD-5 Detection')

data %>% 
  ggplot(aes(predicted_depression_rl, y = cluster)) + 
  scale_y_discrete(limits = c('Higher Identity', "Medium Identity", "Lower Identity")) +
  geom_boxplot()




