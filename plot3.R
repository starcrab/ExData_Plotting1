power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") #read data
power2 <- subset(power, Date == "1/2/2007" | Date == "2/2/2007") # subset dates 2007-02-01 & 2007-02-02
power2$datetime <- paste(power2$Date, power2$Time)
power2$datetime <- strptime(power2$datetime, format = "%d/%m/%Y %H:%M:%S") # convert to Date & time

#plot on screen
plot(power2$datetime, power2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
#add lines for metering 2 & 3
lines(power2$datetime, power2$Sub_metering_2, col="red")
lines(power2$datetime, power2$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue")) # draw legend

#create PNG file
png(file = "plot3.png", bg = "white")
plot(power2$datetime, power2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
#add lines for metering 2 & 3
lines(power2$datetime, power2$Sub_metering_2, col="red")
lines(power2$datetime, power2$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue")) # draw legend
dev.off()