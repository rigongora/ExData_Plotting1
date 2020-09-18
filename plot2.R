# Author: Ronny Góngora
# Submitting date:
# Title: Project I
# Order: Line plot of Days vs Global active power; plot2.png file
# 
# LOADING THE DATA

epc_twodays<-read.table("household_power_consumption.txt",header = TRUE,
                        sep = ";", dec = ".",skip=grep("31/1/2007;23:58:00",
                                                       readLines("household_power_consumption.txt")),
                        nrows=2880,col.names = colnames(read.table("household_power_consumption.txt",
                                                                   sep = ";",nrow = 1,header = TRUE)))
# Making plot 2
epc_twodays$Date<-as.Date(epc_twodays$Date,format = "%d/%m/%Y")
head(epc_twodays$Date)

dataplot2<-subset(epc_twodays,Date%in%as.Date(c("2007-02-01","2007-02-02")))
dataplot2$DateTime<-as.POSIXct(paste(dataplot2$Date,dataplot2$Time))
dataplot2$Global_active_power<-as.numeric(dataplot2$Global_active_power)
Date_and_Time<-dataplot2$DateTime

plot(x= Date_and_Time,y= epc_twodays$Global_active_power,type ="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png,file = "plot2.png",width = 480, height = 480)
dev.off()

