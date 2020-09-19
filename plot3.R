# Author: Ronny Góngora
# Submitting date:
# Title: Project I
# Order: Line plot of Days vs Energy Sub metering; plot3.png file
# 
# LOADING THE DATA

epc_twodays<-read.table("household_power_consumption.txt",header = TRUE,
                        sep = ";", dec = ".",skip=grep("31/1/2007;23:58:00",
                                                       readLines("household_power_consumption.txt")),
                        nrows = 2880,col.names = colnames(read.table("household_power_consumption.txt",
                                                                   sep = ";",nrow = 1,header = TRUE)))

# Making plot 3
epc_twodays$Date<-as.Date(epc_twodays$Date,format = "%d/%m/%Y")
head(epc_twodays$Date)

dataplot2<-subset(epc_twodays,Date%in%as.Date(c("2007-02-01","2007-02-02")))
dataplot2$DateTime<-as.POSIXct(paste(dataplot2$Date,dataplot2$Time))
Date_and_Time<-dataplot2$DateTime

png("plot3.png", width=480, height=480)
plot(x = Date_and_Time,y = dataplot2$Sub_metering_1,xlab = "",type = "l",
     ylab = "Energy sub metering")
lines(x = Date_and_Time,y = dataplot2$Sub_metering_2,col = "red")
lines(x = Date_and_Time,y = dataplot2$Sub_metering_3,col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
