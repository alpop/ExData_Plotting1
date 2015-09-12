# Exploratory Data Analysis
# Week 1. Course Project 1. 
# Code reconstructing plot3.png
# by Alexander Popov

library(sqldf)

# Reading data ...

power_cons = read.csv.sql("./household_power_consumption.txt",       
        sql = "select * from file where Date == '2/2/2007' 
        OR Date == '1/2/2007'",
        sep=";", eol = "\n")

print(dim(power_cons))

# Convert "Date" and "Time" to appropriate format...

power_cons$Date_=NULL
power_cons$Date_=(strptime(paste(power_cons$Date,power_cons$Time),
                           format="%d/%m/%Y %H:%M:%S"))

# Plotting...

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(power_cons$Date_,power_cons$Global_active_power,type='l',
     xlab='',ylab='Global Active Power')

plot(power_cons$Date_,power_cons$Voltage,type='l',
     ylab="Voltage",
     xlab='datetime')

plot(power_cons$Date_,power_cons$Sub_metering_1,type='l',
     xlab='',ylab='Energy sub metering')
points(power_cons$Date_,power_cons$Sub_metering_2,type='l',col='red')
points(power_cons$Date_,power_cons$Sub_metering_3,type='l',col='blue')

legend("topright",col = c("black", "red", "blue"), lty = c(1, 1, 1),lwd=c(2,2,2),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       cex=.4,pt.cex=1,bty='n')

plot(power_cons$Date_,power_cons$Global_reactive_power,type='l',
     ylab="Global_reactive_power",
     xlab='datetime')

dev.copy(png, file = "./plot4.png")
dev.off()

# End of story
