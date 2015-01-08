# plot3.R - R code to generate plot3.png

# Read the data file (already limited to data for Feb. 1-2, 2007)
data <- read.csv("household_power_2days.txt", sep=";", stringsAsFactors=FALSE)

# Convert Date & Time variables to Date/Time classes
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Create the plot
with(data, {
    lw = c(1.5, 1.5, 1.5)  # adjust line width, font sizes
    plot(Time, Sub_metering_1, type="n", xlab="", 
         ylab="Energy sub metering", cex.axis=0.8, cex.lab=0.8)
    lines(Time, Sub_metering_1, lwd=lw)
    lines(Time, Sub_metering_2, col="red", lwd=lw)
    lines(Time, Sub_metering_3, col="blue", lwd=lw)
    legend("topright", col=c("black", "red", "blue"), lwd=lw,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           pt.cex=0.85, cex=0.85)
})

# Write to PNG, default size is 480x480
dev.copy(png, file="plot3.png", bg="transparent")
dev.off()