library(lubridate)

# Read data
hh <- read.csv("../household_power_consumption.txt", sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
hh <- hh[hh$Date=="1/2/2007" | hh$Date=="2/2/2007",]
hh$DateTime <- dmy_hms(paste(hh[,1], hh[,2]))

# Create plot
png(filename = "./Plot4.png")
par(mfrow = c(2,2))
plot(hh$DateTime, hh$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab ="", type="l")
plot(hh$DateTime, hh$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(hh$DateTime, hh$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
points(hh$DateTime, hh$Sub_metering_2, type="l", col="red")
points(hh$DateTime, hh$Sub_metering_3, type="l", col="blue")
legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(hh$DateTime, hh$Global_reactive_power, xlab = "datetime", type = "l")
dev.off()