# plot1.R by jagzuk 06 Jun 2015
# Generate plot1.png
# This script uses the png() functions to write directly to a graphics file device
# An alternative method would be to output the plot to screen and then use dev.copy

# Load the data ...
# This script assumes that the data file is in the same directory as the script
# The data is in the file household_power_consumption.txt
# This is a text file with column header names and a semi-colon (;) seperator
# Need to use na.strings param to ensure that numbers are read in correctly ...

dataFile <- 'household_power_consumption.txt'
plotData <- read.csv(dataFile, sep=';', stringsAsFactors=FALSE, na.strings="?")

# The date format used is dd/mm/yyyy
# Convert the time and dates to avoid confusion later
plotData$Time <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")
plotData$Date <- as.Date(plotData$Date,format="%d/%m/%Y")

# We are only interested in 1st/2nd Feb 2007, so subset the data to that
plotData.Dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
plotData <- subset(plotData, Date %in% plotData.Dates)

# setup a png graphic device for a 480x480px called plot1.png
png("plot1.png", width=480, height=480, units="px")
# draw a histogram
hist(plotData$Global_active_power, main="Global Active Power",  col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

# Ta Da!
