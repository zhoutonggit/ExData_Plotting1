## Plot Global Active Power by Sub_metering_1, Sub_metering_2, Sub_metering_3

## Load all data in the working directory
alldata <- read.table("household_power_consumption.txt", header = TRUE,  sep =";", na.strings = "?")
## Subset the data in 1/2/2007 and 2/2/2007
data <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",]
## Get Sub_metering_1, Sub_metering_2, Sub_metering_3 and convert to numeric
sub_metering_1 <- as.numeric(data$Sub_metering_1)
sub_metering_2 <- as.numeric(data$Sub_metering_2)
sub_metering_3 <- as.numeric(data$Sub_metering_3)
## Get date and time and convert
datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

## Plot and save as plot3.png
png(file = "plot3.png")
plot(datetime, sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(datetime, sub_metering_1, col = "black")
lines(datetime, sub_metering_2, col = "red")
lines(datetime, sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()