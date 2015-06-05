### Plot 1 ###
electric_df <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
electric_df$newdate <- strptime(electric_df$Date,format="%d/%m/%Y")
electric_sm_df <- electric_df[electric_df$newdate == "2007-02-01" | electric_df$newdate == "2007-02-02" ,]
png("plot1.png")
hist(as.numeric(as.character(electric_sm_df$Global_active_power)),col="red",
     xlab = "Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
