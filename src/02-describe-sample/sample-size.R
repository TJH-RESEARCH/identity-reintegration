

# This is one observation per respondent, 
# so count the rows in each table to get the sample size:

n <- 
  tibble(
    sample = c(1:2),
    n = c(nrow(data_1), nrow(data_2))
    )

print(n)

n %>% write_csv(here::here('output/sample-size.csv'))
