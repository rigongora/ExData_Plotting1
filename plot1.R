# Author: Ronny Góngora
# Submitting date:
# Title: Project I
# order: Histogram of Global active power; plot1.png file
# 
# LOADING THE DATA

epc_twodays<-read.table("household_power_consumption.txt",header = TRUE,
                   sep = ";", dec = ".",skip=grep("31/1/2007;23:58:00",
                                                  readLines("household_power_consumption.txt")),
                   nrows=2880,col.names = colnames(read.table("household_power_consumption.txt",
                                                              sep = ";",nrow = 1,header = TRUE)))
# Making plot 1

head(epc_twodays)

hist(epc_twodays$Global_active_power, main = "Global Active Power",
     col = "red", xlab = "Global Active Power (kilowatts)")

dev.copy(png,file = "plot1.png",width = 480, height = 480)
dev.off()


