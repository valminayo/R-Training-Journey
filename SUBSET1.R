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


#EXERCISE 1.
#ABasic Subsetting

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


#B Conditional Subsetting
#Get rows where Temp is above 85 AND Wind is less than 10.
#Extract rows where Solar.R is missing (NA).
#Get all rows where Ozone is between 50 and 100.
#Subset observations where Month is either May (5) or September (9).
#Get the Day and Temp for days when Ozone is missing but Solar.R is above 200.

AQ
#Get rows where Temp is above 85 AND Wind is less than 10.
 library(dplyr)
AQ %>% filter(Temp>85 & Wind<10)

#Extract rows where Solar.R is missing (NA).
AQ %>% filter(is.na(Solar.R))

#Get all rows where Ozone is between 50 and 100.
AQ %>% filter(Ozone >= 50 & Ozone<=100)
 #
OR

AQ %>% filter(between(Ozone, 50,100))

#Subset observations where Month is either May (5) or September (9).

AQ %>% filter(Month ==5 | Month==9)

#OR
AQ %>% filter(Month %in% c(5,9))

#Get the Day and Temp for days when Ozone is missing but Solar.R is above 200
#Start by having varibales of interest-select#
#Then apply the conditions

AQ %>% select(Day, Temp,Ozone, Solar.R) %>% 
  filter(is.na(Ozone) & Solar.R>200)


#EXERCISE 2
#Link to the exercise
#https://drive.google.com/file/d/1_i-6SPHfHU3sfaAIsKLi3W7bPTTXyJ8n/view?usp=drive_link


#Part 1: Exploring and Inspecting Data (10 min)
#1Load the airquality dataset. How many rows and columns does it have?
#2. What is the class of the Temp variable in airquality?
#3. What does the summary() of airquality tell you about missing values?
#4. Now explore the mtcars dataset. How many variables are in it?
# 5. What are the names of the columns in mtcars?
  
data("airquality")
DF<-airquality
dim(DF)

#153 rows and 6 colums

#2
str(DF)

#temp is in class of integers

#3
summary(DF) # Ozone has 37 missing values and Solar.R has 7, the rest of the variables do not have missing values


#4
data(mtcars)
dim(mtcars) # 31 observasions, 11 variables
 
names(mtcars)

#Part 2: Accessing and Modifying Data (10 min)
#6. Extract only the Temp column from airquality?
#7. What is the mean of the Temp column?
#8. Retrieve the first five rows and all columns of the mtcars dataset.
#9. Add a new column to airquality that combines temperature and wind (e.g., Temp minus  Wind). What would you name it?
#10. Suppose each temperature value in airquality was accidentally increased by 10. How would you correct this?
#11. Calculate the mean Ozone value for each month included in the airquality dataset.

AQ
AQ %>% select(Temp)  #6
mean(AQ$Temp)  # 77.88235

mtcars
mtcars[,5]
head(mtcars,5)  #8
head(mtcars)
head(mtcars,2)

AQ
AQ1<- AQ %>% mutate(Temp_W= Temp - Wind) #9

AQ$Acc_Temp<- AQ$Temp-10  #10
AQ


library(dplyr)

airquality %>%
  group_by(Month) %>%
  summarise(mean_Ozone = mean(Ozone, na.rm = TRUE))

#Part 3: Subsetting Data (5 min)
#11. Extract the first row from the mtcars dataset.
#12. From airquality, extract only the rows where temperature exceeds 65 degrees.
#13. From mtcars, extract all cars that have more than 6 cylinders.
#14. Calculate the mean mpg for each category of engine cylinders.

mtcars
mtcars[1,] #11
mtcars[1,1]

mtcars %>% filter(mpg>6)
