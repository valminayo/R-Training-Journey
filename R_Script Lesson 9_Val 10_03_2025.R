#LESSON 1 21/02/2025#
vm<-mtcars
head(vm)
tail(vm)
max("mpg") #trying to get max of mpg
VM[,"wt"]
vm[, "wt"] # this code is similar to code no 8, ie they give same results (checking the values of a paticular variable, in this case id "wt")
vm[,6]
vm[1:11] #checking the whole data set 
vm$wt # this is also similar to code 7 and 8
vm[,c("mpg","cyl","hp","vs","gear")] #selecting variable of interest for analysis, in my case i want wo work with "mpg", "cyl","hp","vs" and gear"
vm1<-vm[,c("mpg","cyl","hp","vs","gear")] #new name for my variables of interest
head(vm[,c("mpg","cyl","hp","vs","gear")]) #list of the first 5 observations
tail(vm[,c("mpg","cyl","hp","vs","gear")])
view(vm1) ##thsi code is not correct, trying to view the entire data set (the new one)

#summary statistics
mean("mpg")
mean(vm1$mpg)     
summary(vm1$mpg)
summary(vm1$mpg,hp)
summary(vm1$mpg,cyl,hp,vs,gear)
summary(vm1)
summary(vm1$vs)
sd(vm$gear)
sd(vm$hp)

#Filtering
vm1
vm %>%select(mpg,cyl,vs, gear) # R could not find the %>% because the packages had not been downloaded
 #load dlpyr, tidyverse and gapmider
vm %>%select(mpg,cyl,vs, gear)
library(dplyr)
vm %>%select(mpg,cyl,vs, gear)
vm1 %>% select(mpg,cyl,hp,vs,gear)

##Review from Tutor##
#1.	Line 15 is not working because you have used the small letter “v” for view. It should be View(vm1). “V” should be capitalized. R is case-sensitive.
#2.	Line 18 is wrong but I see you corrected it on line 19.
#3.	You can use the select function and the pipe (%>%) functions from the dplyr package  to subset dataset. The function does the same thing as the $ and [ ] but is more intuitive. I see you have correctly used it at lines 34 and 35. 
#4.	Please note that you can create a new dataset after using the select function. For example, you could name a dataset vm1 and store the operation you have done at line 34, i.e. your line 35 should look like      vm1 <- vm %>% select(mpg,cyl,hp,vs,gear)
#5.	Filtering and selecting are two different but related operations. Both are used to subset data. While select is based on reducing the data by columns (e.g. selecting two columns/variables from a dataset with 10 variables), filter is used to “select” rows/observations based on a given condition. For example, you may want to “select” cars that have 4 gears on the mtcars dataset. The correct code would be:
  
        #filter(name_dataset, condition) – without having to use pipe
        # name_dataset %>% filter(condition) -using pipe
        #filter(vm, gear == 4) – without having to use pipe (%>% )
        #vm %>% filter(gear == 4) – using the pipe operator
        #you can then save the newly created dataset (cars with only 4 gears as follows:
                                              # vm3 <- filter(vm, gear == 4)  or
                                             #vm3 <- vm %>% filter(gear == 4)
View(vm)
ls(vm)
library(dplyr)
vm2<-vm %>% select(am,cyl,hp,qsec,wt) -NB     ##How to create new data set
                                              #(newdata set name<-Original name %>% select(variable of interest))
View(vm2)  #How to view the data (Note that V is caps) 
filter(vm2, wt>2000)
filter(vm2,hp<100)
vm2 %>% filter(hp<100)
filter(vm2, hp==100)
filter(vm2,cyl==6)
vm2 %>% filter(cyl==6)

#trial2 21/02/2025
mtcars
df<-mtcars
View(df)
head(df)
tail(df)
ls(df)
mean("am")
mean(hp)
mean(df$hp)
mean(df$am)
mean(df$cyl)
summary(df$cyl)
summary(df$cyl,hp)
summary(df)
#Want to deal with 8 variables of interest ie am,carb,cyl,,hp,mpg and weight
library(dplyr)
df5<-df %>% select(am,carb,cyl,hp,mpg,wt)
summary(df5$mpg)
#filter cars with mpg>5
View(df5$mpg)
View(df5)
filter(df5, mpg>15)
df5 %>% select(mpg>15) #i dont know why this is incorrect, i thought it should give similar results to code 86
df %>% filter(mpg>15)
df5 %>% filter(mpg>15)   #code 86 is similar to 89

#Data Visualization_Graphing 24/02/2025
library(tidyverse)
ggplot(df5=mpg) #wrong
#what is the relationship between wt and mpg
ggplot(data=mpg)
ggplot(data= wt)
ggplot(data=mpg,
       mapping=aes(x=wt, y=mpg)) 
ggplot(data=df5,
       mapping=aes(x=wt,y=mpg)) #what can you say about the graph ie what is the relationship?
ggplot(data=df5,
       mapping=aes(x=wt,y=mpg)+geom_point())
ggplot(data=df5,
       mapping=aes(x=wt,y=mpg))+geom_point()
ggplot(data=df5,
       mapping=aes(x=mpg,y=wt))+geom_point() 
                #1.what factors do you consider when deciding on   what variable to have or x or y axis
                #2.How to interpret the image provided (scatter plot code 105) 
                #3.When do we need a scatter plot
ggplot(data=df5,
       mapping=aes(x=mpg,y=wt, color=wt))+geom_point()  #if you want one of your variables to have color you include color ie wt=color
 
#25/02/2025      
View(df5)
library(dplyr)
  #relationship between wt and cyl
ggplot(data=df5,
       mapping=aes(x=cyl,y=wt, colour = cyl,))+geom_point()
        #From the image generated, how do you explain the relationship? i have read but still not able to interprate
   #relationship between wt,cyl and mpg
ggplot(data=df5,
       mapping=aes(x=cyl&mpg, y=wt,colour = mpg&cyl))+geom_point()
        #interpretation of this
        #how do you give different variable colors
ggplot(data=df5,
       mapping=aes(x=wt&mpg&hp,y=cyl, colour = mpg))
ggplot(data=df5,
       mapping=aes(x=cyl&mpg&hp,y=hp, colour = mpg))
ggplot(data=df5,
       mapping=aes(x=hp,y=wt, colour =hp))
#Trial3
mtcars
ggplot(data=mtcars,
       mapping=aes(x=mpg,y=drat, colour = drat))+geom_point()
rownames(mtcars)
ggplot(data=mtcars,
       mapping=aes(x=mpg,y=drat, colour = rownames()))+geom_point() #why 
ggplot(data=mtcars,
       mapping=aes(x=mpg,y=drat, colour = cars))+geom_point()
#Trial4 27/02/2025
mtcars
mtc<-mtcars
library(ggplot2)
library(dplyr)
ggplot(mtc,
       mapping=aes(x=mpg, y=cyl, colour=factor(cyl)))+geom_point()+
  labs(title ="cyl", x="Miles Per Gallon", y="No of cylinders")
       #Observation
       #High cylinder cars have lower mpg ie 8cyl have mpg that range from 10-15
          ## Cars with 8 cyl (blue) have lower mpg (mostly between 10-15)
          ## Cars with 6 cyl(green) have moderate mpg (between 15.5-20.5)
          ## Cras with 4 mpg(orange) have high mpg(between 20-35)
        #Interpretation: 
          ##Cars with more cylinders (e.g., V8 engines) tend to consume more fuel, resulting in lower mpg.
          ##Smaller cylinder engines (e.g., 4-cylinder cars) are more fuel-efficient and have higher mpg.
          ##6-cylinder cars fall in between in terms of fuel efficiency

#Barplots
barplot(mtc$hp)
barplot(mtc$hp)
barplot(mtc$hp,aes(x="mtc",y="hp", colour = factor(hp)

barplot(mtc$cyl)

barplot(mtc$hp)
        main = "car count by cylinder", xlab = "cylinder", ylab = ("count")))
View(mtc)       

#DAY 5-03/03/2025
#practice with different data set:  palmerpenguins
library(tidyverse)
library( " palmerpenguins")
palmerpenguins
View("palmerpenguins")
M1<-(" palmerpenguins")
head(M1)
palmerpenguins::penguins  #this is a new data set from an installed package : Need more explanation on this
"penguins"
View("penguins")
M2<-palmerpenguins::penguins
ls(m2)
ls(M2)   #shows total no of variables in this data set
View(M2)
M3<-C(2:4)
M3<-M1[C(2:4)]
M2
summarise(M2$species)
summarise(M2$sex)
summarise(M2$bill_length_mm)
summarise(M2$year)
summary(M2$bill_depth_mm)
summary(M2$sex)
summary(M2)
mean(M2$body_mass_g)
mean(M2$bill_length_mm)
glimpse(M2)
mean(M2$bill_length_mm)

library(ggplot2)
ggplot(data=M2)
ggplot(M2,
       mapping = aes(x=flipper_length_mm,y=body_mass_g)
      )+ geom_point())
ggplot(M2,
       mapping = aes(x=flipper_length_mm,y=body_mass_g)
       )+geom_point()
ggplot(M2,
       mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species)
)+geom_point()
ggplot(M2,
       mapping = aes(x=flipper_length_mm,y=bill_length_mm  ,color=species)
       )+geom_point()

   #i want to visualize mtcars data and have to name the car column (How to you labes rownames that were blank)
mtcars
mt<-mtcars
ls(mt)
glimpse(mt)
rownames(mt<-cars)
View(mt)
mt1<-mtcars
View(mt1)
rownames(mt1)<-mt1$Cars
View(mt1)
mt1$Cars<-NULL
print(mt1)
str(mt1)
ls(mt1)

  #back to penguins data
ggplot(M2,
       mapping = aes(flipper_length_mm,y=body_mass_g,color=species)
       )+geom_point()+geom_line()+geom_smooth(method = "lm")
  #Read about the following comands
          ##mapping, aes, how to add color, geom_point, geom_smooth and method=lm
          ##Explaining intrepretation/Graphs
##Day6
palmerpenguins::penguins
m3<-palmerpenguins::penguins
m3
View(m3)
ls(m3)
glimpse(m3)
library(dplyr)
head(m3)
tail(m3)
summary(m3$year)
summary(m3$sex)
## What is the total number of female
m3$female
m2[c(m3$)]
table(m3$sex)
library(dplyr)
m3 %>% count("sex")
filter(m3==sex$female)
m3 %>% select(m3$sex)
library(dplyr)
m3 %>% filter(sex=="female")
m3 %>% filter(sex=="male")
m3 %>% filter(bill_length_mm>18&sex=="female")
print(m3 %>% filter(bill_length_mm>18&sex=="female"))

 ##what is the relationship between species and flipper_length_mm
 ## Interprete your results
library(dplyr)
library(tidyverse)
ggplot(m3,
       mapping = aes(x=flipper_length_mm,y=species,colour = species)
       )+ geom_point()


#Day6
library(ggplot2)
library(tidyverse)
palmerpenguins::penguins
K1<-palmerpenguins::penguins
ls(species)
ls("species")
ls(K1)
ls("K1"$species)
ls("K1"$"species")
k1$species
filter(K1$species)
K1 %>% select("species")
K1 %>% select("body_mass_g")
summary("body_mass_g")
summary(body_mass_g)
summary("bill_length_mm")
summary(K1$"bill_length_mm") ##Has a mean of 43.50, median-44.45, and min-32.10
summary(K1$"bill_depth_mm")

#missing values and how to treat them/what to do with them
colSums(is.na(K1))
summary(K1)
K1_clean<-na.omit(K1)

ggplot(K1_clean,
       mapping = aes(x="bill_length_mm",y="flipper_length_mm", colour = "species")
       )+geom_point()
ggplot(K1_clean,
       mapping = aes(x="flipper_length_mm",y="body_mass_g", colour = "species")
       )+geom_point()  ##I dont undertsand why its not generating

ggplot(K1,
       mapping = aes(x= "flipper_length_mm", y="body_mass_g", colour="species")
       )+geom_point()
ggplot(data=K1,
       mapping = aes(x= "flipper_length_mm", y="body_mass_g"))

ggplot(data = K1,
       mapping = aes(x=flipper_length_mm,y=body_mass_g))  
ggplot(data = K1,
       mapping = aes(flipper_length_mm,y=body_mass_g,colour=species)
       )+geom_point()
ggplot(data = K1,
       mapping = aes(flipper_length_mm,y=body_mass_g,colour=species)
)+geom_point()+geom_smooth(method = "lm")
ggplot(data=K1,
       mapping = aes(x=flipper_length_mm,y=body_mass_g)
       )+geom_point(mapping = aes(colour = species, shape = species)
                    )+geom_smooth(method="lm")
##interpretation
##There is a positive relationship between Body mass and flipper length, as body mass increases the flipper length also increases,
##Species with high body mass have a higher weight
##Example for species with filler length of 180, their body mass is around 2800, same species with flipper length of 230, the body mass is 5500

##ADDING TITTLE TO THE GRAPH
##Use code
title= name of the graph, x= and y=
  
ggplot(data = K1,
         mapping = aes(flipper_length_mm,y=body_mass_g,colour=species)
  )+geom_point()+geom_smooth(method = "lm")
ggplot(data=K1,
       mapping = aes(x=flipper_length_mm,y=body_mass_g)
)+geom_point(mapping = aes(colour = species, shape = species)
)+geom_smooth(method="lm") + labs(title = "Body mass and Flipper Length for species")

##DAY7
##EXERCISE (DAY1-7)
#1.How many rows are in penguins? How many columns?
palmerpenguins::penguins
PP<-palmerpenguins::penguins
View(PP)
nrow(PP)
ncol(PP)
##answer: Total of 344 rows and 8 columns

##Q2: What does the bill_depth_mm variable in the penguins data frame describe? 
      ##Read the help for ?penguins to find out.
View(PP$bill_depth_mm)
glimpse(PP)
View(PP)
PP[,"bill_length_mm"]
PP[, 4]

##Q3: Make a scatterplot of bill_depth_mm vs. bill_length_mm.
##That is, make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm on the x-axis.
##Describe the relationship between these two variables.

ggplot(data = PP,
       mapping = aes(x=bill_length_mm,y=bill_depth_mm)
       )+ geom_point(mapping = aes(colour = species, shape = species)
                     )+geom_smooth(method = "lm")+labs(title = "Bill length Vs Depth")
##Interpretation
##The two variables are inversely related, there is a negative relationship in that as one variables increases,,
#the other one decreases
##There is a negative correlation between bill lenth and flipper length

##Q3: What happens if you make a scatter plot of species vs. bill_depth_mm? 
##What might be a better choice of geom?
ggplot(data=PP,
       mapping = aes(x=species, y=bill_length_mm,colour = species)
       )+ geom_col()+labs(title = "Species Vs bill length")
   ##The best geom to use is geom_col 
##What does the na.rm argument do in geom_point()? What is the default value of the argument? 
##Create a scatterplot where you successfully use this argument set to TRUE
summary(PP, na.rm="TRUE")

##DAY8
palmerpenguins::penguins
library(dplyr)
library(tidyverse)
df8<-palmerpenguins::penguins
 ##summary statistics/Descriptive
glimpse(df8)
nrow(df8)  #344 rows
ncol(df8) #8 cols
df8[, 6]
df8(, body_mass_g)
df8
df8[,"body_mass_g"]
df8[1:8]
df8[2:5]
df81<-df8[2:5]
head(df8)
tail(df8)
ls(df8)
mean(df8$bill_length_mm)
mean()
df8$("bill_length_mm")
df8 %>% select("island","bill_length_mm","bill_depth_mm","flipper_length_mm") ##394 and 395 gives same output
summary(df8$bill_length_mm)

##Select variables 1, 3, 6, and 8 from the dataset. Filter rows where 'bill Length' is greater than 35. Generate a new column showing the ratio of 'Bill Depth' to body mass'.
df8
df8 %>% select("species","bill_length_mm","body_mass_g", "year")
df8a<-df8 %>% select("species","bill_length_mm","body_mass_g", "year")
df8b<-df8 %>% select("species","bill_length_mm","body_mass_g", "year")
View(df8b)
df8b %>% filter("bill_length_mm">35)
df8b_filtered<-df8b %>% filter("bill_length_mm">35) ##whay is this still same as 410? i expected the observations to be fewer
colSums(is.na(df8b_filtered))       ##showing  missing values
df8b1<-na.omit(df8b)        ##this answer code 411
df8b1 %>% mutate(ratio="bill_legth_mm"/"body_mass_g")  ##need help to answer question 404

#Lets start over again,,, Quiz 404
df8
df8 %>% select("species","bill_length_mm","body_mass_g", "year")
na.omit(df8)
df8_clean<-na.omit(df8)
df8_filtered<-df8_clean %>% filter(bill_length_mm>35)
df8_final<-df8_filtered %>% mutate(ratio=bill_length_mm/body_mass_g)
View(df8_final)


##PLOTS
ggplot(data=df81,
       mapping = aes(x="bill_length_mm", y="bill_depth_mm")
       )+geom_point()  ##what is wrong with this graph

##DAY9-10/03/2025
data()
palmerpenguins::penguins
df9<-palmerpenguins::penguins
df9[,"body_mass_g"]
df9$body_mass_g
df9[,"island"]
df9$island
library(dplyr)
library(tidyverse)
df9 %>% mutate(values=bill_length_mm*bill_depth_mm)
View(df9)
df9(-"minayo")
df9$minayo<-NULL
View(df9)

#new data set
View(starwars)
#select variables of interest, filter human species

starwars %>% select(gender, mass, height, species) %>%
  filter(species=="Human") %>% na.omit() %>% 
mutate(height=height/100) %>% 
  mutate(BMI=mass/height^2)

##is the a difference in BMI between males and female in this data? use group by command 
starwars %>% select(gender, mass, height, species) %>%
  filter(species=="Human") %>% na.omit() %>% 
  mutate(height=height/100) %>% 
  mutate(BMI=mass/height^2) %>% 
  group_by(gender) %>% summary(averageBMI=mean(BMI))    #

View(msleep)
my_data<-msleep %>% 
  select(name,sleep_total) %>% 
  filter(sleep_total>18)
View(my_data)

my_data<-msleep %>% 
  select(name,sleep_total) %>% 
  filter(sleep_total>!18)
View(my_data)

View(msleep)
mydata<-msleep %>% select(name,order, bodywt,sleep_total) %>% 
  filter(order=="primates", bodywt>20)
mydata

#Data wrangling-Mutate,filter, select, merge,group_by, summarise, arrange, pivot_longer
##Data wrangling is the process of transforming raw data into a more usable format. This involves cleaning, structuring, 
##and enriching data so that it’s ready for analysis. 

library(diplyr)
gapminder::gapminder
View("gapminder::gapminder")
View(gapminder::gapminder)

#QUESTIONS FOR PRACTICE
#1.Load the gapminder dataset and display its structure using str().
#2.Select only the country, year, and lifeExp columns.
#3.Filter the dataset for rows where the year is 2007.
#4.Find all countries in Africa where life expectancy was less than 50 in 2007.

library(dplyr)
gapminder::gapminder
View(gapminder::gapminder
gp<-gapminder::gapminder
names(gp)
nrow(gp)
ncol(gp)
glimpse(gp)
str(gp)      #help to read this

install.packages("gapminder")
library(gapminder)
head(gapminder)
tail(gapminder)
View(gapminder)
names(gapminder)
ncol(gapminder)
nrow(gapminder)
glimpse(gapminder)

#select
gapminder1<- gapminder%>% 
  select('country',"year","lifeExp")
#filter
gapminder1f<-gapminder %>% 
  select("country","year","lifeExp") %>% 
  filter(year==2007)

gapminder1g<-gapminder %>% 
  select("country","year","lifeExp") %>% 
  filter(year==2007,order=="Africa", lifeExp<50))

#1:Create a new column called GDP by multiplying gdpPercap by pop.
#2.Find the country with the highest GDP in 2007.
#3.Find the top 5 countries with the lowest life expectancy in 1952.
#4.Find the average life expectancy for each continent in 2007.
#5.Count how many countries are in each continent.
#6.Find the year with the highest average GDP per capita across all countries.

#1
library(dplyr)
data("gapminder")
gapminderGDP<-gapminder %>% 
  mutate(GDP=gdpPercap*pop)
#2.
hGDP<-gapminder %>% 
  filter(year==2007) %>% mutate(GDP=gdpPercap*pop) %>% 
  arrange(desc(GDP))
#3.
gapminderL<-gapminder %>% 
  filter(year==1952) %>% 
  arrange(lifeExp)  #ascending order

head(gapminderL$lifeExp)

gapminderLD<-gapminder %>% 
  filter(year==1952) %>% 
  arrange(desc(lifeExp)) #descending order,,, I uded code 551 to confirm if code 543 is TRUE

#4
gapminderMeanContinent<-gapminder %>% 
  filter(year==2007) %>%
      ##need help
  
  #DAY10-12/03/2025
library(diplyr)
library(tidyverse)
load(gapminder)
gp10<-gapminder
#6.Find the year with the highest average GDP per capita across all countries.
glimpse(gp10)
gp10av<-gp10 %>% mutate(GPD=gdpPercap*pop)
gp10av<-gp10 %>% mutate(GPD=gdpPercap*pop$aveGDP=mean(GDP))   ##WRONG

gp10av1<-gp10av %>% mutate(Mean_gdp_percapita=mean(gdpPercap))
gp10av1 %>% arrange(gp10av1)
gp10av1 %>% arrange(desc(gp10av1))   ##wrong

#another trial for q6
gapminder
Hyear<-gapminder %>% group_by(year) %>% 
  mutate(Avgdp_percapita=mean(gdpPercap)) %>% arrange(desc(Avgdp_percapita))


##DAY11: VISUALIZING DISTRIBUTION
##YOU can use a categorical or numerical variable
library(diplyr)
library(tidyverse)
palmerpenguins::penguins
PP<-palmerpenguins::penguins
load("penguins")
ggplot(data=palmerpenguins::penguins, aes=species)+geom_bar()

ggplot(PP, aes(x=species))+geom_bar()
ggplot(PP, aes(y=species))+geom_bar()
ggplot(PP, aes(x=species))+geom_bar(color="red")
ggplot(PP, aes(x=species))+geom_bar(fill="red")

##DATA MANIPULATION
library(tidyverse)
library(dplyr)
?msleep
glimpse(msleep)
View(msleep)

 #rename variables
msleep %>% rename("conserv"="conservation") %>% 
  glimpse()
##re-ordering variables
msleep %>% select(vore, name, everything())

#change in variable type

#mutate
msleep %>% mutate(brainwt=brainwt*1000) %>% View
msleep %>% mutate(brainwt_in_grams=brainwt*1000) %>% View

#DAY11
library(dplyr)
library(tidyverse)
load(gapminder)
View(gapminder)
glimpse(gapminder)
names(gapminder)
ncol(gapminder)
nrow(gapminder)
summary(gapminder)
summary(gapminder$continent)
summary(gapminder$pop)
summary(gapminder$lifeExp)

#DAY12-25/03/2025
library(dplyr)
Load(gapminder)
View(gapminder)

IHD_Staff<- data.frame(
  Position=c("F.E", "Data analyst", "Research assistant","Program manager", "ECD specialist", "Government Liason"),
  Number=c(10,2,15,5,1,7),
with_masters=c(2, 3, 5,1,1,2),
salary=c(40000,250000,90000,120000,300000,350000),
Field_work_allowance=c(1000,2000,3000,4000,4000,6000),
Total_working_Hrs=c(8,8,8,8,8,8),
Contract=c(1,2,1,3,4,4))
View(IHD_Staff)

IHD_Staff1<-mutate(annual_salary=salary*12)
IHD_Staff1<-IHD_Staff(mutate(annual_salary=salary*12))

IHD_staff1<-IHD_Staff %>% mutate(Annual_salary=salary*12)

View(IHD_staff1)
 
#DAY13-26/03/2025
##DATA TRANSFORMATION
library(nycflights13)
library(tidyverse)
load(nycflights13)
flights
glimpse(flights)
nrow(flights)
ncol(flights)
flights|>filter(dep_delay>120)
View(flights$dep_delay)
View(flights)
flights %>% arrange(desc(dep_delay))
View(flights)
flights %>% arrange(asc(dep_delay))
flights1<- flights %>% arrange(dep_delay))

flights that departed on january 1
flights|>filter(dep==janury,)
library(dplyr)
glimpse(flights)

##DAY14-27/03/2025
library(nycflights13)
load(nycflights13)
flights
ls()
View(flights)
names(flights)
flights$month
flights["year", "month","dep-delay"]   #wrong
flights[,6,18,16]
flights[,6]
nrow(flights)
ncol(flights)
##find all flights that departed more than 120 minutes (two hours) late
flights|> filter(dep_delay >120)
View(flights)

flights |> 
  filter(dep_delay > 120)
View(flights)

#start over again
    #FILTER
library(nycflights13)
library(dplyr)
library(tidyverse)
flights
#find all flights that departed more than 120 minutes (two hours) late
flights_F <- flights %>% filter(dep_delay>120)

##is it possible to filter a variable without creating a new data set? if yes how?
View(flights_F)
flights_F
##Flights that departed on January 1
flights|>filter(month==1 &day==1)

##Flights that departed in January or February
flights|> filter(month==1|month==2)

#or
flights|>filter(month %in% c(1,2))

##Let's do a practical example of Exploratory Data Analysis (EDA) and Regression Analysis using the mtcars dataset in R.
#STEP 1-LOAD DATA AND BASIC SUMMARY
load(mtcars)
data(mtcars)
summary(mtcars)
str(mtcars)
nrow(mtcars)
ncol(mtcars)
glimpse(mtcars)

##STEP 2: VISUALIZE DATA
library(ggplot2)
# Scatterplot of weight vs mpg

ggplot(data=mtcars,
     mapping =aes(x=wt, y=mpg))+geom_point(colour="red")+
  geom_smooth("lm", color="blue")+
  labs(title = "Weight Vs Miles per gallon"))

ggplot(mtcars,
       mapping = aes(x=wt, y=mpg))+
  geom_point(color="red")+
  geom_smooth(method = "lm")+
  labs(title = "Car weight Vs Miles Per Gallon", x="weight (1000lbs)", y="Miles per gallon")

## there is negative correlation between Weight and mpg, meaning, 
#when weight increases, mpg goes down, heavy cars tend to have low mpg while cars with low weight have high mps
#heavy cars have low mpg=they consume more fuel, low wt car have high mpg hence more efficient


## Scatterplot of horsepower vs mpg
ggplot(mtcars,
       mapping = aes(x=hp, y=mpg))+
  geom_point(color="blue")+
  geom_smooth(method = "lm", se=FALSE, color="green")+
  labs(title = "Horsepower Vs Miles per gallon", x="Horsepower", y=" Miles per gallon")

##negative correlation between hp and mpg
#high hp means low mpg

##DAY14-28/03/2025
library(dplyr)
Grade8_scores<-data.frame(
subject=c("math","english","environmental","CRE","swahili","chemetry","biology","calculus","Econometrics"),
score=c(98,80,78,90,100,87,87,50,45),
total_Number_of_students=c(50,50,50,50,50,50,50,50,50),
Ties=c(10,4,8,2,6,1,9,2,8))

print(Grade8_scores)

Grade8_scores$rank<-rank(Grade8_scores$score, ties.method = "dense")     ###HELP GENERATE THE RANK COLUMN -EASY WASY

Grade8_scores$percent-score<-c(Grade8_scores$score/100)
Grade8_scores$Percent_Score <- (Grade8_scores$score / 100)*100

Grade8_scores<- %>% mutate(              ##wrong, i want average score for each subject
  Ave.score=mean(score)
)

Grade8_scores$av.score<-mean(Grade8_scores$score)

Grade8_scores <- Grade8_scores %>% mutate(Ave_score1 = sum(score)/9)


head(Grade8_scores)
str(Grade8_scores)

summary(Grade8_scores$score)
summary(Grade8_scores$Ties)

library(tidyverse)
data(mtcars)
print(mtcars)
str(mtcars)
head(mtcars)
dim(mtcars)

#DAY 15- 01/04/2025
data(mtcars)
library(dplyr)
library(tidyverse)

print(mtcars)
dim(mtcars)
head(mtcars)
tail(mtcars)
summary 

##explore on graphs, adding labels, font sizes, adjust sizes, Read on how to factor a variables
##create 3 distinct graphs, facet wrap ( categorizing with ) faceting
##adding colours by variables in data set
##formating, naming the x and y, titles
##Explore changing the theme-
##CHECK MISSING VALUES and how to treat them
##Imputation-later read
##Group by is abit confusing,, almost same as case_when,,,help me understand



##DAY17- 04/04/2025
#Recall
Cars<-data.frame(
  Type=c("mazda","vw","toyota","peugot", "bmw", "prado", "honda","vitz"),
  cc=c(900,1800,1500,1300,1300,2000,1600,1200),
  mpg=c(13,12,14,15,17,18,19,10)
)
print(Cars)
library(dplyr)

Cars$speedl=c(10,20,80,70,40,40,40,80)
Cars$Trunk=c(1000,2000,1000,2000,4000,2000,5000,6000)
Cars<-Cars %>% mutate(off_road=case_when(Trunk==1000~"No",
                                         Trunk==2000~"Yes",
                                         Trunk>4000~"both"))
Cars$Efficiency=c(Cars$cc/Cars$speedl)
print(Cars)

sum(Cars)
summary(Cars$cc)



Cars$speedlimit<-speedlimit=c(200,100,200,300,400,500,600,200)
cars %>%mutate(speedlim<-200,100,200,300,400,500,600,200)
print(cars)


magari<-data.frame(
  Type=c("mazda","vw","toyota","peugot", "bmw", "prado", "honda","vitz"),
  cc=c(900,1800,1500,1300,1300,2000,1600,1200),
  mpg=c(13,12,14,15,17,18,19,10),
  speedlim=c(100,200,100,200,140,80,70,100)
)
print(magari)
#use mutate to add new variable/column
magari<-magari %>% mutate(year=c(2005,2006,1998,1789,1995,2007,1800,2016))
print(magari) ## there is a big problem,, printing years in repeat

GARI<-data.frame(
  Type=c("mazda","vw","toyota","peugot", "bmw", "prado", "honda","vitz"),
  cc=c(900,1800,1500,1300,1300,2000,1600,1200),
  mpg=c(13,12,14,15,17,18,19,10),
  speedlim=c(100,200,100,200,140,80,70,100)
)
print(GARI)

GARI$Year=c(2001,2002,2003,2004,2005,2006,2007,2006)
GARI$hp=c(3,3,1,2,1,1,5,5)
GARI<-GARI %>% mutate(efficiency=case_when(hp==1~"low",
                                           hp==3~"medium",
                                           hp==5~"high"))
mtcars
load(mtcars)
head(mtcars)
mtcars$cyl
mtcars[,"cyl"]
print(mtcars$cyl)
mtcars<-mtcars %>% mutate(efficiency=case_when(cyl==4~"low",
                                              cyl==6~"medium",
                                              cyl==8~"high"))
ggplot(mtcars,mapping = aes(x="wt", y="mpg"))                                              
library(tidyverse)                                              

#DAY 18-
library(dplyr)
library(tidyverse)
mtcars
load(mtcars)
View(mtcars)
# Add a new column for weight in kilograms (wt is in 1000 lbs), 0.453592x1000= 453.592

mtcars %>% mutate(weight_kg=wt*453.592)
ls(mtcars)
glimpse(mtcars)
mtcars<-mtcars %>% mutate(efficient=case_when(gear==3~"good",
                                              gear==4~"best",
                                              gear==5~"best_of_all"))
#Add a column for horsepower-to-weight ratio.
mtcars<-mtcars$hp/wt %>% mutate(mtcars$hp/mtcars$wt)  #wrong

mtcars1<-mtcars %>%mutate(hp-wtratio=hp/wt)  #wrong

mtcars$hpwt_ratio=c(mtcars$hp/mtcars$wt) #wrong

mtcars<-mtcars %>% mutate(wt_ratio=hp/wt)
mtcars <- mtcars %>% mutate(wt_ratio = "hp" / "wt")
#https://chatgpt.com/share/67f42409-cf90-8011-a7a5-c41b49e73d81

#average mpg by number of cylinders

#Create a new column fuel_efficiency as mpg / cyl.

mtcars$fuel_efficiency=mtcars$mpg / mtcars$cyl

# Example 2: Average mpg by number of cylinders
View(mtcars)
library(dplyr)
library(tidyverse)

mtcars %>%
  group_by(cyl) %>%
  summarise(avg_mpg = mean(mpg))

mtcars %>% 
  group_by(cyl) %>% 
  summaryfghjk
View(mtcars)

#DAY 19- 04-09-2025
#DATA TRANSFORMATION
library(dplyr)
library(tidyverse)
nycflights13::flights
View(flights)
glimpse(nycflights13::flights)
ls(bghjmk,::flights)
lm(nycflights13::flights)

##
flights<-nycflights13::flights
glimpse(flights)
ls(flights)
#find all flights that departed more than 120 minutes (two hours) late:
flights[,6]

flights %>%
  filter(dep_delay>120)  #this is the same as code 938
flights|>
  filter(dep_delay>120)
#Flights that departed on January 1
flights[5,13]
flights["month", "day"]
flights %>% 
  filter(month==1 & day==1)
## Flights that departed in January or February
flights %>% 
  filter(month==1|month==2)
# A shorter way to select flights that departed in January or February
flights %>% 
  filter(month %in% c(1,2))
##ARRANGE
#arrange flights with variables in this order year, month, day, dep_time
flights %>% 
  arrange(year, month, day, dep_time)
#You can use desc() on a column inside of arrange() to re-order the data frame based
#on that column in descending (big-to-small) order. For example, this code orders flights from most to least delayed
flights %>% 
  arrange(desc(dep_delay))
#from small to big
flights %>% 
  arrange(dep_delay)
#distinct() finds all the unique rows in a dataset, so technically, it primarily 
#operates on the rows. Most of the time, however, you’ll want the distinct combination of some variables, so you can also optionally supply column names:
# Remove duplicate rows, if any
flights %>% 
  distinct()
nrow(flights)
nrow(distinct(flights))
#there were no duplicate rows in flights data set

## Find all unique origin and destination pairs
flights %>%
  unique(origin&dest)
flights %>% 
  distinct(origin,dest)
#In a single pipeline for each condition, find all flights that meet the condition:

#a.Had an arrival delay of two or more hours
#b.Flew to Houston (IAH or HOU)
#c.Were operated by United, American, or Delta
#d.Departed in summer (July, August, and September)
#e.Arrived more than two hours late but didn’t leave late
#f.Were delayed by at least an hour, but made up over 30 minutes in flight

#a. 
flights %>% 
  filter(arr_delay==2|arr_delay>2) #or

flights %>% 
filter(arr_delay %in% c(2, >2))
# correct code is
flights %>% 
  filter(arr_delay>120)
glimpse(flights)
str(flights)
?flights #gives discription of the variables ie arr_delay is in minutes
#b
flights %>% 
  filter(dest=="IAH" | dest=="HOU")  or
flights %>% filter(dest %in% c("IHA", "HOU")
flights %>% 
  filter(dest %in% c("IHA", "HOU"))

#c.Were operated by United, American, or Delta (UA,AA OR DA)
glimpse(flights)
flights %>% 
  filter(carrier=="UA" | carrier=="AA" | carrier=="DL")
#OR
flights %>% 
  filter(carrier %in% c("UA", "AA","DL"))
filtered_flights<- flights %>% 
  filter(carrier %in% c( "UA","AA","DL"))
##d.Departed in summer (July, August, and September)
flights %>%
  filter(month==7 | month==8 |  month==9)

#e.Arrived more than two hours late but didn’t leave late
flights %>% 
  filter(arr_time>120 | dep_time<0)
#f.Were delayed by at least an hour, but made up over 30 minutes in flight
?flights
flights %>% 
  filter(dep_delay>=60 & (dep_delay - arr_delay)>30)

#DAY 20 - 10/04/2025
#columns
#a-mutate, select, rename and relocate
#MUTATE
library(dplyr)
library("tidyverse")
flight
nycflights13::flights
flights

flights<-flights %>% 
  mutate(
    gain=dep_delay-arr_delay,
    speed=distance/air_time*60)

flights<-flights %>% relocate(gain, .before = 1)
flights<flights %>% relocate(dep_time, .before = 1)
