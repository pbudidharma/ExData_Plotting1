###########################################################################
## Plot 2: Global Active Power(in KW) in details in 01-02 February 2007  ##
###########################################################################

library (dplyr)

## - Download datafile
## - Unzip 
## - Read it
## - Subset data with date range Feb 01 - 02, 2007
## - merge Date and Time variables and conver it to POSIXlt class (Date/Time)
## - Generate plot and save it as Test2.png

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./power_consumption.zip")
unzip(zipfile="./power_consumption.zip", exdir = "./power")
power <- read.table(file="./power/household_power_consumption.txt", header= TRUE,sep = ";", na.strings="?", blank.lines.skip = TRUE, stringsAsFactors = FALSE)
power <- subset(power, Date== "1/2/2007"|Date == "2/2/2007")

power$Date <- as.Date(power$Date, format = '%d/%m/%Y')
DTMerge <- paste(power$Date, power$Time, sep = ' ')
DateTime <- strptime(DTMerge, format = '%Y-%m-%d %H:%M:%S') 

png(filename="./plot2.png", width = 480, height = 480, units = "px")
plot(DateTime, power$Global_active_power, type = 'l', ylab = "Global active power (Kilowatt)")
dev.off()

