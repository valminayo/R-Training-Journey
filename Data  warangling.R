library(readr)
dirty_cafe_sales <- read_csv("C:/Users/lenovo/OneDrive/Desktop/eneza/dirty_cafe_sales.csv")
View(dirty_cafe_sales)

DF<- dirty_cafe_sales
head(DF)
tail(DF)
colSums(is.na(DF))

str(DF) # all the variables are in character
 
# Convert specific columns to numeric
DF$Quantity <- as.numeric(DF$Quantity)
DF$`Price Per Unit` <- as.numeric(DF$`Price Per Unit`)
DF$`Total Spent` <- as.numeric(DF$`Total Spent`)


View(DF)


#Checking uniquness
table(DF$`Transaction ID`)
table(DF$Item)
table(DF$Quantity)
table(DF$`Price Per Unit`)
table(DF$`Total Spent`)
table(DF$`Payment Method`)
table(DF$Location)
table(DF$`Transaction Date`)

#HANDLIG MISSING VALUES
# imputing, that is checking the trend and imputing 
#check each variable separatly# and note the trend in data collection
#var 1- Transaction ID will not be touched- Will be droped later
#Var 2- Item also will not eb touched- You cant impute specific item
#Var 3- Quantity can be imputed from the total spent- Total spent = Quantity*prce per unit
#Quantity= Total spent/Price
#Total spent= Quantity*Price
#Price= Total Spent/Quantity

#i will do the imputation here on R using trend observed above

df_clean <- DF %>%
  mutate(
    Quantity = ifelse(is.na(Quantity) & !is.na(`Total Spent`) & !is.na(`Price Per Unit`),
                      `Total Spent` / `Price Per Unit`, 
                      Quantity),
    
    `Total Spent` = ifelse(is.na(`Total Spent`) & !is.na(Quantity) & !is.na(`Price Per Unit`),
                           Quantity * `Price Per Unit`,
                           `Total Spent`),
    
    `Price Per Unit` = ifelse(is.na(`Price Per Unit`) & !is.na(Quantity) & !is.na(`Total Spent`),
                              `Total Spent` / Quantity,
                              `Price Per Unit`)
  )

View(df_clean)
#save the new cleaned data set in the PC
write.csv(df_clean, "C:/Users/lenovo/OneDrive/Desktop/eneza/cleaned1_data.csv", row.names = FALSE)

#view missing values after imputing
colSums(is.na(df_clean))  #new missing values in Quantity is now 38compare to before its was 479, Total spent was  502 now 40 and Price was 159 now 38

#Dropping missing values from Quantity, Price per unit and Total spent
cleaned_data <- df_clean %>% drop_na(Quantity, `Price Per Unit`, `Total Spent`)

#for uniformity convert all character to lower and remove spaces
cleaned_data <- cleaned_data %>%
  mutate(across(where(is.character), tolower))

#removing spaces
cleaned_data<- cleaned_data %>% 
  mutate(
    across(
      where(is.character),
      ~ str_replace_all(.x, "\\s+", "-")
    ))
    
  ))

#checking duplicates
cleaned_data<- cleaned_data %>% distinct()
#. Convert date column to Date type
cleaned_data <- cleaned_data %>%
  mutate(`Transaction Date` = as.Date(`Transaction Date`, format = "%Y-%m-%d"))

#we dont need transaction id, we drop it
library(dplyr)

#rename the variable name and remove spaces 
names(cleaned_data)

cleaned_data <- cleaned_data %>% rename("Item"= Item,
                                        "Quantity" = quantity,
                                        `Price Per Unit` = Price_Per_Unit,
                                        `Total Spent`= total_spent,
                                        `Payment Method`= payment_method,
                                         "Location"= location,
                                        `Transaction Date`= date)

names(cleaned_data)
list(cleaned_data)
glimpse(cleaned_data)
cleaned_data <- cleaned_data %>% select(-`Transaction ID`)

