## Plot Global Active Power by frequency

## Load all data in the working directory
alldata <- read.table("household_power_consumption.txt", header = TRUE,  sep =";", na.strings = "?")
## Subset the data in 1/2/2007 and 2/2/2007
data <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",]
## Get Global_active_power and convert to numeric
global_active_power <- as.numeric(data$Global_active_power)

## Plot the histogram and save as a png file "plot1.png"
png(file = "plot1.png")
hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)")
dev.off()