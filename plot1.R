# Set file locations
dataFile<-"./household_power_consumption.txt"
destFile<-"./plot1.png"

# Ready the data file
dat <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?"))

# Subset the Dates -- (dmy)
datSub <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))

# Make the plot
hist(datSub$Global_active_power,col="red",xlab="Global Active Power (kW)",main="Global Active Power")

# Copy it too png file
dev.copy(png, file=destFile)

# close png deivce
dev.off()
