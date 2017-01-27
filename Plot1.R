##Read consumption data from txt file
consumption <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

##Reformat date/time data
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")

##Subset data b/w 2007-02-01 and 2007-02-02
consumption2 <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

##Plot histogram
par(mar=c(5.1,4.1,4.1,2.1), mfrow=c(1,1))
hist(consumption2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", ylim=c(0,1200), xlim=c(0,6))
dev.copy(png, 'plot1.png')
dev.off()

