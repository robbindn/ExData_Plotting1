### Plot 3###
electric_df <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
electric_df$newdate <- strptime(electric_df$Date,format="%d/%m/%Y")
electric_sm_df <- electric_df[electric_df$newdate == "2007-02-01" | electric_df$newdate == "2007-02-02" ,]
electric_sm_df$combined <- paste(electric_sm_df$Date,electric_sm_df$Time,sep=" ")
electric_sm_df$combined_date <- strptime(electric_sm_df$combined, "%d/%m/%Y %H:%M:%S")
electric_sm_df$Sub_metering_1 <- as.numeric(as.character(electric_sm_df$Sub_metering_1))
electric_sm_df$Sub_metering_2 <- as.numeric(as.character(electric_sm_df$Sub_metering_2))
electric_sm_df$Sub_metering_3 <- as.numeric(as.character(electric_sm_df$Sub_metering_3))
png("plot3.png")
with (electric_sm_df, {
  plot(combined_date,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering",ylim=c(0,40))
  par(new=TRUE)
  plot(combined_date,Sub_metering_2,type="l",col="red",xlab="",ylab="Energy sub metering",ylim=c(0,40))
  par(new=TRUE)
  plot(combined_date,Sub_metering_3,type="l",col="blue",xlab="",ylab="Energy sub metering",ylim=c(0,40))
})
legend("topright",lty = 1:1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
