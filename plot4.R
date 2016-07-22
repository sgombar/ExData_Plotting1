#Will need to manipulate dates
library(lubridate)

# Set file locations
dataFile<-"./household_power_consumption.txt"
destFile<-"./plot4.png"

# Ready the data file
dat <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?"))

# Subset the Dates -- (dmy)
datSub <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))

#Create DateTime variable and add it to our data
DateTime <- paste(datSub$Date,datSub$Time)
DateTime <- dmy_hms(DateTime)
datSub <- cbind(datSub,DateTime)

# Make the plot
# Set up a 4x4 grid
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(1, 1, 1, 1))

#(Top- Left)Add item from plot 2 (change ylab):
plot(datSub$DateTime,datSub$Global_active_power, type="l",xlab="", ylab="Global Active Power")

#Add top right item
plot(datSub$DateTime,datSub$Voltage,type="l",ylab="Voltage",xlab="datetime",col="black")


#(Bottom Left) Same as plot3 with change in legend
with(datSub, plot(datSub$DateTime,datSub$Sub_metering_1,type="l",col="black",ylab="Energy sub metering", xlab=" "))
with(datSub, lines(datSub$DateTime,datSub$Sub_metering_2,type="l",col="red"))
with(datSub, lines(datSub$DateTime,datSub$Sub_metering_3,type="l",col="blue"))
legend("topright", bty='n',lty= c(1), col = c("black", "red","blue"), legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


#(Bottom Right)
plot(datSub$DateTime,datSub$Global_reactive_power,bty="n",type="l",ylab="Global_reactive_power",xlab="datetime",col="black",bty="n")


# Copy it too png file
dev.copy(png, file=destFile)

# close png deivce
dev.off()