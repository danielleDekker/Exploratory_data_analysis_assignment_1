# plot 3

# read in the data
setwd("coursera/Course_4/household_power_consumption_zip~")
household_data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

# set the Data column as data 
household_data$Date <- as.Date(household_data$Date, format = "%d/%m/%Y")

# subset on date (2007-02-01 and 2007-02-02)
date_sub <- subset(household_data, Date < "2007-02-03" & Date >= "2007-02-01" )

# Set time
Sys.setlocale("LC_TIME", "C")
# combine time and day 
dateTime <- as.POSIXct(paste(date_sub$Date,date_sub$Time),format = "%Y-%m-%d %H:%M:%S")

# write to png
png(filename = "plot3.png")
# create plot, add lines and add a legend
plot(as.numeric(as.character(date_sub$Sub_metering_1)) ~ dateTime, type ="l", ylab = "Energy sub metering",xlab = "" )
lines(as.numeric(as.character(date_sub$Sub_metering_2)) ~ dateTime, col = "red")
lines(as.numeric(as.character(date_sub$Sub_metering_3)) ~ dateTime, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col = c("black","red","blue"))
dev.off()