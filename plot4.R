
setwd("C:/Users/user1/Documents/power")

library(lubridate)

data <- read.table(file="powerConsumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE, dec=".")

plottedDates<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(plottedDates$Date, plottedDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

activepower<- as.numeric(plottedDates$Global_active_power)

globalReactivePower <- as.numeric(plottedDates$Global_reactive_power)
voltage <- as.numeric(plottedDates$Voltage)

subMetering1 <- as.numeric(plottedDates$Sub_metering_1)
subMetering2 <- as.numeric(plottedDates$Sub_metering_2)
subMetering3 <- as.numeric(plottedDates$Sub_metering_3)

par(mfrow = c(2, 2)) 

plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=0.5, col=c("black", "red", "blue"))
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
png("plot1.png", width=480, height=480)

dev.off()
