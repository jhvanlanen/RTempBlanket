
# library
library(ggplot2)
library(dplyr)


# Loading data
mydatafolder <- "D:/Rcreations/RTempBlanket/Data/"
data <- read.csv(file = paste0(mydatafolder, "BlanketData.csv"))
mydata <- data[,2:ncol(data)]


# binning temperatures??
#dat%>%
#  mutate(quantile = ntile(col2,100))%>%group_by(quantile)%>%
#  summarize(sumValueInInterval = sum(col3))



# day & night times to factor
Up   <- mydata$Up 
Down <- mydata$Down
day  <- Down-Up

Days <- rep(mydata$Day, 3)
Times <- c(rep("3 Morning", nrow(mydata)), rep("2 Day", nrow(mydata)), rep("1 Evening", nrow(mydata)))
Value <- c(Up, day, 1-day)

plotdata <- data.frame(Days, Times, Value)

ggplot(plotdata, aes(fill=Times, y=Value, x=Days)) + 
  geom_bar(position="fill", stat="identity") +
  theme_minimal()
