#Package installation

install.packages("data.table")
install.packages("datasets")
library("datasets")
setwd("/Users/vasudhapande/Documents/MICA/Term 4/AMMA")

#Storing relevant data in temp_women data frame, and computing average heights and weights

temp_women <- data.frame(women)
avg.height=mean(women$height)
avg.weight=mean(women$weight)

#Finding the number of women with height greater than average and weight less than average

women_df<-subset(women,height>mean.height & weight<mean.weight)
