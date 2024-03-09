---
contributors:
  - Thomas J. Hodges
---

# To Do

- Add the Overleaf output and latex to /Doc
- Add the survey instructions, items, and logic to /Doc
- Ensure themes are consistent across project
- licensing
- plot-robustness.R
- save sankey plots - I think screenshots or markdown is needed
 
# Replcation Code: Is Military Identity Helpful or Hurtful in Civilian Life? 


## Overview

The code in R Project allows for the replication of tables, figures, stats, graphs, and results used in Is Military Identity Helpful or Hurtful in Civilian Life? Comparing Reintegration and Adjustment by Latent Groups of Military Identity


## Data Availability and Provenance

This paper uses original data collected by the first author as part of a **survey** administered in 2023 to United States military veterans (Hodges, 2023). Original survey data is available upon reasonable request. A processed copy of the data is included with this replication. 


## Licensing
This project currently has no license. It is protected by copyright.


## Computational requirements
Replicating this code will require a recent version of R (version 4.2.2 or later). You can download R from https://cran.rstudio.com

If you already have R installed, running the "`renv/activate.R`" will download the dependent packages. It relies on the `renv` package, which you can read about at https://rstudio.github.io/renv/. This script is run as a part of the "replicate.R" file which runs the entire project. 

The code was last run on a **Apple M1 Chip MacBook Air MacOS version Sonoma 14.2.1**. 


## Description of programs/code

There are three groups of programs in this project. The first configures the project (for instance, by setting a standard theme for visualizations). The second analyzes the data. Data preparation was performed separately.

The data analysis scripts are ordered in seven stages: desciptives, graphic modelling, psychometrics, examining variables, modelling, ionterpreting results, and robustness analysis.  


| Folder                                | File                              | Purpose                                                 |
|---------------------------------------|-----------------------------------|---------------------------------------------------------|
| src/                                  | replicate.R                       | Runs all of the scripts. Replicates analysis.           |
| src/01_config                         | themes.R                          | Set the style of visualizations.                        |
| src/01_config                         | folder-structure.R                | Configures the output folder.                           |
| src/01_config                         | folder-append-results.R           | Helper function to add regression results to a log.     |
| src/01_config/functions               | function-count-percentage.R       | Helper function to make demographic tables.             |
| src/01_config/functions               | function-percentage-tables.R      | Helper function to make demographic tables.             |
| src/01_config/functions               | function-plot-lm.R                | Plots regression diagnostics used in plot-diagnostics.R |
| src/02_analysis/a-describe-sample     | sample-size.R                     | Calculates sample size for each version of data set.    |
| src/02_analysis/a-describe-sample     | demographics.R                    | Creates a basic demographics table and latex code.      |
| src/02_analysis/a-describe-sample     | military-demographics.R           | Creates a military demographics table and latex code.   |
| src/02_analysis/b-graphic-modelling   | draw-dags.R                       | Plot directed acyclical graphs and adjustment sets.     |
| src/02_analysis/c-examine-measures    | cfa-mcarm.R                       | Calculates and saves Cronbach's alpha for the MIOS.     |
| src/02_analysis/c-examine-measures    | cfa-wis.R                         | Calculates and saves Cronbach's alpha for the SCC.      |
| src/02_analysis/d-create-groups       | hierarchical-clsutering.R         | Analyzes and creates hierarchical clustering groups.    |
| src/02_analysis/d-create-groups       | kmeans.R                          | Analyzes and creates k-means clustering groups.         |
| src/02_analysis/d-create-groups       | lpa.R                             | Analyzes and creates Latent Profile Analysis groups.    |
| src/02_analysis/e-compare-groups      | compare-group-size.R              | Analyzes and creates hierarchical clustering groups.    |
| src/02_analysis/e-compare-groups      | sankey-k3-h2.R                    | Creates a Sankey plot.                                  |
| src/02_analysis/e-compare-groups      | sankey-k3-lpa-k2.R                | Creates a Sankey plot.                                  |
| src/02_analysis/f-describe-groups     | differences-demographics.R        | Compares the latent groups by demographics.             |
| src/02_analysis/f-describe-groups     | differences-identity.R            | Compares the latent groups by identity variables.       |
| src/02_analysis/f-describe-groups     | differences-military-experiences.R| Compares the latent groups by military experiences.     |
| src/02_analysis/f-describe-groups     | differences-reintegration.R       | Compares the latent groups by reintegration.            |
| src/02_analysis/g-examine-variables   | descriptive-categorical.R         | Prints summary table/latex for the categorical variables * |
| src/02_analysis/g-examine-variables   | descriptive-continuous.R          | Prints summary table/latex for the continuous variables |
| src/02_analysis/g-examine-variables   | plot-hypotheses.R                 | Creates bivariate plots of primary variables.           |
| src/02_analysis/g-examine-variables   | plot-pairs.R                      | Creates paired plots of continuous variables.           |
| src/02_analysis/g-examine-variables   | plot-reintegration.R              | Creates histogram and boxplot of reintegration.         |
| src/02_analysis/h-modelling           | fit-models.R                      | Specify and fits regression models to data.             |
| src/02_analysis/h-modelling           | model-diagnostics.R               | Creates diagnostic plots for regression models.         |
| src/02_analysis/h-modelling           | calculate-robust-se.R             | Calculates Huber-White standard errors & runs coeftest. |
| src/02_analysis/i-interpret-results   | make-results-tables-mcarm.R       | Creates latex tables of regression results.             |
| src/02_analysis/i-interpret-results   | make-results-tables-purpose.R     | Creates latex tables of regression results.             |
| src/02_analysis/i-interpret-results   | make-results-tables-regiment.R    | Creates latex tables of regression results.             |
| src/02_analysis/i-interpret-results   | make-results-tables-resent.R      | Creates latex tables of regression results.             |
| src/02_analysis/i-interpret-results   | make-results-tables-help-seeking.R| Creates latex tables of regression results.             |
| src/02_analysis/i-interpret-results   | make-results-tables-civilians.R   | Creates latex tables of regression results.             |
| src/02_analysis/i-interpret-results   | visualize-coefficients.R          | Plots coefficients and standard errors.                 |
| src/02_analysis/i-interpret-results   | visualize-profiles-reintegration.R| Plots group profiles by reintegration measures.         |
| src/02_analysis/g-robustness          | plot-robustness.R                 | Creates visualizations of robustness results.           |



The provided code reproduces:

- All numbers provided in text in the paper and supplemental material
- All tables and figures in the paper and supplemental material
- Additional analyses discussed in the paper conducted in the course of the data analysis.


## References

Hodges, Thomas. 2023. “Moral Injury, Identity Dissonance, and Reintegration: A Compendium of Reintegration and Survey of United States Military Veterans.” Kennesaw State University. https://digitalcommons.kennesaw.edu/incmdoc_etd/52.



---

## Acknowledgements


This README document was inspired by the template  [avaialable here](https://github.com/social-science-data-editors/template_README/blob/master/template-README.md).


