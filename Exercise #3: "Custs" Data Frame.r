normince = rnorm(100,mean=250000,sd=75000)
norminc
mean(norminc)
sd(norminc)

gender=c(rep("F",100))
i=sample(1:100,100,replace=FALSE)
for(q in 1:100){
  if(gender[i[q]] == "F" &&  q <= 40)
  {}
  else
      gender[i[q]] = c("M")
}
gender

Custs <- data.frame(ID=1:100, INCOME <- norminc, GENDER = gender)
View(Custs)
