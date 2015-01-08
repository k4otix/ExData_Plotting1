# plot2.R - R code to generate plot2.png

# Read the data file (already limited to data for Feb. 1-2, 2007)
data <- read.csv("household_power_2days.txt", sep=";", stringsAsFactors=FALSE)

# Convert Date & Time variables to Date/Time classes
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Create the plot, slight adjustment to size of axis labels
with(data, {
    plot(Time, Global_active_power, type="n", xlab="", 
         ylab="Global Active Power (kilowatts)",
         cex.axis=0.8, cex.lab=0.9)
    lines(Time, Global_active_power)
})

# Write to PNG, default size is 480x480
dev.copy(png, file="plot2.png", bg="transparent")
dev.off()