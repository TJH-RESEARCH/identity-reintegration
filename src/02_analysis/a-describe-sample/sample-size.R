

n <- tibble(n = nrow(data))


print(n)
n %>% kableExtra::kbl()

n %>% write_csv(here::here('output/stats/sample-size.csv'))


# Message -----------------------------------------------------------------
message('Sample size saved to `output/stats/sample-size.csv`')

rm(n)
