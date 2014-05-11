# Exploratory Data Analysis, Project 1, Plot 1
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
png(file="plot1.png", bg="white")

# Plot 1: Creating a histogram for Global Active Power from the new dataset
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="red", breaks=20, main="Global Active Power")

# Saving the png file
dev.off()