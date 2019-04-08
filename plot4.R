#Exploratory data analysis week 1 assignment
#Plot 4

#read in datafile
hpc<-read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")


#Convert Date variable into date format
hpc$datetime<-paste(hpc$Date,hpc$Time)
hpc$Time2<- strptime(hpc$datetime,"%d/%m/%Y %H:%M:%S")
hpc$Date2<- as.Date(hpc$Date,"%d/%m/%Y")

#keep just the data from 1st and 2nd Feb 2007
mydata<-subset(hpc, hpc$Date2>= as.Date("2007-02-01") & hpc$Date2<=as.Date("2007-02-02"))

#convert factors to numeric
mydata$Sub_metering_1<-as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2<-as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3<-as.numeric(as.character(mydata$Sub_metering_3))
mydata$Global_active_power<-as.numeric(as.character(mydata$Global_active_power))
mydata$Voltage<-as.numeric(as.character(mydata$Voltage))
mydata$Global_reactive_power<-as.numeric(as.character(mydata$Global_reactive_power))


#create chart
png(file="plot4.png",width=480,height=480)
    par(mfrow=c(2,2))
    
    #top left
    plot(mydata$Time2, mydata$Global_active_power, xlab=""
         , ylab="Global Active Power (kilowatts)", type="n",yaxt="n",ylim=c(0,8))
    lines(mydata$Time2, mydata$Global_active_power)
    axis(2,at=c(0,2,4,6))
    
    #top right
    plot(mydata$Time2, mydata$Voltage, xlab="datetime"
         , ylab="Voltage", type="n",yaxt="n",ylim=c(233,247))
    lines(mydata$Time2, mydata$Voltage)
    axis(2,at=c(seq(234,246,2)))
    
    
    #bottom left
    plot(mydata$Time2, mydata$Sub_metering_1, xlab="", ylab="Energy sub metering"
         , type="n",yaxt="n",ylim=c(0,40))
    lines(mydata$Time2, mydata$Sub_metering_1, col="grey44")
    lines(mydata$Time2, mydata$Sub_metering_2, col="red")
    lines(mydata$Time2, mydata$Sub_metering_3, col="blue")
    
    axis(2,at=c(0,10,20,30))
    legend("topright",lty=c(1,1,1),col=c("grey44","red","blue")
           ,legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    #bottom right
    plot(mydata$Time2, mydata$Global_reactive_power, xlab="datetime"
         , ylab="Global_reative_power", type="n",yaxt="n",ylim=c(0,0.51))
    lines(mydata$Time2, mydata$Global_reactive_power)
    axis(2,at=c(0.0,0.1,0.2,0.3,0.4,0.5))
    
    
    
dev.off()