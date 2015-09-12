# Exploratory Data Analysis
# Week 1. Course Project 1. 
# Code reconstructing plot1.png
# by Alexander Popov

library(sqldf)

# Reading data ...

power_cons = read.csv.sql("./household_power_consumption.txt",       
        sql = "select * from file where Date == '2/2/2007' 
        OR Date == '1/2/2007'",
        sep=";", eol = "\n")

print(dim(power_cons))

# Plotting...

hist(power_cons$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "./plot1.png")
dev.off()

# End of story
