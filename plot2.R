### Plot 2###
electric_df <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
electric_df$newdate <- strptime(electric_df$Date,format="%d/%m/%Y")
electric_sm_df <- electric_df[electric_df$newdate == "2007-02-01" | electric_df$newdate == "2007-02-02" ,]
electric_sm_df$combined <- paste(electric_sm_df$Date,electric_sm_df$Time,sep=" ")
electric_sm_df$combined_date <- strptime(electric_sm_df$combined, "%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(electric_sm_df$combined_date,as.numeric(as.character(electric_sm_df$Global_active_power)),type="l",xlab="",ylab="Global Active Power")
dev.off()
