power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") #read data
power2 <- subset(power, Date == "1/2/2007" | Date == "2/2/2007") # subset dates 2007-02-01 & 2007-02-02
power2$datetime <- paste(power2$Date, power2$Time)
power2$datetime <- strptime(power2$datetime, format = "%d/%m/%Y %H:%M:%S") # convert to Date & time

#plot on screen
par(mfrow=c(2,2), mar=c(4,4,2,1)) #set to display 4 plots on screen and set margin

# 1st plot
plot(power2$datetime, power2$Global_active_power, type="l", ylab="Global Active Power", xlab="")
# 2nd plot
plot(power2$datetime, power2$Voltage, type="l", xlab="datetime", ylab="Voltage")
# 3rd plot
plot(power2$datetime, power2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(power2$datetime, power2$Sub_metering_2, col="red")
lines(power2$datetime, power2$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"), bty="n",cex=0.8)
# 4th plot
plot(power2$datetime, power2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#create PNG file
png(file = "plot4.png", bg = "white")
par(mfrow=c(2,2), mar=c(4,4,2,1)) #set to display 4 plots on screen and set margin

# 1st plot
plot(power2$datetime, power2$Global_active_power, type="l", ylab="Global Active Power", xlab="")
# 2nd plot
plot(power2$datetime, power2$Voltage, type="l", xlab="datetime", ylab="Voltage")
# 3rd plot
plot(power2$datetime, power2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(power2$datetime, power2$Sub_metering_2, col="red")
lines(power2$datetime, power2$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"), bty="n",cex=0.8)
# 4th plot
plot(power2$datetime, power2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
