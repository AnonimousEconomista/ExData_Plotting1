# COURE PROJECT ASSIGNMENT EXPLORATORY DATA ANALYSIS (WEEK 1) - PLOT 1

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

png('plot1.png', width = 480, height = 480)
hist(electricityshort$Global_active_power, main= "Global Active Power", col= "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()