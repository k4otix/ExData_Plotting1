# plot4.R - R code to generate plot4.png

# Read the data file (already limited to data for Feb. 1-2, 2007)
data <- read.csv("household_power_2days.txt", sep=";", stringsAsFactors=FALSE)

# Convert Date & Time variables to Date/Time classes
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Create the plots
png(file="plot4.png", bg="transparent")  # png default size is 480x480
with(data, {
    par(mfrow=c(2,2))
    # Global Active Power - mostly default values, adjust font size
    plot(Time, Global_active_power, type="n", xlab="", 
         ylab="Global Active Power", cex.axis=0.9, cex.lab=0.9)
    lines(Time, Global_active_power)
    # Voltage - plot without y-axis, then add y-axis ticks/labels after
    plot(Time, Voltage, type="n", xlab="datetime", ylab="Voltage",
         ylim=c(233,247), yaxt="n", cex.axis=0.9, cex.lab=0.9)
    axis(side=2, at=seq(234,246,2), label=c("234","","238","","242","","246"))
    lines(Time, Voltage)
    # Energy sub metering - same settings as plot3, remove box from legend
    lw = c(1.5, 1.5, 1.5)  # use a slightly thicker line width
    plot(Time, Sub_metering_1, type="n", cex.axis=0.9, cex.lab=0.9, xlab="", 
         ylab="Energy sub metering")
    lines(Time, Sub_metering_1, lwd=lw)
    lines(Time, Sub_metering_2, col="red", lwd=lw)
    lines(Time, Sub_metering_3, col="blue", lwd=lw)
    legend("topright", col=c("black", "red", "blue"), lwd=lw, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           pt.cex=0.9, cex=0.9)
    # Global reactive power - adjust ylim for scale on y-axis
    plot(Time, Global_reactive_power, type="n", xlab="datetime", 
         ylim=c(0.0,0.5), cex.axis=0.9, cex.lab=0.9)
    lines(Time, Global_reactive_power)
})

dev.off()