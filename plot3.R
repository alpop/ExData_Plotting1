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

plot(power_cons$Date_,power_cons$Sub_metering_1,
     type='l',xlab='',ylab='Energy sub metering')

points(power_cons$Date_,power_cons$Sub_metering_2,type='l',col='red')
points(power_cons$Date_,power_cons$Sub_metering_3,type='l',col='blue')

legend("topright",col = c("black", "red", "blue"), 
       lty = c(1, 1, 1),lwd=c(2,2,2),cex=0.6,text.font=2,
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "./plot3.png")
dev.off()

# End of story
