

# PACKAGES -----------------------------------------------------------
source(here::here('renv/activate.R'))
library(tidyverse)


# CONFIGURE --------------------------------------------------------
source(here::here('src/01_config/create-output-folders.R'))
source(here::here('src/01_config/functions/function-append-results.R'))


# DATA SET MANAGEMENT -----------------------------------------------------------
## Clean the data
data_original <- read_csv(here::here('data/processed/data_original.csv'))

data <- data_original %>% filter(dataset_main == 1)
analysis <- c('main') # this is a label for the analysis 'main' later 'robust'


# DESCRIBE SAMPLE ----------------------------------------------------------
source(here::here('src/02_analysis/a-describe-sample/sample-size.R'))
source(here::here('src/02_analysis/a-describe-sample/demographics.R'))
source(here::here('src/02_analysis/a-describe-sample/military-demographics.R'))


# GRAPHIC MODELLING --------------------------------------------------------
source(here::here('src/02_analysis/b-graphic-modelling/draw-dags.R'))


# EXAMINE MEASURES ----------------------------------------------------
## Reintegration
source(here::here('src/02_analysis/c-examine-measures/cfa-mcarm.R'))

## Military Identity 
source(here::here('src/02_analysis/c-examine-measures/cfa-wis.R'))


# CLUSTER ANALYSIS --------------------------------------------------------
## Hierarchical Clustering
source(here::here('src/02_analysis/d-create-groups/hierarchical-clustering.R'))
## Latent Profile Analysis
source(here::here('src/02_analysis/d-create-groups/lpa.R'))
## K-Means
source(here::here('src/02_analysis/d-create-groups/kmeans.R'))


# COMPARE LATENT GROUPINGS ------------------------------------------------
## Analyze to Choose the Grouping for the Main Analysis
source(here::here('src/02_analysis/e-compare-groups/compare-group-size.R'))
source(here::here('src/02_analysis/e-compare-groups/sankey-k3-h3.R'))
source(here::here('src/02_analysis/e-compare-groups/sankey-k3-lpa.R'))
source(here::here('src/02_analysis/e-compare-groups/sankey-k3-k2.R'))
source(here::here('src/02_analysis/e-compare-groups/sankey-h3-lpa.R'))

# CHOOSE GROUPING ---------------------------------------------------------
## Set K-Means 3-cluster as the latent group for the main data analysis
data <- 
  data %>% mutate(latent_group = kmeans_cluster_3)


# DESCRIBE CLUSTERS -------------------------------------------------------

source(here::here('src/02_analysis/f-describe-groups/visualize-profiles.R'))

## Rename the groups for interpretation
data <-
  data %>% 
  mutate(
    latent_group = 
      case_when(latent_group == 1 ~ 'Middle ID',
                latent_group == 2 ~ 'Lower ID',
                latent_group == 3 ~ 'Higher ID')
  ) %>% 
  # refactor reference level
  mutate(latent_group = 
           factor(latent_group, 
                  levels = c('Middle ID', 'Lower ID', 'Higher ID'))
         )


source(here::here('src/02_analysis/f-describe-groups/differences-identity.R'))
source(here::here('src/02_analysis/f-describe-groups/differences-demographics.R'))
source(here::here('src/02_analysis/f-describe-groups/differences-military-experiences.R'))
source(here::here('src/02_analysis/f-describe-groups/differences-reintegration.R'))

# EXAMINE VARIABLES -------------------------------------------------------
## Descriptive Statistics
source(here::here('src/02_analysis/g-examine-variables/descriptive-categorical.R'))
source(here::here('src/02_analysis/g-examine-variables/descriptive-continuous.R'))

## Visualizations
source(here::here('src/02_analysis/g-examine-variables/plot-pairs.R'))
source(here::here('src/02_analysis/g-examine-variables/plot-hypotheses.R'))


# SPECIFY MODELS ----------------------------------------------------
source(here::here('src/02_analysis/h-modelling/fit-models.R'))
source(here::here('src/02_analysis/h-modelling/model-diagnostics.R'))
source(here::here('src/02_analysis/h-modelling/calculate-robust-se.R'))


# INTERPRET MODELS --------------------------------------------------------
make_tables <- function(T){
source(here::here('src/02_analysis/i-interpret-results/make-results-tables-mcarm.R'))
source(here::here('src/02_analysis/i-interpret-results/make-results-tables-civilians.R'))
source(here::here('src/02_analysis/i-interpret-results/make-results-tables-purpose.R'))
source(here::here('src/02_analysis/i-interpret-results/make-results-tables-resent.R'))
source(here::here('src/02_analysis/i-interpret-results/make-results-tables-regiment.R'))
source(here::here('src/02_analysis/i-interpret-results/make-results-tables-help-seeking.R'))
  source(here::here('src/02_analysis/i-interpret-results/make-results-tables-bivariate.R'))
  source(here::here('src/02_analysis/i-interpret-results/make-results-tables-full.R'))
  message('Tables made.')
}
make_tables()
source(here::here('src/02_analysis/i-interpret-results/visualize-coefficients.R'))
source(here::here('src/02_analysis/i-interpret-results/visualize-profiles-reintegration.R'))


# ROBUST ANALYSIS ---------------------------------------------------------
## Re-run the analysis using alternative latent groups


# ROBUSTNESS: K-MEANS 2 CLUSTER -------------------------------------------
data <- data %>% mutate(latent_group = kmeans_cluster_2)
analysis <- c('robust - kmeans 2-cluster')
## Describe the groups: e.g., which is higher/lower in identity?
source(here::here('src/02_analysis/f-describe-groups/differences-identity.R'))
source(here::here('src/02_analysis/f-describe-groups/visualize-profiles.R'))
source(here::here('src/02_analysis/i-interpret-results/visualize-profiles-reintegration.R'))

## Rename the groups for interpretation
data <-
  data %>% 
  mutate(
    latent_group = 
      case_when(latent_group == 1 ~ 'Higher ID - K1',
                latent_group == 2 ~ 'Lower ID - K2')
  )

## Re-run the models
source(here::here('src/02_analysis/h-modelling/fit-models.R'))
source(here::here('src/02_analysis/h-modelling/model-diagnostics.R'))
source(here::here('src/02_analysis/h-modelling/calculate-robust-se.R'))
make_tables()
source(here::here('src/02_analysis/g-examine-variables/plot-hypotheses.R'))


# ROBUSTNESS: LPA ---------------------------------------------------------
data <- data %>% mutate(latent_group = factor(lpa))
analysis <- c('robust - Latent Profile Analsysis')
## Describe the groups: e.g., which is higher/lower in identity?
source(here::here('src/02_analysis/f-describe-groups/differences-identity.R'))
source(here::here('src/02_analysis/f-describe-groups/visualize-profiles.R'))
source(here::here('src/02_analysis/i-interpret-results/visualize-profiles-reintegration.R'))

## Rename the groups for interpretation
data <-
  data %>% 
  mutate(
    latent_group = 
      case_when(latent_group == 1 ~ 'Lower ID - LPA1',
                latent_group == 2 ~ 'Higher ID - LPA2')
  )

## Re-run the models
source(here::here('src/02_analysis/h-modelling/fit-models.R'))
source(here::here('src/02_analysis/h-modelling/model-diagnostics.R'))
source(here::here('src/02_analysis/h-modelling/calculate-robust-se.R'))
make_tables()
source(here::here('src/02_analysis/g-examine-variables/plot-hypotheses.R'))



# ROBUST: HIERARCHICAL 2-CLUSTER ------------------------------------------
data <- data %>% mutate(latent_group = factor(hclust_cut_3))
analysis <- c('robust - hiararchical 3-cluster')
## Describe the groups: e.g., which is higher/lower in identity?
source(here::here('src/02_analysis/f-describe-groups/differences-identity.R'))
source(here::here('src/02_analysis/f-describe-groups/visualize-profiles.R'))
source(here::here('src/02_analysis/i-interpret-results/visualize-profiles-reintegration.R'))

## Rename the groups for interpretation

data <-
  data %>% 
  mutate(
    latent_group = 
      case_when(latent_group == 1 ~ 'Medium ID - H1',
                latent_group == 2 ~ 'Higher ID - H2',
                latent_group == 3 ~ 'Lower ID - H3')
  )


## Re-run the models

source(here::here('src/02_analysis/h-modelling/fit-models.R'))
source(here::here('src/02_analysis/h-modelling/model-diagnostics.R'))
source(here::here('src/02_analysis/h-modelling/calculate-robust-se.R'))
make_tables()
source(here::here('src/02_analysis/g-examine-variables/plot-hypotheses.R'))



# END ---------------------------------------------------------------------
# Save Session Info
source(here::here('src/01_config/session-info.R'))

message('
        
        
        
        Replication complete. Check the output folder for results. 
        
        To cite this research:
        
        Hodges, T.J. (2024, forthcoming). Is Military Identity Helpful or Hurtful in Civilian Life? Comparing Reintegration and Adjustment by Latent Groups of Military Identity.
        
        
        
        ')

