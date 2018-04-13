getwd()
setwd("/Users/vasudhapande/Documents/MICA/Term 4/AMMA")

d1 = read.table("student-mat.csv",sep=";",header=TRUE)
d2 = read.table("student-por.csv",sep=";",header=TRUE)

d3 = merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
print(nrow(d3))
View(d1)
View(d3)
class(d3)

f_avg_grade=0
m_avg_grade=0

for(i in 1:length(d3$G3.x))
{
  if(d3$sex[i]=="F")
  {  f_avg_grade = f_avg_grade + d3$G3.x[i] + d3$G3.y[i]
  }
  else
  {
    m_avg_grade = m_avg_grade + d3$G3.x[i] + d3$G3.y[i]
  }
}
m_avg_grade = m_avg_grade/length(d3$G3.x)
f_avg_grade = f_avg_grade/length(d3$G3.x)
  
m_avg_grade
f_avg_grade 
  

## PART 2
  
max_G1 = max(d3$G1.x + d3$G1.y)
max_G2 = max(d3$G2.x + d3$G2.y)
max_G3 = max(d3$G3.x + d3$G3.y)
  
for(j in 1:length(d3$G3.x))
{  
    if(d3$G1.x[j]+d3$G1.y[j] == max_G1)
      {Guardian_G1 = d3$guardian.x[j]
      Gender_G1 = d3$sex[j]
    }
}  
Guardian_G1
Gender_G1
  
for(j in 1:length(d3$G3.x))
{  
    if(d3$G2.x[j]+d3$G2.y[j] == max_G1)
    {Guardian_G2 = d3$guardian.x[j]
    Gender_G2 = d3$sex[j]
    }
}  
Guardian_G2
Gender_G2
  
for(j in 1:length(d3$G3.x))
{  
    if(d3$G3.x[j]+d3$G3.y[j] == max_G1)
    {Guardian_G3 = d3$guardian.x[j]
    Gender_G3 = d3$sex[j]
    }
}  
Guardian_G3
Gender_G3
  
