setwd("~/GitHub/ExData_Plotting1")
Sys.setlocale("LC_TIME", "us")

# Code to read data and prepare it if required
if(file.exists("converted.RData")){
  cat("Reading data prepeared for faster processing from converted.RData.\n")
  load("converted.RData")
  
}else{
  cat("Reading original data from zip file. This may take time.\n")
  
  unzip("exdata-data-household_power_consumption.zip")
  d <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, dec=".")
  
  d <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007", ]
  
  d$time = strptime(paste0(d$Date, " ", d$Time), "%d/%m/%Y %H:%M:%S")
  
  save(d, file="converted.RData")
}

#Plot creation
png("plot2.png", width = 480, height = 480)
plot( d$time, as.numeric(d$Global_active_power), 
      ylab="Global Active Power (kilowatts)", 
      xlab="",
      type="n")

lines(d$time, as.numeric(d$Global_active_power))
dev.off()
cat("plot2.png created.\n")