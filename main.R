library(data.table)
library(ggplot2)
library(lubridate)
library(tidyverse)

data <- fread("data/sleep-score/sleep_score.csv")
head(data)

data <- data %>% mutate(timestamp=ymd(substr(timestamp, 1, 10)))

ggplot(data)+geom_line(aes(x=timestamp, y=overall_score))
str(data)
