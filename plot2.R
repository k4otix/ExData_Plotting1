# plot2.R - R code to generate plot2.png

# Read the data file (already limited to data for Feb. 1-2, 2007)
data <- read.csv("household_power_2days.txt", sep=";", stringsAsFactors=FALSE)

# Convert Time column to POSIXlt/POSIXct using date from the Date column
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Create the plot, slight adjustment to size of axis labels
png(file="plot2.png", bg="transparent")  # png default size is 480x480
with(data, {
    plot(Time, Global_active_power, type="n", xlab="", 
         ylab="Global Active Power (kilowatts)",
         cex.axis=0.9, cex.lab=0.9)
    lines(Time, Global_active_power)
})

dev.off()