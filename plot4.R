setwd("~/Coursera/Exploratory Data Analysis/Course Project")
electric <-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

# Subset for selected dates
electric_set <- electric[which(electric$Date %in% c("1/2/2007","2/2/2007")), ]

# Combine date and time columns and adjust format
electric_set$datetime <- strptime(paste(electric_set$Date, electric_set$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

# Adjust values to numeric class for plotting
numcol <-3:9
electric_set[,numcol] <- as.numeric(unlist(electric_set[,numcol]))

#Plot 4

png(filename = "plot4.png")
par(mfrow=c(2,2))

#4a
with(electric_set, plot(datetime, Global_active_power, xlab=" ", ylab="Global Active Power", type="l"))

#4b
with(electric_set, plot(datetime, Voltage, type="l"))

#4c
with(electric_set, {
        plot(datetime, Sub_metering_1, xlab=" ", ylab="Energy sub metering", type="n")
        lines(datetime, Sub_metering_1, col="black")
        lines(datetime, Sub_metering_2, col="red")
        lines(datetime, Sub_metering_3, col="blue")
        legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", cex=0.9)
})

#4d
with(electric_set, plot(datetime, Global_reactive_power, type="l"))

dev.off()

