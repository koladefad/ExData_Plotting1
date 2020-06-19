##Read and converting data
##This script assumes the data has been unzipped and is located in the working directory
library(dplyr)
full_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
full_data$Date <- as.Date(full_data$Date, "%d/%m/%Y")
mydata <- filter(full_data, Date == "2007-02-01" | Date == "2007-02-02")
mydata$Date <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S")

##Plot 4
par(mfcol = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(mydata, {
        plot(Date, Global_active_power, type = "l", col = "black", ylab = "Global Active Power", xlab = "")
        plot(Date, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
        points(Date, Sub_metering_1, type = "l", col = "black")
        points(Date, Sub_metering_2, type = "l", col = "red")
        points(Date, Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pt.cex = 1, cex = 0.4, bty = "n")
        plot(Date, Voltage, type = "l", col = "black", ylab = "Voltage", xlab = "datetime")
        plot(Date, Global_reactive_power, type = "l", col = "black", ylab = "Global_reactive_power", xlab = "datetime")
})
dev.copy(png, file = "plot4.png")
dev.off() 
