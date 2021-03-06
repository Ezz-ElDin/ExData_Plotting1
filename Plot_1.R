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

#creating first plot
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

#Saving the plot
dev.copy(png, file="plot_1.png",height = 480, width = 480)
dev.off()
