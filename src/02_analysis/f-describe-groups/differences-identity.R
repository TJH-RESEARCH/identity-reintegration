


# What comprises these clusters? ------------------------------------------
data %>% 
  select(starts_with('wis') & ends_with('total') | latent_group) %>% 
  group_by(latent_group) %>% 
  summarise(n = n(), across(everything(), ~ mean(.x)))

data %>% 
  select(starts_with('wis') & ends_with('total') | latent_group) %>% 
  group_by(latent_group) %>% 
  summarise(across(everything(), ~ sd(.x)))

data %>% 
  select(starts_with('wis') & ends_with('total') | latent_group) %>% 
  select(!wis_total) %>% 
  pivot_longer(cols = !c(latent_group)) %>% 
  ggplot(aes(y = factor(latent_group), x = value)) +
  geom_boxplot() +
  facet_wrap(~name) +
  ggtitle('Identity Measures of Hierarchical Cluster Groups') +
  ylab('Hierachical Cluster') +
  xlab('Score')





