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

ami <- read_csv("data/ami_18594.csv") %>% 
  mutate(date_time = ymd_hms(LOCAL_INTERVAL_TIME))

ami %>% 
  mutate(month = floor_date(date_time,unit = "months")) %>% 
  ggplot(aes(x=KWH,y=as.factor(month), fill=..x..))+
    geom_joy_gradient()+
    scale_fill_viridis()+
    scale_x_log10()
