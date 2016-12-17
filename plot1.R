############################################################################
## Plot 1: Frequency of Global Active Power(in KW) in 01-02 February 2007 ##
############################################################################

library (dplyr)

## - Download datafile
## - Unzip 
## - Read it
## - Subset data with date range Feb 01 - 02, 2007
## - Generate plot and save it to PNG

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./power_consumption.zip")
unzip(zipfile="./power_consumption.zip", exdir = "./power")
power <- read.table(file="./power/household_power_consumption.txt", header= TRUE,sep = ";", na.strings="?", blank.lines.skip = TRUE, stringsAsFactors = FALSE)
power <- subset(power, Date== "1/2/2007"|Date == "2/2/2007")

png(filename="./test1.png", width = 480, height = 480, units = "px")
hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (Kilowatt)")
dev.off()

