#open the file from the directory
dataFile <- 'household_power_consumption.txt'
power <- read.table(dataFile, header=TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.')

#Subset the data
subSetPower <- subset(power,power$Date == '1/2/2007' | power$Date == '2/2/2007')
globalActivePower <- as.numeric(subSetPower$Global_active_power)

#Open the png device;create the file 'plot1.png' in the working directory
png('plot1.png', width = 480, height = 480)
with(subSetPower, hist(globalActivePower, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power(kilowatts)'))

#close the graphic device
dev.off()
