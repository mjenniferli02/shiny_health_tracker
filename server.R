#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(data.table)
library(ggplot2)
library(lubridate)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  data <- fread("data/sleep-score/sleep_score.csv")
  data <- data %>% mutate(timestamp=ymd(substr(timestamp, 1, 10)))
  
  output$steps_over_time <- renderPlot({
    x <- seq(10)
    y <- x^2
    return(plot(x,y))
  })

  output$weight_over_time <- renderPlot({
    x <- seq(10)
    y <- log(x)
    return(plot(x,y))
  })

  output$sleep_over_time <- renderPlot({
    p <- ggplot(data)+geom_line(aes(x=timestamp, y=overall_score))
    return(p)
  })
  
})
