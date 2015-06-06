# plot4.R by jagzuk 06 Jun 2015 # Generate plot4.png
# See comments in plot1.R for background to the command choices made in this file

# Load and prepare data
dataFile <- 'household_power_consumption.txt'
plotData <- read.csv(dataFile, sep=';', stringsAsFactors=FALSE, na.strings="?")
plotData$Time <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")
plotData$Date <- as.Date(plotData$Date,format="%d/%m/%Y")
plotData.Dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
plotData <- subset(plotData, Date %in% plotData.Dates)

# setup a png graphic device for a 480x480px called plot3.png
png("plot4.png", width=480, height=480, units="px")
# this time need 2 rows and 2 columns
par(mfrow=c(2,2))
# also set some better margins that look more like the example plots
# especially a large bottom margin
par('mar'=c(8,5,1,1))

# draw the 4 charts
# plot1
plot(plotData$Time,plotData$Global_active_power,col='black', type='l',xlab="", ylab="GLobal Active Power")

# plot2
plot(plotData$Time,plotData$Voltage,col='black', type='l',xlab='datetime',ylab='Voltage')

# plot3
plot(plotData$Time,plotData$Sub_metering_1,type='l', col='black', xlab="", ylab="Energy sub metering")
lines(plotData$Time, plotData$Sub_metering_2, col="red")
lines(plotData$Time, plotData$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

# plot4
plot(plotData$Time,plotData$Global_reactive_power,type='l', col='black', xlab='datetime', ylab='Global_reactive_power')

dev.off()

# Ta Da!
