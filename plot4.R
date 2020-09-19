# Author: Ronny Góngora
# Submitting date:
# Title: Project I
# Order: Subplot four plots; plot4.png file
# 
# LOADING THE DATA

epc_twodays<-read.table("household_power_consumption.txt",header = TRUE,
                        sep = ";", dec = ".",skip=grep("31/1/2007;23:58:00",
                                                       readLines("household_power_consumption.txt")),
                        nrows = 2880,col.names = colnames(read.table("household_power_consumption.txt",
                                                                     sep = ";",nrow = 1,header = TRUE)))

# Making plot 3

par(mfrow = c(2,2))
epc_twodays$Date<-as.Date(epc_twodays$Date,format = "%d/%m/%Y")
head(epc_twodays$Date)

dataplot2<-subset(epc_twodays,Date%in%as.Date(c("2007-02-01","2007-02-02")))

# Preparing data for subplot1
#dataplot2$Global_active_power<-as.numeric(dataplot2$Global_active_power)
dataplot2$DateTime<-as.POSIXct(paste(dataplot2$Date,dataplot2$Time))
Date_and_Time<-dataplot2$DateTime

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(Date_and_Time,dataplot2$Global_active_power,type = "l",xlab = "",
     ylab = "Global Active Power")
# Preparing data for subplot2
plot(Date_and_Time, dataplot2$Voltage,type = "l",xlab = "datetime",
     ylab = "Voltage")
# Preparing data for subplot3
plot(x = Date_and_Time,y = dataplot2$Sub_metering_1,xlab = "",type = "l",
     ylab = "Energy sub metering")
lines(x = Date_and_Time,y = dataplot2$Sub_metering_2,col = "red")
lines(x = Date_and_Time,y = dataplot2$Sub_metering_3,col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Preparing data for subplot4
plot(Date_and_Time, dataplot2$Global_reactive_power,type ="l",xlab = "",
     ylab = "Global_reactive_power")

dev.off()
