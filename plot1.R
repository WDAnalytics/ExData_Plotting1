#Exploratory data analysis week 1 assignment
#Plot 1

#read in datafile
hpc<-read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")


#Convert Date variable into date format

hpc$Date2<- as.Date(hpc$Date,"%d/%m/%Y")

#keep just the data from 1st and 2nd Feb 2007
mydata<-subset(hpc, hpc$Date2>= as.Date("2007-02-01") & hpc$Date2<=as.Date("2007-02-02"))

#convert dates and times
hpc$datetime<-paste(hpc$Date,hpc$Time)
hpc$Time2<- strptime(hpc$datetime,"%d/%m/%Y %H:%M:%S")

#convert global active power to numeric
mydata$Global_active_power<-as.numeric(as.character(mydata$Global_active_power))


#plot graph in png file
png(file="plot1.png",width=480,height=480)
hist(mydata$Global_active_power, 
     col="red",
     xlab = "Global Active Power (kilowatts)",
     main= "Global Active Power", 
     xlim=c(0,8),
     xaxt="n",
     yaxt="n"
)
axis(1,at=c(0,2,4,6), xlim=c(0,8))
axis(2,at=c(0,200,400,600,800,1000,1200), ylim=c(0,1200))
dev.off()