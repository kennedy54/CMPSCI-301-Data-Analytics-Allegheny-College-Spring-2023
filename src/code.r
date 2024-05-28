# Data Analytics (CS301)

################################################

# Names:
print("The names of this group are the following.")
print("Ryan Kennedy")


################################################

rm(list = ls()) # clear out the variables
# from memory to make a clean execution of the code.

# If you want to remove all previous plots
# and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console

################################################

# Instructions: Complete this code using
# RStudio by following the steps in README.md.
# Note: your code must be able to
# execute without errors. Please be sure
# that comments are commended, and code
# is coded correctly without typographical errors.

# Add your code here to address the four main research questions which are noted in the README.md file.

#Installing appropriate libraries
library(dplyr)
library(tidyverse)
library(ggplot2)

##### Begin by loading your csv file.
# Read data from CSV files in the same folder as the source code
data_Working <- file.choose()
data_Working <- read.table(data_Working, header = TRUE, sep = ",")

data_FAO <- file.choose()
data_FAO <- read.table(data_FAO, header = TRUE, sep = ",")


# View the data set
View(data_Working)
View(data_FAO)

#Wrangling the data
FAO <- select(data_FAO, Area, Element, Item, Year, Unit, Value, Flag.Description)
FAO <- filter(FAO, Area != "Kuwait")
Unaffordable_Diet <- data_Working %>% select(-c(Classification.Code, Country.Code, Time.Code))

#View the new data sets
View(FAO)
View(Unaffordable_Diet)


### HOW DISPROPORTIONATELY AFFECTED INDIVIDUALS MAY BE AFFECTED BY VEGETABLE OIL CONSUMPTION
#Millions of people who cannot afford a healthy diet in the US
# Read the data into a data frame
unaffordable_diet_US_data <- data.frame(
    year = c(2017, 2018, 2019, 2020),
    unaffordable_diet = c(6.5, 5.7, 4.9, 4.9)
)

# Fit a linear regression model
model_unaffordable_diet_US <- lm(unaffordable_diet ~ year, data = unaffordable_diet_US_data)

# Print the model summary
summary(model_unaffordable_diet_US)

# Plot the data and the fitted regression line of people with an unaffordable healthy diet
plot(unaffordable_diet_US_data$year, unaffordable_diet_US_data$unaffordable_diet,
    xlab = "Year", ylab = "Millions of people who cannot afford a healthy diet in the US"
)
abline(model_unaffordable_diet_US, col = "red")


#Millions of people who cannot afford a healthy diet in Vietnam
unaffordable_diet_Vietnam_data <- data.frame(
  year = c(2017, 2018, 2019, 2020),
  unaffordable_diet = c(30.7, 28.1, 25.8, 29.2)
)

model_unaffordable_diet_Vietnam <- lm(unaffordable_diet ~ year, data = unaffordable_diet_Vietnam_data)

summary(model_unaffordable_diet_Vietnam)

#Plot of Millions of people who cannot afford a healthy diet in Vietnam from 2017 - 2020
plot(unaffordable_diet_Vietnam_data$year, unaffordable_diet_Vietnam_data$unaffordable_diet,
     xlab = "Year", ylab = "Millions of people who cannot afford a healthy diet in Vietnam"
)
abline(model_unaffordable_diet_Vietnam, col = "red")


#Millions of people who cannot afford a healthy diet in Oceania
unaffordable_diet_Oceania_data <- data.frame(
  year = c(2018, 2019, 2020),
  unaffordable_diet = c(5.5, 5.7, 5.1)
)

model__unaffordable_diet_Oceania <- lm(unaffordable_diet ~ year, data = unaffordable_diet_Oceania_data)

summary(model__unaffordable_diet_Oceania)

#Plot of Millions of people who cannot afford a healthy diet in Oceania from 2018 - 2020
plot(unaffordable_diet_Oceania_data$year, unaffordable_diet_Oceania_data$unaffordable_diet,
     xlab = "Year", ylab = "Millions of people who cannot afford a healthy diet in Oceania"
)
abline(model__unaffordable_diet_Oceania, col = "red")


#Domestic Supply Quantity of vegetable oil in Oceania
Oceania_supply_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  domestic_supply_quantity = c(914.00, 960.00, 986.00, 1025.00, 1043.00, 1076.00, 1083.00, 1092.00, 1140.00, 1127.00, 1091.00)
)

model_Oceania_supply <- lm(domestic_supply_quantity ~ year, data = Oceania_supply_data)

summary(model_Oceania_supply)

#Plot of the domestic supply quantity of vegetable oil in Oceania from 2010 - 2020
ggplot(Oceania_supply_data, aes(x = year)) + 
  geom_line(aes(y = domestic_supply_quantity, color = "Oceania domestic supply quantity of vegetable oil"))
#Oceania shows a rather slower increase in domestic supply quantities of vegetable oils, but it has been still increasing over the past 10
#years. This could be due to how most countries in Oceania have a very small population, as they are small island countries.  


#Domestic Supply Quantity of vegetable oil in the US
US_supply_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  domestic_supply_quantity = c(12904.00, 13742.00, 13879.00, 14622.00, 14893.00, 15645.00, 16310.00, 16642.00, 17181.00, 	
                               17940.00, 17678.00)
)

model_US_supply <- lm(domestic_supply_quantity ~ year, data = US_supply_data)

summary(model_US_supply)

#Plot of the domestic supply quantity of vegetable oil in the US from 2010 - 2020
ggplot(US_supply_data, aes(x = year)) + 
  geom_line(aes(y = domestic_supply_quantity, color = "US domestic supply quantity of vegetable oil"))


#Domestic Supply Quantity of vegetable oil in Vietnam
Vietnam_supply_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  domestic_supply_quantity = c(898.00, 956.00, 989.00, 991.00, 797.00, 824.00, 874.00, 850.00, 859.00, 1032.00, 1102.00)
)

model_vietnam_supply <- lm(domestic_supply_quantity ~ year, Vietnam_supply_data)

summary(model_vietnam_supply)

#Plot of the domestic supply quantity of vegetable oil in Vietnam from 2010 - 2020
ggplot(Vietnam_supply_data, aes(x = year)) + 
  geom_line(aes(y = domestic_supply_quantity, color = "Vietnam domestic supply quantity of vegetable oil"))
#Although the amount of domestic supply quantities of vegetable oil in Vietnam is increasing as of 2020, overall the past 10 years, it has
#been fairly low and has shown negative trends.


#Combined data frame of the domestic supply quantity of vegetable oil between Oceania, the US, and Vietnam
Combined_supply_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  Oceania_domestic_supply_quantity = c(914.00, 960.00, 986.00, 1025.00, 1043.00, 1076.00, 1083.00, 1092.00, 1140.00, 1127.00, 1091.00),
  US_domestic_supply_quantity = c(12904.00, 13742.00, 13879.00, 14622.00, 14893.00, 15645.00, 16310.00, 16642.00, 17181.00, 	
                               17940.00, 17678.00),
  Vietnam_domestic_supply_quantity = c(898.00, 956.00, 989.00, 991.00, 797.00, 824.00, 874.00, 850.00, 859.00, 1032.00, 1102.00)
)

#Combined Plot of the domestic supply quantities of vegetable oil between Oceania, the US, and Vietnam to show the differences
ggplot(Combined_supply_data, aes(x = year)) + 
  geom_line(aes(y = Oceania_domestic_supply_quantity, color = "Oceania domestic supply vegetable oil")) + 
  geom_line(aes(y = US_domestic_supply_quantity, color = "US domestic supply vegetable oil")) + 
  geom_line(aes(y = Vietnam_domestic_supply_quantity, color = "Vietnam domestic supply vegetable oil"))

#Combined Plot of the domestic supply quantities of vegetable oil between Oceania and Vietnam (this plot excludes the US to show how much
#Oceania has truly increased over the past 10 years, and when Oceania is plotted with the US, Oceana's plot appears visually 
#disproportionate. This is primarily due to how much more vegetable oil is available domestically based on both region's population size).
ggplot(Combined_supply_data, aes(x = year)) + 
  geom_line(aes(y = Oceania_domestic_supply_quantity, color = "Oceania domestic supply vegetable oil")) + 
  geom_line(aes(y = Vietnam_domestic_supply_quantity, color = "Vietnam domestic supply vegetable oil"))


##Combined data.frame of Millions of people who cannot afford a healthy diet with the domestic supply quantity of vegetable oil in the US,
##Vietnam, and Oceania
Combined_unaffordable_supply_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  unaffordable_diet_US = c(6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 5.7, 4.9, 4.9),
  unaffordable_diet_Vietnam = c(30.7, 30.7, 30.7, 30.7, 30.7, 30.7, 30.7, 30.7, 28.1, 25.8, 29.2),
  unaffordable_diet_Oceania = c(5.5, 5.5, 5.5, 5.5, 5.5, 5.5, 5.5, 5.5, 5.5, 5.7, 5.1),
  Oceania_domestic_supply_quantity = c(914.00, 960.00, 986.00, 1025.00, 1043.00, 1076.00, 1083.00, 1092.00, 1140.00, 1127.00, 1091.00),
  US_domestic_supply_quantity = c(12904.00, 13742.00, 13879.00, 14622.00, 14893.00, 15645.00, 16310.00, 16642.00, 17181.00, 	
                                  17940.00, 17678.00),
  Vietnam_domestic_supply_quantity = c(898.00, 956.00, 989.00, 991.00, 797.00, 824.00, 874.00, 850.00, 859.00, 1032.00, 1102.00)
)

##Combined Plots of Millions of people who cannot afford a healthy diet with the domestic supply quantity of vegetable oil in the US, 
##Vietnam, and Oceania (each region is plotted on their own individual plots)
#Combined linear regression model and Plot of the US to see if there is a relation between unaffordable diet and the domestic supply 
#quantity of vegetable oil
model_combined_one <- lm(US_domestic_supply_quantity + unaffordable_diet_US ~ year, data = Combined_unaffordable_supply_data)

summary(model_combined_one)

plot(model_combined_one)


#Combined linear regression model and Plot of Oceania to see if there is a relation between unaffordable diet and the domestic supply 
#quantity of vegetable oil
model_combined_three <- lm(Oceania_domestic_supply_quantity + unaffordable_diet_Oceania ~ year, data = Combined_unaffordable_supply_data)

summary(model_combined_three)

plot(model_combined_three)


#Combined linear regression model and Plot of Vietnam to see if there is a relation between unaffordable diet and the domestic supply 
#quantity of vegetable oil
model_combined_two <- lm(Vietnam_domestic_supply_quantity + unaffordable_diet_Vietnam ~ year, data = Combined_unaffordable_supply_data)

summary(model_combined_two)

plot(model_combined_two)
#The p-value for this regression model may be above 0.05 due to the domestic quantity supply of vegetable oil not correlating directly 
#with the millions of people who can't afford a healthy diet in Vietnam.


##LOW INCOME FOOD DEFICIT COUNTRIES
#Domestic Supply Quantity of vegetable oil in Low Income Food Deficit countries
Low_income_supply_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  domestic_supply_quantity = c(25280.00, 26613.00, 29822.00, 30106.00, 32184.00, 36491.00, 34179.00, 36860.00, 37479.00, 36948.00, 36405.00)
)

model_low_income_supply <- lm(domestic_supply_quantity ~ year, data = Low_income_supply_data)

summary(model_low_income_supply)

#Plot of the domestic supply quantity of vegetable oil in low income food deficit countries from 2010 - 2020
ggplot(Low_income_supply_data, aes(x = year)) + 
  geom_line(aes(y = domestic_supply_quantity, color = "Low income countries vegetable oil domestic supply"))

#Fat supply quantity of vegetable oil Low Income Food Deficit countries
Low_income_fat_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  fat_quantity_supply = c(20.93, 20.95, 21.74, 20.63, 22.45, 22.55, 22.13, 23.30, 23.26, 22.56, 22.18)
)

model_low_income_fat <- lm(fat_quantity_supply ~ year, data = Low_income_fat_data)

summary(model_low_income_fat)

#Plot of the fat quantity supply of vegetable oil in Low Income Food Deficit countries of vegetable oil from 2010 - 2020
ggplot(Low_income_fat_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "Low income countries vegetable oil fat supply"))
#The previous 2 plots are included because many countries in Oceania (specifically the small island countries) are low income, as well as 
#Vietnam has been considered low income.



###HOW THE FOOD INDUSTRY MIGHT AFFECT VEGETABLE OIL CONSUMPTION
##OCEANIA
#Sunflower seed oil Import Quantity in Oceania
Oceania_sunflowerseed_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  import_quantity = c(56.00, 53.00, 55.00, 71.00, 75.00, 77.00, 80.00, 91.00, 88.00, 101.00, 109.00)
)

model_sunflowerseed_imoprts_oceania <- lm(import_quantity ~ year, data = Oceania_sunflowerseed_data)

summary(model_sunflowerseed_imoprts_oceania)

#Plot of the imports of sunflower seed oil in Oceania from 2010 - 2020
ggplot(Oceania_sunflowerseed_data, aes(x = year)) + 
  geom_line(aes(y = import_quantity, color = "Imports of sunflower seed oil in Oceania"))


##UNITED STATES
#Soyabean oil Production in the US
US_soyabean_production_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  production = c(8556.00, 8954.00, 8990.00, 9169.00, 9706.00, 9857.00, 10024.00, 10380.00, 10884.00, 11290.00, 11331.00)
)

model_soyabean_production_US <- lm(production ~ year, data = US_soyabean_production_data)

summary(model_soyabean_production_US)

#Plot of the prpduction of soybean oil in the US from 2010 - 2020
ggplot(US_soyabean_production_data, aes(x = year)) + 
  geom_line(aes(y = production, color = "Production of palm oil in the US"))


##VIETNAM
#Palm oil Import Quantity in Vietnam
Vietnam_palmoil_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  import_quantity = c(556.00, 567.00, 600.00, 655.00, 449.00, 429.00, 485.00, 418.00, 457.00, 616.00, 682.00)
)

model_palmoil_imports_Vietnam <- lm(import_quantity ~ year, data = Vietnam_palmoil_data)

summary(model_palmoil_imports_Vietnam)

#Plot of the imports of palm oil in Vietnam from 2010 - 2020
ggplot(Vietnam_palmoil_data, aes(x = year)) + 
  geom_line(aes(y = import_quantity, color = "Imports of palm oil in Vietnam"))



##COMBINED VEGETABLE OIL DATA
#Combined data frame of Oceania(imports of sunflowerseed oil), US(production of soybean oil), and Vietnam(imports of palm oil)
Combined_import_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  Oceania_sunflowerseed_import_quantity = c(56.00, 53.00, 55.00, 71.00, 75.00, 77.00, 80.00, 91.00, 88.00, 101.00, 109.00),
  US_Soyabean_production_quantity = c(8556.00, 8954.00, 8990.00, 9169.00, 9706.00, 9857.00, 10024.00, 10380.00, 10884.00, 11290.00, 11331.00),
  Vietnam_palmoil_import_quantity = c(556.00, 567.00, 600.00, 655.00, 449.00, 429.00, 485.00, 418.00, 457.00, 616.00, 682.00)
)

#Plot of the relation between how the production of soybean oil in the US compares to the imports of sunflower seed oil in Oceania and palm oil in Vietnam
ggplot(Combined_import_data, aes(x = year)) + 
  geom_line(aes(y = Oceania_sunflowerseed_import_quantity, color = "Oceania sunflowerseed oil imports")) + 
  geom_line(aes(y = US_Soyabean_production_quantity, color = "US Soyabean production")) + 
  geom_line(aes(y = Vietnam_palmoil_import_quantity, color = "Vietnam palm oil imports"))

#Plot of the relation between how the imports of sunflower seed oil in Oceania and palm oil in Vietnam (without the production of soybean oil in the US)
ggplot(Combined_import_data, aes(x = year)) + 
  geom_line(aes(y = Oceania_sunflowerseed_import_quantity, color = "Oceania sunflowerseed oil imports")) + 
  geom_line(aes(y = Vietnam_palmoil_import_quantity, color = "Vietnam palm oil imports"))

#I wanted to see how each region got some of their most popular vegetable oil used for their food. The smaller island in Oceania gets their
#vegetable oil primarily through imports from larger countries such as Austrailia or New Zealand, the United States produces their own 
#vegetable oil domestically, and Vietnam has their vegetable oil imported from neighboring countries such as Cambodia. Each of these 
#regions uses multiple other vegetable oils, but I only chose the ones I did because they are popularly used.


###FOOD CONSUMPTION
##OCEANIA
#Sunflowerseed oil Fat Quantity Supply in Oceania
Oceania_fat_quantity_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  fat_quantity_supply = c(1.28, 1.23, 1.25, 1.28, 1.69, 1.66, 1.72, 1.75, 1.77, 2.06, 2.13)
)

model_sunflowerseed_fat_oceania <- lm(fat_quantity_supply ~ year, data = Oceania_fat_quantity_data)

summary(model_sunflowerseed_fat_oceania)

#Plot of the fat quantity supply of sunflowerseed oil in Oceania from 2010 - 2020
ggplot(Oceania_fat_quantity_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "Fat quantity supply of sunflowerseed oil in Oceania"))


#Poultry Meat Food Supply Quantity in Oceania
Oceania_poultry_quantity_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  food_supply_quantity = c(33.12, 33.72, 34.30, 34.12, 34.51, 34.81, 36.06, 36.13, 35.30, 36.05, 35.18)
)

model_poultry_supply_oceania <- lm (food_supply_quantity ~ year, data = Oceania_poultry_quantity_data)

summary(model_poultry_supply_oceania)

#Plot of the food supply quantity of poulry meat from 2010 - 2020
ggplot(Oceania_poultry_quantity_data, aes(x = year)) + 
  geom_line(aes(y = food_supply_quantity, color = "Oceania food supply quantity of poultry meat"))

#Combined data frame of fat quantity supply of sunflower seed oil and food supply quantity of poultry meat in Oceania
Combined_Oceania_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  fat_quantity_supply = c(1.28, 1.23, 1.25, 1.28, 1.69, 1.66, 1.72, 1.75, 1.77, 2.06, 2.13),
  food_supply_quantity = c(33.12, 33.72, 34.30, 34.12, 34.51, 34.81, 36.06, 36.13, 35.30, 36.05, 35.18)
)

#Combined Plot of fat quantity supply of sunflower seed oil and food supply quantity of poultry meat in Oceania to see if there is a relation
ggplot(Combined_Oceania_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "Oceania fat quantity supply of sunflowerseed oil")) + 
  geom_line(aes(y = food_supply_quantity, color = "Oceania food supply quantity of poultry meat"))


##UNITED STATES
#Soyabean oil Fat Quantity Supply in the US
US_fat_quantity_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  fat_quantity_supply = c(57.76, 59.65, 59.73, 59.61, 59.75, 59.55, 59.55, 60.06, 60.87, 62.26, 38.07)
)

model_soyabean_fat_US <- lm(fat_quantity_supply ~ year, data = US_fat_quantity_data)

summary(model_soyabean_fat_US)

#Plot of the US fat quantity supply of soybean oil from 2010 - 2020
ggplot(US_fat_quantity_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "US fat quantity supply of soybean oil"))


#Poultry Meat Food Supply Quantity in the US
US_poultry_quantity_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  food_supply_quantity = c(50.94, 51.44, 49.52, 50.01, 51.15, 54.67, 55.55, 55.80, 56.92, 58.38, 58.69)
)

model_poultry_supply_US <- lm(food_supply_quantity ~ year, data = US_poultry_quantity_data)

summary(model_poultry_supply_US)

#Plot of the US food supply quantity of poultry meat from 2010 - 2020
ggplot(US_poultry_quantity_data, aes(x = year)) + 
  geom_line(aes(y = food_supply_quantity, color = "US food supply quantity of poultry meat"))

#Combined data frame of fat quantity supply of soybean oil and food supply quantity of poultry meat in the US
Combined_US_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  fat_quantity_supply = c(57.76, 59.65, 59.73, 59.61, 59.75, 59.55, 59.55, 60.06, 60.87, 62.26, 38.07),
  food_supply_quantity = c(50.94, 51.44, 49.52, 50.01, 51.15, 54.67, 55.55, 55.80, 56.92, 58.38, 58.69)
)

#Combined Plot of fat quantity supply of soybean oil and food supply quantity of poultry meat in the US to see if there is a relation
ggplot(Combined_US_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "US fat quantity supply of soybean oil")) + 
  geom_line(aes(y = food_supply_quantity, color = "US food supply quantity of poultry meat"))


##VIETNAM
#Palm oil Fat Quantity Supply in Vietnam
Vietnam_fat_quantity_data <- data.frame(
  year = c(2015, 2017, 2018, 2019, 2020),
  fat_quantity_supply = c(0.00, 0.00, 0.00, 2.86, 3.11)
)

model_palmoil_fat_Vietnam <- lm(fat_quantity_supply ~ year, data = Vietnam_fat_quantity_data)

summary(model_palmoil_fat_Vietnam)

#Plot of Vietnam fat quantity supply of palm oil from 2015 - 2020
ggplot(Vietnam_fat_quantity_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "Vietnam fat quantity supply of palm oil"))

#Poultry Meat Food Supply Quantity in Vietnam
Vietnam_poultry_quantity_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  food_supply_quantity = c(11.81, 14.64, 11.34, 12.85, 11.08, 9.37, 9.58, 9.81, 11.24, 13.80, 15.81)
)

model_poultry_supply_Vietnam <- lm(food_supply_quantity ~ year, data = Vietnam_poultry_quantity_data)

summary(model_poultry_supply_Vietnam)

#Plot of Vietnam food supply quantity of poultry meat from 2010 - 2020
ggplot(Vietnam_poultry_quantity_data, aes(x = year)) + 
  geom_line(aes(y = food_supply_quantity, color = "Vietnam food supply quantity of poultry meat"))

#Combined Plot of fat quantity supply of soybean oil and food supply quantity of poultry meat in Vietnam
Combined_Vietnam_data <- data.frame(
  year = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  fat_quantity_supply = c(0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2.86, 3.11),
  food_supply_quantity = c(11.81, 14.64, 11.34, 12.85, 11.08, 9.37, 9.58, 9.81, 11.24, 13.80, 15.81)
)

#Combined Plot of fat quantity supply of soybean oil and food supply quantity of poultry meat in Vietnam to see if there is a relation
ggplot(Combined_Vietnam_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "Vietnam fat quantity supply of palm oil")) + 
  geom_line(aes(y = food_supply_quantity, color = "Vietnam food supply quantity of poultry meat"))

#I chose each type of vegetable oil because each was used most frequently in those regions, and I chose poultry meat because vegetable oil 
#is most frequently used to cook or fry foods. Chicken is frequently cooked or fried using vegetable oil (such as in fast food for example),
#I wanted to see perhaps how each region could use vegetable oil specifically with the amount of poultry (chicken) that is available there. 
#Each of these regions uses multiple other vegetable oils, but I only chose the ones I did because they are popularly used.
#Specifically in Oceania, small island countries are swtiching to consume more fried and processed foods, some popularized by th US.
#Although Vietnam uses vegetable oil in a reasonable amount, they may culturally have a completely different diet than the countries with
#the high obesity rates. For example, they may eat poultry (chicken) a completely different way than the highest obesity rate countries do.
################################################

# Note: Did leave your name to the top of this script?
