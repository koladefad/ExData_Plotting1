##Reading and converting data
##This script assumes the data has been unzipped and is located in the working directory
library(dplyr)
full_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
full_data$Date <- as.Date(full_data$Date, "%d/%m/%Y")
mydata <- filter(full_data, Date == "2007-02-01" | Date == "2007-02-02")
mydata$Date <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S")

##Plot 1
hist(mydata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()