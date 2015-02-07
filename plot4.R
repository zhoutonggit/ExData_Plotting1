## Plot four attributes together

## Load all data in the working directory
alldata <- read.table("household_power_consumption.txt", header = TRUE,  sep =";", na.strings = "?")
## Subset the data in 1/2/2007 and 2/2/2007
data <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",]

## Get date and time and convert
datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

## Get Global_active_power and convert to numeric
global_active_power <- as.numeric(data$Global_active_power)

## Get Sub_metering_1, Sub_metering_2, Sub_metering_3 and convert to numeric
sub_metering_1 <- as.numeric(data$Sub_metering_1)
sub_metering_2 <- as.numeric(data$Sub_metering_2)
sub_metering_3 <- as.numeric(data$Sub_metering_3)

## Get Voltage and convert to numeric
voltage <- as.numeric(data$Voltage)

## Get Global_reactive_power and convert to numeric
global_reactive_power <- as.numeric(data$Global_reactive_power)

## Plot four plots and save to plot4.png
png(file = "plot4.png")
## Set global layout
par(mfcol = c(2, 2))
## Plot four plots to each position
## Plot 1 to top left
plot(datetime, global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
## Plot 2 to bottom left
plot(datetime, sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(datetime, sub_metering_1, col = "black")
lines(datetime, sub_metering_2, col = "red")
lines(datetime, sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
## Plot 3 to top right
plot(datetime, voltage, type = "l", ylab = "Voltage")
## Plot 4 to bottom right
plot(datetime, global_reactive_power, type = "l", ylab = "Global_reactive_power")
## Close device
dev.off()