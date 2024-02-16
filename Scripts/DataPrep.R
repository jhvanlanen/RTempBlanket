# data prep 

library(readxl)

getwd()
mydatafolder <- "D:/Rcreations/RTempBlanket/Data/"

myTdata <- read_xlsx(path = paste0(mydatafolder, "TempData1995.xlsx"))
test <- read.csv(file = paste0(mydatafolder, "BlanketData.csv"), 
                      header = TRUE, sep = ",")

TempData <- data.frame(Day = c(1:365), 
                       Av  = myTdata$gem, 
                       Max = myTdata$max,
                       Min = myTdata$min)

SunTimes <- c()
for (col in c(1:ncol(mySUNdata))){
  SunTimes <- c(SunTimes, mySUNdata[,col])
}
SunTimes <- SunTimes[!is.na(SunTimes)]

n=1
SunUp   <- c()
SunDown <- c()
for (item in c(1:(length(SunTimes)/2))) {
  SunUp <- c(SunUp, SunTimes[n])
  SunDown <- c(SunDown, SunTimes[n+1])
  n = n+2
}

SunData  <- data.frame(Day  = c(1:365), 
                       Up   = SunUp[1:365], 
                       Down = SunDown[1:365])

BlanketData <- merge(SunData, TempData)

write.csv(BlanketData, file = paste0(mydatafolder, "BlanketData.csv"))



