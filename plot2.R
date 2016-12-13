# plot 2:

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
png(filename = "plot2.png")
# create line plot of global active power ~ day
plot(as.numeric(as.character(date_sub$Global_active_power)) ~ dateTime ,
     lty = 1, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

