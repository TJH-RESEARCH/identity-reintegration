
library(networkD3) # this needs to be installed to plot in javascript


links <-
  data %>% 
  count(hclust_cut_3, lpa) %>% 
  mutate(hclust_cut_3 = paste0('Hierarchical_3_group_', hclust_cut_3),
         lpa = paste0('LPA_3_group_', lpa)) %>% 
  rename(source = 1, target = 2, value = 3) %>% 
  as.data.frame()


# Sankey Plot-------------------------------------------------------------------------





# From these flows we need to create a node data frame: it lists every entities involved in the flow
nodes <- data.frame(
  name=c(as.character(links$source), 
         as.character(links$target)) %>% unique()
)

# With networkD3, connection must be provided using id, not using real name like in the links dataframe.. So we need to reformat it.
links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1

# Make the Network
p <- sankeyNetwork(Links = links, Nodes = nodes,
                   Source = "IDsource", Target = "IDtarget",
                   Value = "value", NodeID = "name", 
                   sinksRight=FALSE)
p



