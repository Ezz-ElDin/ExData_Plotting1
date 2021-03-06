#loading the dataset
df <- read.csv("household_power_consumption.txt", sep = ';', header = TRUE, colClasses = c("character","character","numeric",
                                                                                           "numeric","numeric","numeric","numeric","numeric","numeric"),na.string = "?")

#investigating the variables
str(df)

#Converting the Date variable into Date/Time class
df[, "Date"] <- as.Date(df$Date, "%d/%m/%Y")

#Subsetting the dataset
data <- subset(df, df$Date == "2007-02-02" | df$Date == "2007-02-01")

#setting Datetime variable
datetime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(datetime)
str(data)

#creating plot
with(data, plot(Sub_metering_1~DateTime, type="l", xlab="", ylab="Energy sub metering"))
lines(data$Sub_metering_2 ~ data$DateTime, col = "Red")
lines(data$Sub_metering_3 ~ data$DateTime, col = 'Blue')
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)

#Saving the plot
dev.copy(png, file="plot_3.png",height = 480, width = 480)
dev.off()
