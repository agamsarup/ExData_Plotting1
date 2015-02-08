df<-read.table("../household_power_consumption.txt",header = T, sep = ";",stringsAsFactors = F)
df[,1]<-as.Date(df[,1],"%d/%m/%Y")
dfs<-subset(df,Date<="2007-2-2" & Date>="2007-2-1")
dates<-as.POSIXct(paste(dfs$Date, dfs$Time), format="%Y-%m-%d %H:%M:%S")
par(mfrow = c(2, 2))

plot(dates,as.numeric(dfs[,3]),xlab="",ylab = "Global Active Power",type="l")

plot(dates,as.numeric(dfs[,5]),xlab="datetime",ylab = "Voltage",type="l")

plot(dates,as.numeric(dfs[,7]),xlab="",ylab = "Energy sub metering",type="l")
lines(dates,as.numeric(dfs[,8]),col="red")
lines(dates,as.numeric(dfs[,9]),col="blue")
legend("topright", lwd = 1, col = c("black", "red","blue"), legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty = "n",pt.cex = 1,cex=0.5)

plot(dates,as.numeric(dfs[,4]),xlab="datetime",ylab = "Global_reactive_power",type="l")

dev.copy(png,file="plot4.png")
dev.off()