cars_df <- tibble::tibble(
  # Day 1
  day1_top = c('SSS Thor',
               'SSS Glamour',
               'SSS Time Machine',
               'SSS Thor',
               'SSS Glamour',
               'SS Atomic',
               'SS Glamour'),
  
  day1_mid = c('SSS Glamour',
               'SSS Samurai',
               'SSS Wild West',
               'SSS Glamour',
               'SSS Comet',
               'SS Bandit',
               'SS Minni'),
  
  day1_bot = c('SSS Fang',
               'SSS Glamour',
               'SSS Fang',
               'SSS Predator',
               'SS Thor',
               'SS Atomic',
               'SS Tofu'),
  
  ###############################################
  
  # Day 2
  day2_top =  c('SSS Merlin',
                'SSS Horizon',
                'SSS Comet',
                'SS Fang',
                'SSS Glamour',
                'SSS Thor',
                'SS Tofu'),
  
  day2_mid = c('SSS Taxi',
               'SSS Coupe',
               'SSS  Leap',
               'SSS Mamba',
               'SSS Time Machine',
               'SSS Maverick',
               'SS Hornet'),
  
  day2_bot = c('SS Rodeo',
               'SSS Conqueror',
               'SSS Thor',
               'SSS Coupe',
               'SS Maverick',
               'SSS Mamba',
               'SS Minni'),
  
  ###############################################
  
  # Day 3
  day3_top = c('SSS Minni',
               'SSS Time Machine',
               'SSS Wingman',
               'SSS Glamour',
               'SSS Chinese Van',
               'SS Satin',
               'S Kobra'),
  
  day3_mid = c('SSS Tofu',
               'SSS Samurai',
               'SSS Thor',
               'SSS Thor',
               'SSS Time Machine',
               'SSS Time Machine',
               'SS Ghost'),
  
  day3_bot = c('SSS Thor',
               'SSS Minni',
               'SSS Thor',
               'SSS Minni',
               'SSS Glamour',
               'SS Leap',
               'S Merlin'),
  
  ###############################################
  
  # Day 4
  day4_top = c('SSS Expedition',
               'SSS Time Machine',
               'SSS Fire Arrow',
               'SSS Hopper',
               'SSS Thor',
               'SS Safari',
               'SS Agent'),
  
  day4_mid = c('SSS Time Machine',
               'SSS Krystal Ship',
               'SSS Fang',
               'SSS Tow Truck',
               'S Duster',
               'SS Agent',
               'SS Tofu'),
  
  day4_bot = c('SSS Predator',
               'SSS Conqueror',
               'SSS Thor',
               'SSS Predator',
               'SS Conqueror',
               'SS Krystal Ship',
               'SS Krystal Ship'),
  
  ###############################################
  
  # Day 5
  day5_top = c('SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum'),
  
  day5_mid = c('SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum'),
  
  day5_bot = c('SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum',
               'SSS ur mum')
)
  
save(cars_df, file="utils/vars/cars_df.RData")
