#open the file from the directory
dataFile <- 'household_power_consumption.txt'
power <- read.table(dataFile, header = TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.')

#Clean and subset the data
subSetPower <- subset(power,power$Date == '1/2/2007' | power$Date == '2/2/2007')
dateTime <- strptime(paste(subSetPower$Date, subSetPower$Time, sep = ' '), '%d/%m/%Y %H:%M:%S') 
globalActivePower <- as.numeric(subSetPower$Global_active_power)
subMetering1 <- as.numeric(subSetPower$Sub_metering_1)
subMetering2 <- as.numeric(subSetPower$Sub_metering_2)
subMetering3 <- as.numeric(subSetPower$Sub_metering_3)

#Open the png device;create the file 'plot3.png' in the working directory
png("plot3.png", width = 480, height = 480)
plot(dateTime, subMetering1, type="l", ylab= 'Energy Submetering', xlab='')
lines(dateTime, subMetering2, type= 'l', col= 'red')
lines(dateTime, subMetering3, type= 'l', col= 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'))

#Close the graphic device
dev.off()
