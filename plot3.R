# plot3.R by jagzuk 06 Jun 2015 # Generate plot3.png
# See comments in plot1.R for background to the command choices made in this file

# Load and prepare data
dataFile <- 'household_power_consumption.txt'
plotData <- read.csv(dataFile, sep=';', stringsAsFactors=FALSE, na.strings="?")
plotData$Time <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")
plotData$Date <- as.Date(plotData$Date,format="%d/%m/%Y")
plotData.Dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
plotData <- subset(plotData, Date %in% plotData.Dates)

# setup a png graphic device for a 480x480px called plot3.png
png("plot3.png", width=480, height=480, units="px")

# this chart will also use plot, 
# but will also use 'lines' for the 2 additional values
# and use 'legend' for the, er, legend
plot(plotData$Time,plotData$Sub_metering_1,type='l', col='black', xlab="", ylab="Energy sub metering")
lines(plotData$Time, plotData$Sub_metering_2, col="red")
lines(plotData$Time, plotData$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()

# Ta Da!
