power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") #read data
power2 <- subset(power, Date == "1/2/2007" | Date == "2/2/2007") # subset dates 2007-02-01 & 2007-02-02
power2$datetime <- paste(power2$Date, power2$Time)
power2$datetime <- strptime(power2$datetime, format = "%d/%m/%Y %H:%M:%S") # convert to Date & time

plot(power2$datetime, power2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#create the PNG file
dev.copy(png, file = "plot2.png")
dev.off()