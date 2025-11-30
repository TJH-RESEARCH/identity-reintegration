


# Which NBClust agorithms indicate better fit with higher vs. lower values -----

higher_is_better <- c(
  "ch", "ccc", "kl", "silhouette", "ball", "ptbiserial",
  "ratkowsky", "mcclain", "gamma", "gplus", "tau",
  "frey", "friedman", "dunn", "hubert", "sdindex", "duda", "gap"
)

lower_is_better <- c(
  "aic", "bic", "caic", "hq", "hartigan", "tracew",
  "db", "sdbw", "sd", "s_d", "beale", "dindex", "hubert_levin",
  "rubin", "cindex", "pseudot2", "scott", "marriot", "trcovw"
)

# Combine into a named lookup
direction_lookup <- 
  tibble(
    name = c(higher_is_better, lower_is_better),
    direction = c(
      rep("higher", length(higher_is_better)),
      rep("lower",  length(lower_is_better))
  )
)

  
  # Compare Results ---------------------------------------------------------
kmeans_results <-

  ## Combine the k-means results  
  bind_cols(
    kmeans_1$All.index %>% as.data.frame() %>% tibble() %>% 
      mutate(k = c(2:15)) %>% # Add an index row for each cluster solution
      pivot_longer(-k) %>% 
      rename(value_1 = value), # Label sample 1
    
    kmeans_2$All.index %>% as.data.frame() %>% tibble() %>% 
      mutate(k = c(2:15)) %>% # Add an index row for each cluster solution
      pivot_longer(-k) %>% 
      rename(value_2 = value) %>% # Label sample 1
      select(-c(k, name))
  ) %>% 
  
  mutate(name = tolower(name)) %>%
  
  ## merge results with the info on whether higher/lower values indicating better fit 
  left_join(direction_lookup, by = "name")


# Compare 2 and 3 cluster solutions --------------------------------------------
kmeans_compare_2_3 <-
  kmeans_results %>% 
  filter(k %in% c(2, 3)) %>%
  pivot_wider(
    id_cols = c(name, direction),
    names_from = k,
    values_from = c(value_1, value_2),
    names_glue = "k{k}_{.value}"
  ) %>%
  mutate(
    # Sample 1 decision
    best_k_1 = case_when(
      direction == "higher" & k2_value_1 > k3_value_1 ~ 2,
      direction == "higher" & k2_value_1 < k3_value_1 ~ 3,
      direction == "lower"  & k2_value_1 < k3_value_1 ~ 2,
      direction == "lower"  & k2_value_1 > k3_value_1 ~ 3,
      TRUE ~ NA_real_
    ),
    # Sample 2 decision
    best_k_2 = case_when(
      direction == "higher" & k2_value_2 > k3_value_2 ~ 2,
      direction == "higher" & k2_value_2 < k3_value_2 ~ 3,
      direction == "lower"  & k2_value_2 < k3_value_2 ~ 2,
      direction == "lower"  & k2_value_2 > k3_value_2 ~ 3,
      TRUE ~ NA_real_
    )
  ) %>%
  select(
    name, direction,
    k2_value_1, k3_value_1, best_k_1,
    k2_value_2, k3_value_2, best_k_2
  )

# Print to Console
kmeans_compare_2_3 %>% print(n = 30)
kmeans_compare_2_3 %>% count(best_k_1)
kmeans_compare_2_3 %>% count(best_k_2)

# Write to file
bind_cols(
  kmeans_compare_2_3 %>% count(best_k_1) %>% add_case(best_k_1 = NA, n = 0) %>% rename(n_1 = n),
  kmeans_compare_2_3 %>% count(best_k_2) %>% rename(n_2 = n)
  )



