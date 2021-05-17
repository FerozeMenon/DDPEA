if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, rvest, lubridate, janitor, data.table, hrbrthemes)
m100 = read_html("http://en.wikipedia.org/wiki/Men%27s_100_metres_world_record_progression")
m100
pre_iaaf =
  m100 %>%
  html_element("div+ .wikitable :nth-child(1)") %>% ## select table element
  html_table() ## convert to data frame
pre_iaaf

pacman::p_load(tidyverse, httr, lubridate, hrbrthemes, janitor, jsonlite, fredr, 
               listviewer, usethis)

nyc_trees =
  fromJSON("https://data.cityofnewyork.us/resource/uvpi-gqnh.json") %>%
  as_tibble()
nyc_trees


nyc_trees %>%
  select(longitude, latitude, stump_diam, spc_common, spc_latin, tree_id) %>%
  mutate_at(vars(longitude:stump_diam), as.numeric) %>%
  ggplot(aes(x=longitude, y=latitude, size=stump_diam)) +
  geom_point(alpha=0.5) +
  scale_size_continuous(name = "Stump diameter") +labs(
    x = "Longitude", y = "Latitude",
    title = "Sample of New York City trees",
    caption = "Source: NYC Open Data"
  )