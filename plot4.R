# Exploratory Data Analysis, Project 1, Plot4
# Written by Manish Saggar, on 5/10/2014
# Aim: This assignment uses the “Individual household electric power 
#      consumption Data Set” to learn about the data visualization 
#      capabilities of R base package.

# Reading full data at once (~20MB)
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# As per assignment, limiting the dates to 2007-02-01 and 2007-02-02
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Converting the columns from factor levels to numeric data for visualization
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_intensity <- as.numeric(as.character(data$Global_intensity))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# Creating a new column for datetime, so that we can visualize data w.r.t. time
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Creating the png device
png(file="plot4.png", bg="white")

# Plot 4: Creating a 2 x 2 plot to visualize 4 different variables with time
par(mfcol=c(2,2))
# Creating a plot for Global Active Power for the two days wrt time
plot(data$datetime, data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power")

# Creating a plot for Energy sub metering for each sub-meter in 
# different colors wrt time
plot(data$datetime, data$Sub_metering_1, col="black", type="l", xlab="",
     ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col="red", type="l")
lines(data$datetime, data$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"), bty="n")

# Creating a plot for Voltage wrt time
plot(data$datetime, data$Voltage, type="l", xlab="datetime", 
     ylab="Voltage")

# Creating a plot for Global Reactive Power wrt time
plot(data$datetime, data$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

# Saving the png file
dev.off()