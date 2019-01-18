# Read data
hh <- read.csv("../household_power_consumption.txt", sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
hh <- hh[hh$Date=="1/2/2007" | hh$Date=="2/2/2007",]

# Create plot
png(filename = "./Plot1.png")
hist(hh_sub$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()