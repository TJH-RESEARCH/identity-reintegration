
cluster_size <-
  bind_cols(
    data_1 %>% count(cluster_k2_label) %>% mutate(perc_1_k2 = n / sum(n) * 100) %>% rename(n_1_k2 = n) %>% add_case(cluster_k2_label = "Medium Identity"),
    data_1 %>% count(cluster_k3_label) %>% mutate(perc_1_k3 = n / sum(n) * 100) %>% rename(n_1_k3 = n) %>% select(-1),
    data_2 %>% count(cluster_k2_label) %>% mutate(perc_2_k2 = n / sum(n) * 100) %>% rename(n_2_k2 = n) %>% add_case(cluster_k2_label = "Medium Identity") %>% select(-1),
    data_2 %>% count(cluster_k3_label) %>% mutate(perc_2_k3 = n / sum(n) * 100) %>% rename(n_2_k3 = n) %>% select(-1)
  ) %>% 
    slice(1,3,2)

# Print to console  
cluster_size %>% print()
  
# Write to file
cluster_size %>% write_csv(here::here("output/cluster-size.csv"))
