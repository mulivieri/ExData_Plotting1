#open the file from the directory
dataFile <- 'household_power_consumption.txt'
power <- read.table(dataFile, header=TRUE, sep = ';', stringsAsFactors = FALSE, dec = ".")

#Clean and subset the data
subSetPower <- subset(power,power$Date == '1/2/2007' | power$Date == '2/2/2007')
dateTime <- strptime(paste(subSetPower$Date, subSetPower$Time, sep = ' '), '%d/%m/%Y %H:%M:%S') 
globalActivePower <- as.numeric(subSetPower$Global_active_power)

#Open the png device;create the file 'plot2.png' in the working directory
png('plot2.png', width = 480, height = 480)
plot(dateTime, globalActivePower, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')

#Close the graphic device
dev.off()
