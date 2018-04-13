#Package installation

install.packages("rvest")
library("rvest")
install.packages("xml2")
library("xml2")

#Pulling data from the web

odi_link = "https://en.wikipedia.org/wiki/India%E2%80%93Pakistan_cricket_rivalry"
odi_file = read_html(odi_link)
odi_table_temp = html_nodes(odi_file,"table")
odi_table <- html_table(odi_table_temp[2],fill= TRUE)
View(odi_table)
odi_data=as.data.frame(odi_table)
View(odi_data)

#Calculating wins

odi_data$total_wins = odi_data$Test + odi_data$ODI + odi_data$T20I
wins_India <- odi_data[3,5]
View(wins_India)
