plot2 <- function(){
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
        #Plot the data
        
        with(updatedData,plot((as.integer(rawData$Global_active_power)/500)~DateTime,
                                   ylab = "Global Active Power (kilowatts)", 
                              type = "l",
                              xlab = ""))
             
        #copy to png file
        dev.copy(png, file = "plot2.png")
        dev.off()
}