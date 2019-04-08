#Exploratory data analysis week 1 assignment
#Plot 2

#read in datafile
hpc<-read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

#convert date field to date
hpc$Date2<- as.Date(hpc$Date,"%d/%m/%Y")

#keep just the data from 1st and 2nd Feb 2007
mydata<-subset(hpc, hpc$Date2>= as.Date("2007-02-01") & hpc$Date2<=as.Date("2007-02-02"))


#Convert Date variable into date format
mydata$datetime<-paste(mydata$Date,mydata$Time)
mydata$Time2<- strptime(mydata$datetime,"%d/%m/%Y %H:%M:%S")

#convert global active power to numeric
mydata$Global_active_power<-as.numeric(as.character(mydata$Global_active_power))

#remove blank data
mydata<-subset(mydata,mydata$Global_active_power != "?")

#create chart
png(file="plot2.png",width=480,height=480)
    plot(mydata$Time2, mydata$Global_active_power, xlab=""
            , ylab="Global Active Power (kilowatts)", type="n",yaxt="n",ylim=c(0,8))
    lines(mydata$Time2, mydata$Global_active_power)
    axis(2,at=c(0,2,4,6))
dev.off()