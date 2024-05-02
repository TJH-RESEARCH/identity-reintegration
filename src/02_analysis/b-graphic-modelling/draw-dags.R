


# Library -----------------------------------------------------------------
library(ggplot2)
library(dagitty)
library(ggdag)



# 1. Basic DAG ---------------------------------------------------------------
dag_basic <- 
  
  dagify('Reint' ~ 'ID',
         exposure = 'ID', 
         outcome = 'Reint')


ggdag::tidy_dagitty(dag_basic)

coordinates(dag_basic) <- list(
  x = c(ID = 0, Reint = 1),
  y = c(
    Reint = 1,
    ID = 1
  )
)

(plot_basic <-
    ggdag(dag_basic) +
    geom_dag_point(fill = 'white', color = 'white') +
    geom_dag_edges() +
    geom_dag_text(color = 'black', size = 5) +
    theme_dag() +
    labs(title = 'Graphical Model: Basic')
)

ggsave(here::here('output/figures/graphical-models/dag_basic.jpeg'),
       plot = plot_basic)

adjustmentSets(dag_basic)

(plot_basic_adj_set <- 
    ggdag_adjustment_set(dag_basic) + 
    theme_dag() +
    labs(title = 'Graphical Model: Basic')
)



ggsave(here::here('output/figures/graphical-models/dag_basic_adj_set.jpeg'))










# 2. Antecents ---------------------------------------------------------------
dag_2 <- 
  
  dagify('Reint' ~ 'ID' + 'Race' + 'Sex' + 'Officer' + 'Era' + 'Deploy' + 'Branch', 
         'ID' ~ 'Race' + 'Sex'+ 'Officer' + 'Era' + 'Deploy' + 'Branch' + 'Family' + 'YearsSrv',
         'Officer' ~ 'Race' + 'Sex',
         'Deploy' ~ 'YearsSrv',
         exposure = 'ID', 
         outcome = 'Reint')


ggdag::tidy_dagitty(dag_2)

coordinates(dag_2) <- list(
  x = c(ID = 0, YearsSrv = 0, Family = 0, Era = .35, Race = .4, Officer = .5, Branch = .5, Sex = .6, Deploy = .65, Reint = 1),
  y = c(
    Reint = 1,
    Officer = 1.1,
    Family = 1.1,
    Sex = 1.2,
    Race = 1.2,
    ID = 1,
    Branch = .9,
    YearsSrv = .9,
    Era = .8,
    Deploy = .8
  )
)

(plot_dag_2 <-
    ggdag(dag_2) +
    geom_dag_point(fill = 'white', color = 'white') +
    geom_dag_edges() +
    geom_dag_text(color = 'black', size = 5) +
    theme_dag() +
    labs(title = "Graphical Model: Antecedents")
)

ggsave(here::here('output/figures/graphical-models/dag_2.jpeg'),
       plot = plot_dag_2)

adjustmentSets(dag_2)

(plot_dag_2_adj_set <- 
    ggdag_adjustment_set(dag_2) + 
    theme_dag() +
    labs(title = 'Graphical Model')
)

ggsave(here::here('output/figures/graphical-models/dag_2_adj_set.jpeg'))







# 3. Military Experiences  ---------------------------------------------------------------
dag_3 <- 
  
  dagify('Reint' ~ 'ID' + 'Race' + 'Sex' + 'Officer' + 'Era' + 'Deploy' + 'Branch' + 'Needs' + 'Dis' + 'Combat', 
         'ID' ~ 'Race' + 'Sex'+ 'Officer' + 'Era' + 'Deploy' + 'Branch' + 'Combat' + 'Family' + 'YearsSrv',
         'Officer' ~ 'Race' + 'Sex',
         'Needs' ~ 'Dis',
         'Dis' ~ 'Deploy' + 'Combat',
         'Combat' ~  'Era',
         'Deploy' ~ 'YearsSrv',
         exposure = 'ID', 
         outcome = 'Reint')


ggdag::tidy_dagitty(dag_3)

coordinates(dag_3) <- list(
  x = c(ID = 0, YearsSrv = 0, Family = 0,  Era = .16, Race = .4,  Branch = .4, Deploy = .5, Combat = .5, Officer = .5, Sex = .6, Dis = .75, Reint = 1,  Needs = 1),
  y = c(
    Sex = 1.2,
    Race = 1.2,
    Officer = 1.1,
    Family = 1.1,
    Reint = 1,
    ID = 1,
    Branch = .95,
    YearsSrv = .9,
    Deploy = .87,
    Era = .87,
    Needs = .8,
    Dis = .8,
    Combat = .8
  )
)

(plot_dag_3 <-
    ggdag(dag_3) +
    geom_dag_point(fill = 'white', color = 'white') +
    geom_dag_edges() +
    geom_dag_text(color = 'black', size = 5) +
    theme_dag() +
    labs(title = 'Graphical Model: Antecedents & Military Experiences')
)

ggsave(here::here('output/figures/graphical-models/dag_3.jpeg'),
       plot = plot_dag_3)

adjustmentSets(dag_3)

(plot_dag_3_adj_set <- 
    ggdag_adjustment_set(dag_3) + 
    theme_dag() +
    labs(title = 'Adjustment Set')
)

ggsave(here::here('output/figures/graphical-models/dag_3_adj_set.jpeg'))



# Can we adjust for unmet needs without activating backdoor paths? --------
ggdag_adjust(dag_3,var = 'Needs')

ggdag_adjust(dag_3,var = c('Branch', 
                           'Combat', 
                           'Deploy', 
                           'Era', 
                           'Officer',
                           'Race',
                           'Sex'))


ggdag_adjust(dag_3,var = c('Branch', 
                           'Combat', 
                           'Deploy', 
                           'Era', 
                           'Officer',
                           'Race',
                           'Sex',
                           'Needs'))
## No. If years of service causes identity, 
# and years of service also heightens risk for disability
# and disability is related to unmet needs, 
# Then adjusting the model for unmet needs introduces spurious association. 



