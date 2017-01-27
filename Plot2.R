##Read consumption data from txt file
consumption <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

##Reformat date/time data
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")

##Subset data b/w 2007-02-01 and 2007-02-02
consumption2 <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

##Plot Global Active Power by day line
consumption2$date.time <- paste(consumption2$Date, consumption2$Time)
consumption2$date.time <- as.POSIXct(consumption2$date.time)
with(consumption2, plot(Global_active_power~date.time, ylab="Global Active Power (kilowatts)", xlab="", type="l"))
dev.copy(png, 'plot2.png')
dev.off()