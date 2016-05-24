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
png('plot3.png', width = 480, height = 480, units = "px")
plot(data$datetime, data$Sub_metering_1,  type = 'l',
     ylab = 'Energy sub metering', xlab = '')
points(data$datetime, data$Sub_metering_2,  type = 'l',
     col = 'red')
points(data$datetime, data$Sub_metering_3,  type = 'l',
     col = 'blue')
legend('topright', col = c('black','red','blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'), lty = 1)

dev.off()
