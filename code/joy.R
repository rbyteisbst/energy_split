library(tidyverse)
library(lubridate)
library(ggjoy)
library(viridis)

export <- read_csv("data/ami_daily_2017-02-27.csv")
export$date <- as.Date(floor_date(ymd_hms(export$UTC_START_TIME,tz="America/New_York"),unit="days"))

export %>% 
  mutate(month = floor_date(date,unit = "months")) %>% 
  ggplot(aes(x=USAGE,y=as.factor(month), fill=..x..))+
    geom_joy_gradient()+
    scale_fill_viridis()
