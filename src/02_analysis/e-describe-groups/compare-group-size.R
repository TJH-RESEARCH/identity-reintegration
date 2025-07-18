


data %>% count(kmeans_cluster_2) %>% mutate(perc = n / sum(n) * 100)
data %>% count(kmeans_cluster_3) %>% mutate(perc = n / sum(n) * 100)



