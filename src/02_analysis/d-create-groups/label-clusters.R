

if(clustering == '3-cluster') {
  data <- data %>% mutate(cluster = kmeans_cluster_3)
  data <-
    data %>% 
    mutate(cluster = 
             factor(cluster, 
                    levels = c(1,3,2),
                    labels = c('Lower Identity', 
                               'Medium Identity',
                               'Higher Identity'))
    )
} else if (clustering == '2-cluster') {
  data <- data %>% mutate(cluster = kmeans_cluster_2)
  data <-
    data %>% 
    mutate(cluster = 
             factor(cluster, 
                    levels = c(1,2),
                    labels = c('Higher Identity',
                               'Lower Identity'))
    )
  
}
