##Read consumption data from txt file
consumption <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 70000)

##Reformat date/time data
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")

##Subset data b/w 2007-02-01 and 2007-02-02
consumption2 <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")
consumption2$date.time <- as.POSIXct(paste(consumption2$Date, consumption2$Time))

##Plot data
png(filename = 'plot3.png')
par(mfrow=c(1,1), mar=c(5.1,4.1,4.1,2.1))
with(consumption2, plot(date.time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(consumption2, lines(Sub_metering_2~date.time, col="red"))
with(consumption2, lines(Sub_metering_3~date.time, col="blue"))
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, cex=1.0)
##dev.copy(png, 'plot3.png')
dev.off()