# plot2.R by jagzuk 06 Jun 2015 # Generate plot2.png
# See comments in plot1.R for background to the command choices made in this file

# Load and prepare data
dataFile <- 'household_power_consumption.txt'
plotData <- read.csv(dataFile, sep=';', stringsAsFactors=FALSE, na.strings="?")
plotData$Time <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")
plotData$Date <- as.Date(plotData$Date,format="%d/%m/%Y")
plotData.Dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
plotData <- subset(plotData, Date %in% plotData.Dates)

# setup a png graphic device for a 480x480px called plot2.png
png("plot2.png", width=480, height=480, units="px")

# use plot to get the correct chart tyoe, key on time instead of date
plot(plotData$Time,plotData$Global_active_power,type='l',xlab="", ylab="GLobal Active Power (kilowatts)")
dev.off()

# Ta Da!
