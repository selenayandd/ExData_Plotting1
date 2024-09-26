data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
#只需要2007-2-1到2007-2-2
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subSetData$Global_active_power)
datetime<-strptime(paste(subSetData$Date,subSetData$Time,sep=""),format = "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 