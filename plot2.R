
setwd("C:/Users/user1/Documents/power")

library(lubridate)

data <- read.table(file="powerConsumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE, dec=".")

plottedDates<- subset(data, Date==c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(plottedDates$Date, plottedDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

activepower<- as.numeric(as.character(plottedDates$Global_active_power) )

plot(x= datetime, y= activepower, type="l", main="Global Active Power Vs Time",xlab="", ylab="Global Active Power (kilowatts)")

png("plot1.png", width=480, height=480)

dev.off()
