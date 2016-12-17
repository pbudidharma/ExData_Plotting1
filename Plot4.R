## Plot 4: 
##    1) Global Active Power on 01-02 February 2007
##    2) Energy sub meterings on 01-02 February 2007
##    3) Voltage on 01-02 February 2007
##    4) Global Reactive Power on 01-02 February 2007                      

library (dplyr)


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./power_consumption.zip")
unzip(zipfile="./power_consumption.zip", exdir = "./power")
power <- read.table(file="./power/household_power_consumption.txt", header= TRUE,sep = ";", na.strings="?", blank.lines.skip = TRUE, stringsAsFactors = FALSE)
power <- subset(power, Date== "1/2/2007"|Date == "2/2/2007")

power$Date <- as.Date(power$Date, format = '%d/%m/%Y')
DTMerge <- paste(power$Date, power$Time, sep = ' ')
DateTime <- strptime(DTMerge, format = '%Y-%m-%d %H:%M:%S') 

png(filename="./plot4.png", width = 480, height = 480, units = "px")
par(mfcol= c(2,2), mar=c(4,4,3,3))
with(power, {
       plot(DateTime, power$Global_active_power, type= 'l', ylab = "Global Active Power")
      
       plot(DateTime, power$Sub_metering_1, type = 'l', ylab = "Energy Sub Metering", col = 'black')
       lines(DateTime, power$Sub_metering_2, ylab = "Global active power (Kilowatt)", col = 'red')
       lines(DateTime, power$Sub_metering_3, ylab = "Global active power (Kilowatt)", col = 'blue')
       legend("topright", pch = '___', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

       plot(DateTime, power$Voltage, type = 'l',ylab = 'Voltage' )
       
       plot(DateTime, power$Global_reactive_power, type = 'l', ylab = "Global Reactive Power")
       })
dev.off()
