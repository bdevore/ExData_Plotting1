#
# plot1.R - R script to plot global active power from household power consumption data set
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
png("plot2.png", width=480, height=480, units="px")

# Generate the plot
yrange <- range(data$Global_active_power)
xrange <- range(data$Timestamp)
plot(xrange, yrange, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Timestamp,data$Global_active_power)

# Return output to the script
dev.off()
