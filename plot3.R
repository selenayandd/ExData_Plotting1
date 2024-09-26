data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
#只需要2007-2-1到2007-2-2
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#设置时间格式为POSIXlt格式
datetime<-strptime(paste(subSetData$Date,subSetData$Time,srp=""),format = "%d/%m/%Y %H:%M:%S")
#读取纵坐标
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime,subMetering1,type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright",c("subMetering1","subMetering2","subMetering3"),col=c("black","red","blue"))
dev.off() 