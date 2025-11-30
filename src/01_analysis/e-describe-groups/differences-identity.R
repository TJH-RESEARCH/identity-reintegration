


# What comprises these clusters? ------------------------------------------
data %>% 
  select(starts_with('wis') & ends_with('total') | cluster) %>% 
  group_by(cluster) %>% 
  summarise(n = n(), across(everything(), ~ mean(.x)))

data %>% 
  select(starts_with('wis') & ends_with('total') | cluster) %>% 
  group_by(cluster) %>% 
  summarise(across(everything(), ~ sd(.x)))

data %>% 
  select(starts_with('wis') & ends_with('total') | cluster) %>% 
  select(!wis_total) %>% 
  pivot_longer(cols = !c(cluster)) %>% 
  ggplot(aes(y = factor(cluster), x = value)) +
  geom_boxplot() +
  facet_wrap(~name) +
  ggtitle('Identity Measures of Hierarchical Cluster Groups') +
  ylab('Hierachical Cluster') +
  xlab('Score')





