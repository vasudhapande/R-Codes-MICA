setwd("/Users/vasudhapande/Documents/MICA/Term 4/AMMA")

#Reading .csv file and removing the last variable

infant_mort_rates <- read_csv("/Users/vasudhapande/Documents/MICA/Term 4/AMMA/Infant mortality rates.csv")
infant_mort_rates$`Flag Codes`<- NULL
View(infant_mort_rates)
