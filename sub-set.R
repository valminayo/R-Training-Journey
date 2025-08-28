#DATA FRAMES IN R
#DATA FRAMES = Rows( observations) + Coluns(variables)
#data frams are foundation of analysis n contains multiple of variables

#how to create data frame in R

grade4 <- data.frame(
  Names = c("Ayden", "Val", "Kelan", "rose"),
  Age = c(8, 26, 29,31),
  residence = c("Richland", "banana", "kwest", "kiambu")
)

grade4

#check structure
str(grade4)  #checking the structure/data type
summary(grade4) #generate all summaries
head(grade4)
View(grade4)


#Assessing columns

grade4$residence
grade4$Age


#use inbuilt data set to practice
airquality
?
?airquality

df1<- airquality
head(df)
str(df)
summary(df)
df

names(df)
glimpse(df)
dim(df)

#how to asses colums and rows/ sun-set data
#you can use the $ 

df$Ozone
df$Temp

summary(df$Wind)

df[, "Temp"]

sub1<- df[, c("Temp", "Solar.R")]
head(sub1) 

df[c(1,2,3),]

analysis1<-df


#we use sub-set on a givem condition

may<- df1[df1$Month==5,]

temp70 <- df1[df1$Temp>70, ]

#adding new column
#add new colunm calle temp_wing= Temp+wind

df1$temp_wind<- df1$Temp + df1$Wind
mean(df1$temp_wind)

#changing column values 
#ie maybe values were added by mistake, temp was added 10by mistake,, remove 10 on the temp variable

df_accurate <- df1$Temp-10
df1$temp_acc<- df1$Temp -10
View(df1)


#EXERCISE 1.Basic Subsetting

#Extract all rows where Month is June (6).
#Select only the Ozone and Temp columns.
#Get the first 10 rows of the dataset.
#Show only the Temp values for July (Month = 7).
#Subset rows where Ozone is greater than 100.


# Rows where month is june

data("airquality")

AQ<-airquality

head(AQ)
tail(AQ)

str(AQ)
names(AQ)

AQ[AQ$Month==6, ]

#Select only the Ozone and Temp columns.

AQ[, c("Ozone", "Temp")]

head(AQ,10)

#Show only the Temp values for July (Month = 7).
AQ[AQ$Month == 7, "Temp"]

#OR


library(dplyr)


library(dplyr)
AQ %>% filter(Month == 7) %>% pull(Temp)

#Subset rows where Ozone is greater than 100.
AQ %>% filter("Ozone" >100)

AQ[AQ$Ozone>100,]


#Conditional Subsetting
#Get rows where Temp is above 85 AND Wind is less than 10.
Extract rows where Solar.R is missing (NA).

Get all rows where Ozone is between 50 and 100.

Subset observations where Month is either May (5) or September (9).

Get the Day and Temp for days when Ozone is missing but Solar.R is above 200.