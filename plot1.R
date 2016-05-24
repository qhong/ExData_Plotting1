rm(list = ls())
library(rCharts)
setwd('C:\\Users\\qhong-10\\coursera\\Exploratory data analysis\\project\\assignment 1')
top <- read.table('../exdata-data-household_power_consumption/household_power_consumption.txt', 
                   header = T, sep = ';', nrow = 5)
classes <- sapply(top, class)
data <- read.table('../exdata-data-household_power_consumption/household_power_consumption.txt', 
                   header = T, sep = ';', colClasses = classes, na.strings = '?')
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data <- data['2007-02-01' <= data$Date & data$Date <= '2007-02-02',]

data$Date <- as.Date(data$Date, format = '%d/%m/%Y')

png('plot1.png', width = 480, height = 480, units = "px")
hist(data$Global_active_power, ylim = c(0,1300), xlab = 'Global Active Power(kilowatts)', 
     col = 'red', main = 'Global Active Powe')

dev.off()
