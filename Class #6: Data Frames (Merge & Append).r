month <- rep("Jan",5) #repeat a word numerous times in a vector

spend.jan14 <- data.frame(custID =c(11,12,13,14,15),
                          Spend=rnorm(5,250,30),
                          month)
spend.feb14 <- data.frame(custID =c(11,12,14,16,17),
                          Spend=rnorm(5,260,30),
                          month=rep("Feb",5))

spend.jan14 
spend.feb14 




# Append multiple data frames
spend.jan.feb14 <- rbind(spend.jan14,
                         spend.feb14)
# Names of columns
names(spend.jan.feb14)
## [1] "custID" "Spend"
# Count of rows and columns
ncol(spend.jan.feb14)
nrow(spend.jan.feb14)

# different number of columns

month <- rep("Jan",nrow(spend.jan14))
spend.jan14 <- data.frame(custID =c(11,12,13,14,15),Spend=rnorm(5,250,30))
spend.feb14 <- data.frame(custID =c(11,12,14,16,17),Spend=rnorm(5,260,30),month=rep("Feb",nrow(spend.jan14)))

spend.jan14 
spend.feb14 

# Append multiple data frames
spend.jan.feb14 <- rbind(spend.feb14,
                         spend.jan14
)


### ------------ Merge Data Frames------------------------

cust <- read.table(header=T, text='ID Age Sex Marital_Status
1001 56 F Married
                   1002 45 M Single
                   1003 34 F Single
                   1004 26 M Married
                   1005 47 M Single
                   ')

spend <-read.table(header=T, text='ID        Spend_Amt       Spend_Count 
                   1001    123     3
                   1002    345     5
                   1003    133     4
                   1004    3242    12
                   1006    536     6
                   ')

cust_spend <-merge(cust,
                   spend,
                   by="ID") # Intersection
# Left
cust_spend_left <-merge(cust,
                        spend,
                        by="ID",
                        all.x=TRUE)
# Right
cust_spend_right <-merge(spend,
                         cust,
                         by="ID",
                         all.x=T)

cust_spend_right <-merge(cust,
                         spend,
                         by="ID",
                         all.y=T)

cust_spend_full <-merge(cust,
                        spend,
                        by="ID",
                        all.x=T,
                        all.y=T)



# SQL type joins in R



library(sqldf)

## inner join
sql.cust.spend <- sqldf("SELECT a.*,
                        b.*
                        FROM cust a
                        JOIN spend b USING(ID)
                        ")

sql.cust.spend [,"ID"]
names(sql.cust.spend )

## left join 
sql.cust.spend.left <- sqldf("
                             SELECT a.*,
                             b.*
                             FROM cust a
                             LEFT JOIN spend b USING(ID)
                             ")
## Right join
sql.cust.spend.right <- sqldf("
                              SELECT b.*,
                              a.*
                              FROM spend b
                              left JOIN cust a  USING(ID)
                              ")
