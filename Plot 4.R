library(dplyr)
srcfile <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
df_srcfile <- tbl_df(srcfile)
dataToUse <- subset(df_srcfile,df_srcfile$Date=="1/2/2007" | df_srcfile$Date=="2/2/2007")
col_global_active_power <- dataToUse$Global_active_power
use_global_active_power <- as.numeric(as.character(col_global_active_power))
dev.flush()
dev.set(4)

png("plot5.png",width=480,height=480)

get_datetime = paste(dataToUse$Date, dataToUse$Time, sep=" ")
x_datetime <- strptime(get_datetime,"%d/%m/%Y %H:%M:%S")

sub_meter_1 <- as.numeric(as.character(dataToUse$Sub_metering_1))
sub_meter_2 <- as.numeric(as.character(dataToUse$Sub_metering_2))
sub_meter_3 <- as.numeric(as.character(dataToUse$Sub_metering_3))

par(mfrow=c(2,2))

plot(x_datetime,use_global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

col_voltage <- dataToUse$Voltage
use_voltage <- as.numeric(as.character(col_voltage))
plot(x_datetime,use_voltage,type="l",xlab="datetime",ylab="Voltage")

plot(x_datetime,sub_meter_1,type="l",xlab="",ylab="Energy Sub Metering",col="black",ylim=c(0,40))
par(new=TRUE)
plot(x_datetime,sub_meter_2,type="l",xlab="",ylab="Energy Sub Metering",col="red",ylim=c(0,40))
par(new=TRUE)
plot(x_datetime,sub_meter_3,type="l",xlab="",ylab="Energy Sub Metering",col="blue",ylim=c(0,40))
par(new=TRUE)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

col_global_reactive_power <- dataToUse$Global_reactive_power
use_global_reactive_power <- as.numeric(as.character(col_global_reactive_power))
plot(x_datetime,use_global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()

