rm(list=ls())
library(dplyr)
library(magrittr)

getCars <- function(data, match, bracket){
  # find common cars for a given set of players
  test <- data %>%
    filter(Bracket == bracket) %>%
    filter(Team %in% match) %>%
    pivot_longer(cols = Ace:Spectre,
                 names_to = 'Car',
                 values_to = 'Rank') %>%
    pivot_wider(id_cols = -c(Bracket,Team,Colour,League),
                names_from = Name,
                values_from = Rank) %>%
    filter(apply(., 1, function(x) length(unique(x)) == 2),
           .[[2]] != "NULL")
}

getMatchups <- function(data,teams,npools){
  
  # initialisations
  cars <- list()
  n <- c()
  
  for(i in 1:npools){
    # find matches
    tmp <- getCars(data,teams,i)
    # assign to list
    cars[[i]] = paste(tmp[[2]],tmp$Car)
    # assign numbers to vector
    n[i] = nrow(tmp)
  }
  
  # initialise blank df for cars
  matches <- tibble(
    Captains        = rep('',max(n)),
    `Vice Captains` = rep('',max(n)),
    `Pool 3`        = rep('',max(n)),
    `Pool 4`        = rep('',max(n)),
    `Pool 5`        = rep('',max(n)),
    `Pool 6`        = rep('',max(n)),
    `Pool 7`        = rep('',max(n)),
    `Pool 8`        = rep('',max(n)),
    `Pool 9`        = rep('',max(n)),
    `Pool 10`       = rep('',max(n))
  ) %>%
    select(1:npools)
  
  for(i in 1:npools){
    if(n[i] > 0){
      matches[1:n[i],i] <- cars[[i]]
    }
  }
  
  return(matches)
}

getResults <- function(data, team, npools){
  data %>%
    select(Player = names(.[team*2-1]),
           Points = names(.[team*2])) %>%
    mutate(Team = rep(names(data[team*2-1]),npools), .before=1) %>%
    return()
}

getPositions = function(df){
  df %>%
    mutate(Position = case_match(Points,
                                 3 ~ '(1st)',
                                 1 ~ '(2nd)',
                                 0 ~ '(3rd)',
                                 .default = NULL),
           Points = rep(1:npools,nteams)) %>%
    unite('Player', Position, Player, sep=' ') %>%
    pivot_wider(names_from = Team, values_from = Player) %>%
    select(-Points)
}

getSummary <- function(df){
  df %>%
    group_by(Team) %>%
    summarise(Points = sum(Points)) %>%
    arrange(desc(Points)) %>%
    mutate(Rank = 1:nteams, .before=1)
}

getStandings <- function(summary_df, standings){
  inner_join(standings,select(summary_df,-Rank),by='Team') %>%
    mutate(Points = Points.x + Points.y) %>%
    select(-Points.x,-Points.y) %>%
    arrange(desc(Points),Team) %>%
    mutate(Rank = 1:nteams, .before=1)
}

getMVP <- function(mvp, results_df){
  inner_join(mvp,results_df,by='Player') %>%
    mutate(Points = Points.x + Points.y) %>%
    select(-Points.x,-Points.y,-Team) %>%
    arrange(desc(Points)) %>%
    mutate(Rank = 1:(nteams*npools), .before=1)
}

# function for shortening/splitting certain names
cutNames <- function(df){
  mutate(df, Player = case_match(Player,
                                 'JonReremy' ~ 'Jon',
                                 'Skanderberg' ~  'Skander',
                                 'Strawberry' ~ 'Strawb',
                                 'Speedkami' ~ 'Speed',
                                 'Swagzilla' ~ 'Swagz',
                                 'Partly_Sunny' ~ 'Partly Sunny',
                                 'Bangstarserve' ~ 'Bangstar',
                                 'Kalaginho' ~ 'Kalag',
                                 'Kalaghino' ~ 'Kalag',
                                 'AhsokaBee' ~ 'Ahsoka Bee',
                                 'Cassiopea' ~ 'Cassio',
                                 .default = Player),
         Player = case_when(
           nchar(Player) <= 3 ~ str_pad(Player,
                                        width = 4,
                                        side = "right",
                                        pad = "\u00A0"),
           .default = Player))
}

save.image(file='utils/functions/functions.RData')