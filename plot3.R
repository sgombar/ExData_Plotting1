#Will need to manipulate dates
library(lubridate)

# Set file locations
dataFile<-"./household_power_consumption.txt"
destFile<-"./plot3.png"

# Ready the data file
dat <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?"))

# Subset the Dates -- (dmy)
datSub <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))

#Create DateTime variable and add it to our data
DateTime <- paste(datSub$Date,datSub$Time)
DateTime <- dmy_hms(DateTime)
datSub <- cbind(datSub,DateTime)

# Make the plot
with(datSub, plot(datSub$DateTime,datSub$Sub_metering_1,type="l",col="black",ylab="Energy sub metering", xlab=" "))
with(datSub, lines(datSub$DateTime,datSub$Sub_metering_2,type="l",col="red"))
with(datSub, lines(datSub$DateTime,datSub$Sub_metering_3,type="l",col="blue"))
legend("topright", lty= c(1), col = c("black", "red","blue"), legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))



# Copy it too png file
dev.copy(png, file=destFile)

# close png deivce
dev.off()