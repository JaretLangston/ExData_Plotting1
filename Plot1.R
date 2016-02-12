plot1 <- function(){
        library(dplyr)
        setwd("~/Documents/ExploratoryDataAnalysis/CourseProject1/ExData_Plotting1")
        #Read the source data in
        filePath <- "~/Documents/ExploratoryDataAnalysis/CourseProject1/data/household_power_consumption.txt"
        rawData <- read.table(filePath,sep = ";", header = TRUE)
        #remove rows not needed, keep only rows with dates 2007-02-01 and 2007-02-02
        rawData <- rawData[rawData$Date=="1/2/2007"|rawData$Date=="2/2/2007",]
        #Plot the histogram
        hist(as.numeric(rawData$Global_active_power)/1000, 
             col = "red", 
             xlab = "Global Active Power (kilowatts)",
             main = "Global Active Power")       
        #copy to png file
        dev.copy(png, file = "plot1.png")
        dev.off()
        
}