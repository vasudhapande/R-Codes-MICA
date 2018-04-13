birth_date <- as.Date("11-Oct-1989",format="%d-%b-%Y")
birth_date
age <- difftime(Sys.Date(),birth_date,units="days")
as.integer(as.numeric(age)/365)
