##Reading and converting data
##This script assumes the data has been unzipped and is located in the working directory
library(dplyr)
full_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
full_data$Date <- as.Date(full_data$Date, "%d/%m/%Y")
mydata <- filter(full_data, Date == "2007-02-01" | Date == "2007-02-02")
mydata$Date <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S")

##Plot 3
with(mydata, plot(Date, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(mydata, points(Date, Sub_metering_1, type = "l", col = "black"))
with(mydata, points(Date, Sub_metering_2, type = "l", col = "red"))
with(mydata, points(Date, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.65)
dev.copy(png, file = "plot3.png")
dev.off() 