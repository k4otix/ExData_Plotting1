# plot3.R - R code to generate plot3.png

# Read the data file (already limited to data for Feb. 1-2, 2007)
data <- read.csv("household_power_2days.txt", sep=";", stringsAsFactors=FALSE)

# Convert Time column to POSIXlt/POSIXct using date from the Date column
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Create the plot
png(file="plot3.png", bg="transparent")  # png default size is 480x480
with(data, {
    lw = c(1.5, 1.5, 1.5)  # adjust line width, font sizes
    plot(Time, Sub_metering_1, type="n", xlab="", 
         ylab="Energy sub metering", cex.axis=0.9, cex.lab=0.9)
    lines(Time, Sub_metering_1, lwd=lw)
    lines(Time, Sub_metering_2, col="red", lwd=lw)
    lines(Time, Sub_metering_3, col="blue", lwd=lw)
    legend("topright", col=c("black", "red", "blue"), lwd=lw,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           pt.cex=0.8, cex=0.8)
})

dev.off()