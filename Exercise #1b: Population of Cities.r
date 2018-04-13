#Package installation

install.packages("rvest")
library("rvest")
install.packages("xml2")
library("xml2")

#Pulling data from the web, and creating a data frame

cities_link = "http://www.worldatlas.com/articles/the-biggest-cities-in-india.html"
cities_file = read_html(cities_link)
cities_table_temp = html_nodes(cities_file,"table")
cities_table <- html_table(cities_table_temp,fill=TRUE)
View(cities_table)
cities_data = as.data.frame(cities_table)
view(cities_data)
