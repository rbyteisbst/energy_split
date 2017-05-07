library(tidyverse)
library(lubridate)
library(forcats)

#not horrible anymore
#shows usage facetted by weekdays and months and years

ami_daily <- read_csv("~/R/energy_split/data/ami_daily_2017-02-27.csv") %>% 
  mutate(date_time = ymd_hms(UTC_START_TIME))

ami <- ami_daily %>% 
  mutate(date = floor_date(date_time,unit = "days"),month = month(date,label=T), weekday = wday(date,label=T), weekday = factor(weekday,levels(weekday)[c(2:7,1)]), week = week(date), year = year(date))

ami %>% 
  ggplot(aes(week,weekday,fill=USAGE)) +
    geom_tile(data = ami) +
    facet_grid(year~month,scales = "free_x")+
    theme_minimal()+
    scale_fill_gradient(low="yellow",high="red")+
    theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
