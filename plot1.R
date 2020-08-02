setwd("C:/Users/user1/Documents/power")

data <- read.table(file="powerConsumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE, dec=".")

plottedDates<- subset(data, Date==c("1/2/2007","2/2/2007"))

hist(as.numeric(plottedDates$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

png("plot1.png", width=480, height=480)

dev.off()
