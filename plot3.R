#
# plot3.R - R script to plot energy sub metering by time from household power consumption data set
# Author: Benjamin DeVore
# Course: JHU Exploratory Data Analysis (class 011)
#

# Read in the data file
data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("?"))
data$Timestamp <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
# Filter to date range 2007-02-01 to 2007-02-02
data <- data[data$Date %in% as.Date(c('01/02/2007','02/02/2007'),"%d/%m/%Y"),]

# Cleanup the data

# Export the PNG
png("plot3.png", width=480, height=480, units="px")

# Generate the plot
yrange <- range(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3)
xrange <- range(data$Timestamp)
plot(xrange, yrange, type="n", ylab="Energy sub metering", xlab="")
colors <- c("black","red","blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=colors, lty="solid", lwd=1.5)
lines(data$Timestamp,data$Sub_metering_1,col=colors[1])
lines(data$Timestamp,data$Sub_metering_2,col=colors[2])
lines(data$Timestamp,data$Sub_metering_3,col=colors[3])

# Return output to the script
dev.off()
