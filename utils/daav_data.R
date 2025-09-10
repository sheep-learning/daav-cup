rm(list=ls())
library(readr)
library(dplyr)

# Initialise Teams
teams <- tibble(
  `Team Jango`  = c('Jango', 'Bean', 'Skanderberg', 'Strawberry', 'Speedkami', '2bskii', 'Swagzilla'),
  `Team Jon`    = c('JonReremy', 'Yutaaah', 'Bubs', 'Nick CPA', 'D1ZZY', 'Nic', 'Safalada'),
  `Team Tattoo`     = c('Tattoo', 'Fawn', 'Kenny', 'Fallen', 'Kux', 'Enkobo', 'Jackson'),
  `Team Chungus`  = c('Chungus', 'Jhoni', 'Crxzy', 'Tazaky', 'FBR', 'Zuhayer', 'Partly_Sunny'),
  `Team Mo` = c('Mo', 'Tristan', 'Farts', 'Ranger Robert', 'Fletch', 'Zaorn', 'bangstarserve'),
  `Team Jane`   = c('Jane', 'Deke', 'Jrash', 'Luh', 'Jxn', 'snpnirav', 'Bobierto'),
  `Team Kalaginho` = c('Kalaginho', 'KenDan', 'Steefee', 'Nah Id Drift', 'Colrr', 'Sly', 'Bebebalahahaha'),
  `Team Zest`   = c('Zest', 'Kalipr', 'Samurai', 'Thiasma', 'Yogurt', 'Mr Wood', 'Paradox'),
  `Team Daav`   = c('Daav', 'Zenith', 'DC Racer', 'Cassiopea', 'Velox', 'Sokpupt', 'Barebuha')
)

nteams = ncol(teams)
npools = nrow(teams)

# Read and wrangle data
data <- read_csv('data/daavdata.csv') %>%
  rename(Player = `What name do you go by in the discord?`,
         League = `What is the Highest league you have reached?`) %>%
  select(-c(1,3)) %>%
  filter(Bracket != '') %>%
  mutate(across(Ace:Spectre, 
                ~ case_match(., 
                             "Don't have/cannot upgrade" ~ "NULL",
                             .default = .))) %>%
  mutate(Team = case_match(Player, 
                           teams$`Team Jango`     ~ 1,
                           teams$`Team Jon`       ~ 2,
                           teams$`Team Tattoo`    ~ 3,
                           teams$`Team Chungus`   ~ 4,
                           teams$`Team Mo`        ~ 5,
                           teams$`Team Jane`      ~ 6,
                           teams$`Team Kalaginho` ~ 7,
                           teams$`Team Zest`      ~ 8,
                           teams$`Team Daav`      ~ 9
  ),
  Colour = case_match(Player, 
                      teams$`Team Jango`     ~ '#1f613a',
                      teams$`Team Jon`       ~ '#e67e22',
                      teams$`Team Tattoo`    ~ '#cfad00',
                      teams$`Team Chungus`   ~ '#d200d7',
                      teams$`Team Mo`        ~ '#246189',
                      teams$`Team Jane`      ~ '#0000ff',
                      teams$`Team Kalaginho` ~ '#6400a6',
                      teams$`Team Zest`      ~ '#7f0c49',
                      teams$`Team Daav`      ~ '#0dd18c'
  ), .after = 1) %>%
  arrange(Bracket, Team)

save.image('utils/vars/team_data.RData')
