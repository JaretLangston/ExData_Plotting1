plot4 <- function(){
        library(dplyr)
        library(lubridate)
        setwd("~/Documents/ExploratoryDataAnalysis/CourseProject1/ExData_Plotting1")
        #Read the source data in
        filePath <- "~/Documents/ExploratoryDataAnalysis/CourseProject1/data/household_power_consumption.txt"
        rawData <- read.table(filePath,sep = ";", header = TRUE)
        #remove rows not needed, keep only rows with dates 2007-02-01 and 2007-02-02
        rawData <- rawData[rawData$Date=="1/2/2007"|rawData$Date=="2/2/2007",]
        updatedData <- cbind(DateTime=strptime(paste(rawData$Date,rawData$Time), "%d/%m/%Y %T"),rawData)
        #Order the data by date
        updatedData[order(updatedData$DateTime),]
        #set the plot grid
        par(mfrow = c(2, 2), mar = c(3, 4, 1, 1))
        #plot global active power
        with(updatedData,plot((as.integer(Global_active_power)/500)~DateTime,ylab = "Global Active Power", type = "l",xlab = ""))
        #plot voltage
        with(updatedData,plot(as.numeric(as.character(Voltage))~DateTime,ylab = "Voltage", type = "l",xlab = "datetime"))
        #plot sub metering 
        with(updatedData,plot(as.numeric(Sub_metering_1)~DateTime,ylab = "Energy sub metering", type = "l",xlab = ""))
        with(updatedData, points(as.integer(Sub_metering_2)~DateTime, col = "red", type = "l"))
        with(updatedData, points(as.integer(Sub_metering_3)~DateTime, col = "blue", type = "l"))
        legend(cex=.75, "topright",lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       #plot global reactive power
        with(updatedData,plot((as.integer(Global_reactive_power)/500)~DateTime, ylab = "Global_reactive_power", type = "l",xlab = "datetime"))
         #copy to png file
        dev.copy(png, file = "plot4.png")
        dev.off()
}