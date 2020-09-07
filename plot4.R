#open the file from the directory
dataFile <- 'household_power_consumption.txt'
power <- read.table(dataFile, header = TRUE, sep = ';', stringsAsFactors = FALSE, decc = '.')

#Clean and subset the data
subSetPower <- subset(power,power$Date == '1/2/2007' | power$Date == '2/2/2007')
dateTime <- strptime(paste(subSetPower$Date, subSetPower$Time, sep = ' '), '%d/%m/%Y %H:%M:%S') 
globalActivePower <- as.numeric(subSetPower$Global_active_power)
globalReactivePower <- as.numeric(subSetPower$Global_reactive_power)
voltage <- as.numeric(subSetPower$Voltage)
subMetering1 <- as.numeric(subSetPower$Sub_metering_1)
subMetering2 <- as.numeric(subSetPower$Sub_metering_2)
subMetering3 <- as.numeric(subSetPower$Sub_metering_3)

#Open the png device;create the file 'plot4.png' in the working directory
png('plot4.png', width = 480, height = 480)

#Define the numbers of graphs in the file (2 rows and 2 columns)
par(mfrow = c(2, 2)) 

#Plot the first graph on the top left part of the file
plot(dateTime, globalActivePower, type = 'l', xlab ='', ylab = 'Global Active Power', cex = 0.2)

#plot the second graph, on the right column, same row of the first graph
plot(dateTime, voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

#plot the third graph on the bottom left part of the file
plot(dateTime, subMetering1, type = 'l', ylab = 'Energy Submetering', xlab = '')
lines(dateTime, subMetering2, type = 'l', col = 'red')
lines(dateTime, subMetering3, type = 'l', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'), bty = 'n')

#plot the fourth graph next to the third, on the right column, same row
plot(dateTime, globalReactivePower, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')

#Close the graphic device
dev.off()
