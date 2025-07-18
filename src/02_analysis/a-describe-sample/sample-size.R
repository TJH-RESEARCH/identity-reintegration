

n <- tibble(n = nrow(data))


print(n)
n %>% write_csv(here::here('output/stats/sample-size.csv'))


# Message -----------------------------------------------------------------
message('Sample size saved to `output/stats/sample-size.csv`')

rm(n)
