## Assignent Exploratory Data analysis week 1

# plot 1
# read in the data
setwd("coursera/Course_4/household_power_consumption_zip~")
household_data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

# set the Data column as data 
household_data$Date <- as.Date(household_data$Date, format = "%d/%m/%Y")

# subset on date (2007-02-01 and 2007-02-02)
date_sub <- subset(household_data, Date < "2007-02-03" & Date >= "2007-02-01" )

# write to png
png(filename = "plot1.png")
# create histogram of global active power (kilowatts)
hist(as.numeric(as.character(date_sub$Global_active_power)),
     col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()



