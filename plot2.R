rm(list = ls())
library(rCharts)
setwd('C:\\Users\\qhong-10\\coursera\\Exploratory data analysis\\project\\assignment1\\ExData_Plotting1')
top <- read.table('../../exdata-data-household_power_consumption/household_power_consumption.txt', 
                  header = T, sep = ';', nrow = 5)
classes <- sapply(top, class)
data <- read.table('../../exdata-data-household_power_consumption/household_power_consumption.txt', 
                   header = T, sep = ';', colClasses = classes, na.strings = '?')
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data <- data['2007-02-01' <= data$Date & data$Date <= '2007-02-02',]

data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
head(data)
class(data$datetime)
png('plot2.png', width = 480, height = 480, units = "px")
plot(data$datetime, data$Global_active_power,  type = 'l',
     ylab = 'Global Active Power(kilowatts)', xlab = '')

dev.off()
