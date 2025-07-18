
# CHOOSE GROUPING ---------------------------------------------------------
## Set K-Means 3-cluster as the latent group for the main data analysis
clustering <- '2-cluster'



# DESCRIBE CLUSTERS -------------------------------------------------------

## Rename the groups for interpretation
source(here::here('src/02_analysis/d-create-groups/label-clusters.R'))


## Run the visualization  with the cluster labels:
source(here::here('src/02_analysis/e-describe-groups/visualize-clusters.R'))



source(here::here('src/02_analysis/e-describe-groups/differences-identity.R'))

source(here::here('src/02_analysis/e-describe-groups/differences-military-experiences.R'))
source(here::here('src/02_analysis/e-describe-groups/differences-reintegration.R'))

# EXAMINE VARIABLES -------------------------------------------------------
## Descriptive Statistics
source(here::here('src/02_analysis/f-examine-variables/descriptive-continuous.R'))


## Visualizations
source(here::here('src/02_analysis/f-examine-variables/plot-pairs.R'))



# SPECIFY MODELS ----------------------------------------------------
source(here::here('src/02_analysis/g-modelling/fit-models.R'))
source(here::here('src/02_analysis/g-modelling/model-diagnostics.R'))
source(here::here('src/02_analysis/g-modelling/calculate-robust-se.R'))


# INTERPRET MODELS --------------------------------------------------------
source(here::here('src/02_analysis/h-interpret-results/make-results-tables-bivariate.R'))
source(here::here('src/02_analysis/h-interpret-results/make-results-tables-full.R'))
source(here::here('src/02_analysis/h-interpret-results/make-results-tables-mcarm.R'))
source(here::here('src/02_analysis/h-interpret-results/visualize-coefficients.R'))
source(here::here('src/02_analysis/h-interpret-results/visualize-clusters-reintegration.R'))
