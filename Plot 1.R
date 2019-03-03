library(dplyr)
srcfile <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
df_srcfile <- tbl_df(srcfile)
dataToUse <- subset(df_srcfile,df_srcfile$Date=="1/2/2007" | df_srcfile$Date=="2/2/2007")
col_global_active_power <- dataToUse$Global_active_power
use_global_active_power <- as.numeric(as.character(col_global_active_power))
png("plot1.png",width=480,height=480)
hist(use_global_active_power,xlab = "Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
