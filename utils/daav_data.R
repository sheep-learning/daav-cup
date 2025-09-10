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
  rename(Name = `What name do you go by in the discord?`,
         League = `What is the Highest league you have reached?`) %>%
  select(-c(1,3)) %>%
  filter(Bracket != '') %>%
  mutate(across(Ace:Spectre, 
                ~ case_match(., 
                             "Don't have/cannot upgrade" ~ "NULL",
                             .default = .))) %>%
  mutate(Team = case_match(Name, 
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
  Colour = case_match(Name, 
                      teams$`Team Jango`     ~ 'lightgreen',
                      teams$`Team Jon`       ~ 'orange',
                      teams$`Team Tattoo`    ~ 'magenta',
                      teams$`Team Chungus`   ~ 'gold',
                      teams$`Team Mo`        ~ 'skyblue',
                      teams$`Team Jane`      ~ 'red3',
                      teams$`Team Kalaginho` ~ 'royalblue',
                      teams$`Team Zest`      ~ 'forestgreen',
                      teams$`Team Daav`      ~ 'darkgrey'
  ), .after = 1) %>%
  arrange(Bracket, Team)

save.image('utils/vars/team_data.RData')
