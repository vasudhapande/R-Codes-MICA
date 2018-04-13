## QUESTION 1 ##

getwd()
setwd("/Users/vasudhapande/Documents/MICA/Term 4/AMMA")
employee_CSV <- read.csv("emp.csv")
department_CSV <- read.csv("dept.csv")
#,header= TRUE, sep= ";")

# Merge employee and department by departmentNo #
employee_department_merged <- merge(employee_CSV,department_CSV,by="departmentNO",all = TRUE)

## QUESTION 2 ##

# Average salary by location #
N_employeeLoc <- c(rep(0,nrow(department)))
salaryLoc <- c(rep(0,nrow(department)))

for (i1 in 1:nrow(department))
{
  for (i2 in 1:nrow(employee_department_merged))
  {
    if (!is.na(employee_department_merged$LOC[i2]))
    {  
      if (employee_department_merged$LOC[i2]==department$LOC[i1])
      {
        N_employeeLoc[i1] <- N_employeeLoc[i1] +1
        salaryLoc[i1] <- salaryLoc[i1] + employee_department_merged$SAL[i2]
      }
    }    
  }  
}    

mean_salary_loc <- c(rep(0,nrow(department)))
for (i3 in 1:nrow(department))
{
  mean_salary_loc[i3] <- salaryLoc[i3]/N_employeeLoc[i3]
}

## QUESTION 3 ##

employeeloyee_IDS <- unique(employee_department_merged$ID)
countOfemployeeUnder <- rep(0,length(employeeloyee_IDS))

for (i3 in 1:length(employeeloyee_IDS))
{
  if (!(is.na(employeeloyee_IDS[i3])))
  {
    for (i4 in 1:nrow(employee_department_merged))
    {
      if (!(is.na(employee_department_merged$MGR[i4])))
      {
        if (employee_department_merged$MGR[i4]==employeeloyee_IDS[i3])
        {
          countOfemployeeUnder[i3] <- countOfemployeeUnder[i3] + 1
        }  
        
      }  
      
    }
  }  
  
}

for (i5 in 1:length(employeeloyee_IDS))
{
  if (countOfemployeeUnder[i5]==max(countOfemployeeUnder))
  {
    position <- i5
  }
} 

print("Manager with the highest number of employeeloyees")
print(employee_department_merged$ENAME[position])

## QUESTION 4 ##

employee_csv.df<-read.csv("employee.csv",header=T)
department_csv.df<-read.csv("department.csv",header=T)

employee_department_merged.df=merge(employee_csv.df,department_csv.df,by=c("departmentNO"),all=TRUE)
employee_department_merged_hike.df <- employee_department_merged.df

for(i in 1:nrow(employee_department_merged.df))
{
  if(!is.na(employee_department_merged.df$JOB[i]))
  {
  if(employee_department_merged.df$JOB[i]=="ANALYST")
  {
    employee_department_merged_hike.df$SAL[i] = employee_department_merged.df$SAL[i] + (0.15 * employee_department_merged.df$SAL[i])
  }
  }
}

for(i in 1:nrow(employee_department_merged.df))
{
  if(!is.na(employee_department_merged.df$JOB[i]))
     {
  if(employee_department_merged.df$JOB[i]=="CLERK")
  {
    employee_department_merged_hike.df$SAL[i] = employee_department_merged.df$SAL[i] + (0.125 * employee_department_merged.df$SAL[i])
  }
  }
}

for(i in 1:nrow(employee_department_merged.df))
{
  if(!is.na(employee_department_merged.df$JOB[i]))
     {
  if(employee_department_merged.df$JOB[i]=="MANAGER")
  {
    employee_department_merged_hike.df$SAL[i] = employee_department_merged.df$SAL[i] + (0.102 * employee_department_merged.df$SAL[i])
  }
  }
}

for(i in 1:nrow(employee_department_merged.df))
{
  if(!is.na(employee_department_merged.df$JOB[i]))
  {
  if(employee_department_merged.df$JOB[i]=="PRESIDENT")
  {
    employee_department_merged_hike.df$SAL[i] = employee_department_merged.df$SAL[i] + (0.057 * employee_department_merged.df$SAL[i])
  }
  }
}

for(i in 1:nrow(employee_department_merged.df))
{
  if(!is.na(employee_department_merged.df$JOB[i]))
{
  if(employee_department_merged.df$JOB[i]=="SALESMAN")
  {
    employee_department_merged_hike.df$SAL[i] = employee_department_merged.df$SAL[i] + (0.133 * employee_department_merged.df$SAL[i])
  }
  }
}

## Increased Salaries DataFrame
View(employee_department_merged_hike.df)
