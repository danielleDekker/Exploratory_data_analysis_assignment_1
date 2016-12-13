# plot 4:

# read in the data
setwd("coursera/Course_4/household_power_consumption_zip~")
household_data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

# set the Data column as data 
household_data$Date <- as.Date(household_data$Date, format = "%d/%m/%Y")

# subset on date (2007-02-01 and 2007-02-02)
date_sub <- subset(household_data, Date < "2007-02-03" & Date >= "2007-02-01" )

# write to png
png(filename = "plot4.png")
# set amount of tables
par(mfrow = c(2,2))

# plot 1:
plot(as.numeric(as.character(date_sub$Global_active_power)) ~ dateTime, 
     type = "l", xlab = "", ylab = "Global Active Power")

# plot 2:
plot(as.numeric(as.character(date_sub$Voltage)) ~ dateTime ,
     lty = 1, type = "l", ylab = "Voltage", xlab = "datetime")

#plot 3:
plot(as.numeric(as.character(date_sub$Sub_metering_1)) ~ dateTime, type ="l", ylab = "Energy sub metering",xlab = "" )
lines(as.numeric(as.character(date_sub$Sub_metering_2)) ~ dateTime, col = "red")
lines(as.numeric(as.character(date_sub$Sub_metering_3)) ~ dateTime, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col = c("black","red","blue"),bty = "n")

# plot 4:
plot(as.numeric(as.character(date_sub$Global_reactive_power)) ~dateTime, 
     type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()