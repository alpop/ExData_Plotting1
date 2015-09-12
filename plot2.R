# Exploratory Data Analysis
# Week 1. Course Project 1. 
# Code reconstructing plot2.png
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

plot(power_cons$Date_,power_cons$Global_active_power,
     type='l', xlab='',ylab='Global Active Power (kilowatts)')

dev.copy(png, file = "./plot2.png")
dev.off()

# End of story
