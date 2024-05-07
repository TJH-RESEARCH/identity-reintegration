---
contributors:
  - Thomas J. Hodges
---

# To Do

 
# Replication Code: Comparing Reintegration by Military Identity Clusters: High and Low Military Identity Associated with Worse Post-Service Adjustment



## Overview

The code in R Project allows for the replication of tables, figures, stats, graphs, and results used in Comparing Reintegration by Military Identity Clusters: High and Low Military Identity Associated with Worse Post-Service Adjustment


## Data Availability and Provenance

This paper uses original data collected by the first author as part of a **survey** administered in 2023 to United States military veterans (Hodges, 2023). A limited data set from that survey is provided in this file, allowing for the complete replication of the findings in this manuscript. 


## Licensing
- This analysis code is openly licensed via [CC0](https://creativecommons.org/publicdomain/zero/1.0/). It is in the public domain. 
- The replication data is openly licensed via [CC BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/4.0/). You may adapt the data by performing additional analysis or creating new variable derived by existing variables. To use the data, you must provide attribution (i.e., proper citation). Also, the data can only be used for non-commercial purposes. Any derivatives of the data must also be openly licensed via CC BY-NC-SA. To cite the data set: Hodges, T.J. (2024). "Replication Data for Comparing Reintegration by Military Identity Clusters: High and Low Military Identity Associated with Worse Post-Service Adjustment" Data Set.


## Computational requirements
To replicate the analysis, run the entire `0-replicate.R` script.  

Replicating this code will require a recent version of R (version 4.4.0 or later). You can download R from https://cran.rstudio.com

If you already have R installed, running the "`renv/activate.R`" will download the dependent packages. It relies on the `renv` package, which you can read about at https://rstudio.github.io/renv/. This script is run as a part of the "replicate.R" file which runs the entire project. 

The code was last run on a **Apple M1 Chip MacBook Air MacOS version Sonoma 14.2.1**. On this machine, the entire replication took about 4 minutes. The bulk of that time (~ 3 minutes) is spent on `kmeans.R` which conducts a bootstrap and calculates several resource-intensive fit metrics.  


## Description of programs/code

There are three groups of programs in this project. The first configures the project (for instance, by setting a standard theme for visualizations). The second analyzes the data. Data preparation was performed separately.

The data analysis scripts are ordered in seven stages: desciptives, graphic modelling, psychometrics, examining variables, modelling, ionterpreting results, and robustness analysis.  


| Folder                                | File                              | Purpose                                                 |
|---------------------------------------|-----------------------------------|---------------------------------------------------------|
| src/                                  | 0-replicate.R                     | Runs all of the scripts. Replicates analysis.           |
| src/01_config                         | themes.R                          | Set the style of visualizations.                        |
| src/01_config                         | session-info.R                    | Saves the session information.                          |
| src/01_config                         | create-output-folders.R           | Configures the output folders to save results in.       |
| src/01_config/functions               | function-append-results.R         | Helper function to add latex results tables to a log.   |
| src/01_config/functions               | function-count-percentage.R       | Helper function to make demographic tables.             |
| src/01_config/functions               | function-percentage-tables.R      | Helper function to make demographic tables.             |
| src/01_config/functions               | function-plot-lm.R                | Plots regression diagnostics used in plot-diagnostics.R |
| src/02_analysis/a-describe-sample     | sample-size.R                     | Calculates sample size for each version of data set.    |
| src/02_analysis/a-describe-sample     | demographics.R                    | Creates a basic demographics table and latex code.      |
| src/02_analysis/a-describe-sample     | military-demographics.R           | Creates a military demographics table and latex code.   |
| src/02_analysis/b-graphic-modelling   | draw-dags.R                       | Plot directed acyclical graphs and adjustment sets.     |
| src/02_analysis/c-examine-measures    | cfa-mcarm.R                       | Analyze psychometrics for the MCARM.                    |
| src/02_analysis/c-examine-measures    | cfa-wis.R                         | Analyze psychometrics for the Warrior Identity Scale.   |
| src/02_analysis/d-create-groups       | kmeans.R                          | Analyzes and creates k-means clustering groups.         |
| src/02_analysis/e-describe-groups     | compare-group-size.R              | Compares the sizes of the clusters.                     |
| src/02_analysis/e-describe-groups     | differences-identity.R            | Compares the clusters by identity variables.            |
| src/02_analysis/e-describe-groups     | differences-military-experiences.R| Compares the clusters by military experiences.          |
| src/02_analysis/e-describe-groups     | differences-reintegration.R       | Compares the clusters by reintegration.                 |
| src/02_analysis/e-describe-groups     | visualize-clusters.R              | Plots differences in clusters by military identity.     |
| src/02_analysis/f-examine-variables   | descriptive-continuous-wis.R      | Prints summary table/latex for the WIS variables.       |
| src/02_analysis/f-examine-variables   | descriptive-continuous.R          | Prints summary table/latex for the continuous variables.|
| src/02_analysis/f-examine-variables   | plot-pairs.R                      | Creates paired plots of continuous variables.           |
| src/02_analysis/g-modelling           | fit-models.R                      | Specify and fits regression models to data.             |
| src/02_analysis/g-modelling           | model-diagnostics.R               | Creates diagnostic plots for regression models.         |
| src/02_analysis/g-modelling           | calculate-robust-se.R             | Calculates Huber-White standard errors & runs coeftest. |
| src/02_analysis/h-interpret-results   | make-results-tables-mcarm.R       | Creates latex tables of regression results.             |
| src/02_analysis/h-interpret-results   | make-results-tables-full.R        | Creates latex tables of regression results.             |
| src/02_analysis/h-interpret-results   | make-results-tables-bivariate.R   | Creates latex tables of regression results.             |
| src/02_analysis/h-interpret-results   | visualize-coefficients.R          | Plots coefficients and standard errors.                 |
| src/02_analysis/h-interpret-results   | visualize-clusters-reintegration.R| Plots clusters by reintegration measures.               |



The provided code reproduces:

- All numbers provided in text of the paper and supplemental material
- The underlying data for the tables and figures in the paper and supplemental material.


## References

Hodges, Thomas. 2023. “Moral Injury, Identity Dissonance, and Reintegration: A Compendium of Reintegration and Survey of United States Military Veterans.” Kennesaw State University. https://digitalcommons.kennesaw.edu/incmdoc_etd/52.



---

## Acknowledgements


This README document was inspired by the template  [available here](https://github.com/social-science-data-editors/template_README/blob/master/template-README.md).


