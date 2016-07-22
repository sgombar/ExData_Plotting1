#Will need to manipulate dates
library(lubridate)

# Set file locations
dataFile<-"./household_power_consumption.txt"
destFile<-"./plot2.png"

# Ready the data file
dat <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?"))

# Subset the Dates -- (dmy)
datSub <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))

#Create DateTime variable and add it to our data
DateTime <- paste(datSub$Date,datSub$Time)
DateTime <- dmy_hms(DateTime)
datSub <- cbind(datSub,DateTime)

# Make the plot
plot(datSub$DateTime,datSub$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")


# Copy it too png file
dev.copy(png, file=destFile)

# close png deivce
dev.off()
