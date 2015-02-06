#
# plot4.R - R script to plot four graphs from household power consumption data set
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
png("plot4.png", width=480, height=480, units="px")

# Set up the common parameters for the four plots
par(mfrow=c(2,2))
xrange <- range(data$Timestamp)

# First plot
p1yrange <- range(data$Global_active_power)
plot(xrange, p1yrange, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Timestamp,data$Global_active_power)

# Second plot
p2yrange <- range(data$Voltage)
plot(xrange, p2yrange, type="n", ylab="Voltage", xlab="datetime")
lines(data$Timestamp,data$Voltage)

# Third plot
p3yrange <- range(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3)
plot(xrange, p3yrange, type="n", ylab="Energy sub metering", xlab="")
colors <- c("black","red","blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=colors, lty="solid", lwd=1.5)
lines(data$Timestamp,data$Sub_metering_1,col=colors[1])
lines(data$Timestamp,data$Sub_metering_2,col=colors[2])
lines(data$Timestamp,data$Sub_metering_3,col=colors[3])

# Fourth plot
p4yrange <- range(data$Global_reactive_power)
plot(xrange, p4yrange, type="n", ylab="global_reactive_power", xlab="datetime")
lines(data$Timestamp,data$Global_reactive_power)

# Return output to the script
dev.off()
