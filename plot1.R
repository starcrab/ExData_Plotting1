power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") #read data
power2 <- subset(power, Date == "1/2/2007" | Date == "2/2/2007") # subset dates 2007-02-01 & 2007-02-02
power2$datetime <- paste(power2$Date, power2$Time)
power2$datetime <- strptime(power2$datetime, format = "%d/%m/%Y %H:%M:%S") # convert to Date & time

hist(power2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#creates the PNG file
dev.copy(png, file = "plot1.png")
dev.off()