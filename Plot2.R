library(lubridate)

# Read data
hh <- read.csv("../household_power_consumption.txt", sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
hh <- hh[hh$Date=="1/2/2007" | hh$Date=="2/2/2007",]
hh$DateTime <- dmy_hms(paste(hh[,1], hh[,2]))

# Create plot
png(filename = "./Plot2.png")
plot(hh$DateTime, hh$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab ="", type="l")
dev.off()