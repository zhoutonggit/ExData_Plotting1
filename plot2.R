## Plot Global Active Power by time

## Load all data in the working directory
alldata <- read.table("household_power_consumption.txt", header = TRUE,  sep =";", na.strings = "?")
## Subset the data in 1/2/2007 and 2/2/2007
data <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",]
## Get Global_active_power and convert to numeric
global_active_power <- as.numeric(data$Global_active_power)
## Get date and time and convert
datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

## Plot and save as plot2.png
png(file = "plot2.png")
plot(datetime, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (killowatts)")
dev.off()