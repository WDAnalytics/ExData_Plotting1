#Exploratory data analysis week 1 assignment
#Plot 3

#read in datafile
hpc<-read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")


#Convert Date variable into date format
hpc$Date2<- as.Date(hpc$Date,"%d/%m/%Y")


#keep just the data from 1st and 2nd Feb 2007
mydata<-subset(hpc, hpc$Date2>= as.Date("2007-02-01") & hpc$Date2<=as.Date("2007-02-02"))

#Convert Date variable into date format
mydata$datetime<-paste(mydata$Date,mydata$Time)

mydata$Time2<- strptime(mydata$datetime,"%d/%m/%Y %H:%M:%S")
mydata$Date2<- as.Date(mydata$Date,"%d/%m/%Y")



#convert submetering to numeric
mydata$Sub_metering_1<-as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2<-as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3<-as.numeric(as.character(mydata$Sub_metering_3))


#create chart
png(file="plot3.png",width=480,height=480)
    plot(mydata$Time2, mydata$Sub_metering_1, xlab="", ylab="Energy sub metering"
            , type="n",yaxt="n",ylim=c(0,40))
    lines(mydata$Time2, mydata$Sub_metering_1, col="grey44")
    lines(mydata$Time2, mydata$Sub_metering_2, col="red")
    lines(mydata$Time2, mydata$Sub_metering_3, col="blue")

    axis(2,at=c(0,10,20,30))
    legend("topright",lty=c(1,1,1),col=c("grey44","red","blue")
            ,legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()