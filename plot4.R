# COURE PROJECT ASSIGNMENT EXPLORATORY DATA ANALYSIS (WEEK 1) - PLOT 4

# set working directory and download data
setwd("/Users/irinamartin/Documents/Data Science Specialization - John Hopkins University/Slides/Course 4/Week 1")
if (!file.exists("data")){
        dir.create("data")
}
Directory<-getwd()
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,file.path(Directory, "electricityzipped.zip"))
unzip(zipfile = "electricityzipped.zip")

electricity<-read.table(file.path(Directory,"/household_power_consumption.txt"), header =TRUE, sep=";", na.strings = "?")
electricity$Date<-as.Date(electricity$Date,"%d/%m/%Y")
DateVector<-as.Date(c("2007-02-01","2007-02-02"))
electricityshort<-electricity[electricity$Date == DateVector,]
electricityshort$DateTime<-strptime(paste(electricityshort$Date, electricityshort$Time), format = "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME","en_US")

png('plot4.png', width = 480, height = 480)
par(mfrow=c(2,2),mar=c(4,4,4,4))
with(electricityshort,{
        plot(electricityshort$DateTime,electricityshort$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
        plot(electricityshort$DateTime,electricityshort$Voltage, type = "l", ylab = "datetime", xlab = "Voltage")
        plot(electricityshort$DateTime,electricityshort$Sub_metering_1, type="l", col="black", ylab = "Energy sub metering", xlab = "")
        lines(electricityshort$DateTime, electricityshort$Sub_metering_2, type = "l", col = "red")
        lines(electricityshort$DateTime, electricityshort$Sub_metering_3, type = "l", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"),inset=0, cex=0.9, bty="n")
        plot(electricityshort$DateTime, electricityshort$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})

dev.off()