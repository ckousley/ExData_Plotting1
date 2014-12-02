setwd("~/Coursera/Exploratory Data Analysis/Course Project")
electric <-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

# Subset for selected dates
electric_set <- electric[which(electric$Date %in% c("1/2/2007","2/2/2007")), ]

# Combine date and time columns and adjust format
electric_set$datetime <- strptime(paste(electric_set$Date, electric_set$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

# Adjust values to numeric class for plotting
numcol <-3:9
electric_set[,numcol] <- as.numeric(unlist(electric_set[,numcol]))

#Plot 2
png(filename = "plot2.png")
with(electric_set, plot(datetime, Global_active_power, xlab=" ", ylab="Global Active Power (kilowatts)", type="l")) 
dev.off()
