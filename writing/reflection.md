
# Course Final Project :: CS301

**Due** : Thursday, 4th May 2023, 7:00pm (Note: Strict deadline, no extensions are possible)

## Names of all members

- Ryan Kennedy

## Research topic

- Vegetable Oil and Obesity

## Literature review

- That talks about the most popular vegetable oils in Vietnam:

```md
 "https://vegetableoilhx.com/news/production-and-consumption-of-vegetable-oils-in-vietnam-to-2025/747.html"

 "<https://wisevoter.com/country-rankings/most-obese-countrie#:~:text=According%20to%20data%20from%20the>,populations%20being%20classified%20as%20obese"
```

- This article describes how the most popular vegetable oil to use in the US for cooking is Soybean oil:

```md
"<https://www.universityofcalifornia.edu/news/americas-most-widely-consumed-cooking-oil-causes-genetic-changes-brain#:~:text=Used%20for%20fast%20food%20frying>,is%20not%20healthy%20for%20humans"
```

- We also looked up separately like what type of vegetable oils are mostly used in Polynesia, the United States, and Vietnam,   and how these countries get their vegetable oil like either from domestic production or from imports

```md
"https://worldpopulationreview.com/country-rankings/obesity-rates-by-country"
```

- More Reviews on vegetable oil and its effects

```md
"https://www.fao.org/faostat/en/#data/FBS"

"https://www.zeroacre.com/white-papers/how-vegetable-oil-makes-us-fat"
```

## In clear and meaningful language, discuss your three (foundational) questions

1. How does the consumption of vegetable oil affect disporportionately impacted populations? We focused on the US, Oceania, and Vietnam.

2. What are cultural differences in food consumption between multiple different countries or regions? We focused on the US, Oceania, and Vietnam.

3. How may the food industry contribute to the high obesity rates in multiple different countries or regions. We focused on the US, Oceania, and Vietnam.

- It is worth noting that we chose to focus on the Oceania, the US, and Vietnam due to looking at the current obesity rates in all countries of the world. The top 10 countries with the highest obesity rates belong in Oceania, while the US (who is mostly stereotypcially thought of as one of the largest obese country in the world) sits at number 12 of the highest obesity rates, and Vietnam where it has the lowest obesity rate out of any country in the world. However, the population in every country must also be taken into consideration when analyzing the data we have put together.

## What motivation is there behind these questions?

- The motivation behind these questions is to gain a better understanding of the factors contributing to obesity, the most common methods of measuring and assessing obesity, and the types and sources of vegetable oils used in different regions of the world. Vegetable oil has been proved to be directly correlated with obesity due to the high concentration of linoleic acid found in them, which is a type of omega-6 fatty acid. Some vegetable oils may also contain Omega-3 fatty acids. By exploring these questions, researchers may be able to identify potential interventions or policy changes that could help reduce obesity rates, improve health outcomes, and promote sustainable and equitable food systems. Additionally, understanding the types and sources of vegetable oils used in different countries can help inform discussions around food security, agricultural policy, and international trade. 

## Q1, Method, Code and Conclusion
1. How does the consumption of vegetable oil affect disporportionately impacted populations? We focused on the US, Oceania, and Vietnam.

- Regression model showing the millions of people who cannot afford a healthy diet in the US from  2017 - 2020

```R
summary(model_unaffordable_diet_US)

Call:
lm(formula = unaffordable_diet ~ year, data = data)

Residuals:
   Min     1Q Median     3Q    Max 
 -0.32  -0.14   0.04   0.18   0.24 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  1135.86     161.48   7.034 0.000412 ***
year           -0.56       0.08  -7.000 0.000423 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.253 on 6 degrees of freedom
Multiple R-squared:  0.8909, Adjusted R-squared:  0.8727 
F-statistic:    49 on 1 and 6 DF,  p-value: 0.0004235

```

- After conducting the analysis and based solely on the model, it appears that there is a statistically significant negative relationship between year and unaffordable diet. This means that as the year increases, the number of people who cannot afford a healthy diet decreases. This finding may have implications for obesity and prices, as the affordability of healthy food is a key factor in preventing obesity and improving overall health.

```R
# Plot the data and the fitted regression line of people with an unaffordable healthy diet in the US 
plot(unaffordable_diet_US_data$year, unaffordable_diet_US_data$unaffordable_diet,
    xlab = "Year", ylab = "Millions of people who cannot afford a healthy diet in the US"
)
abline(model_unaffordable_diet_US, col = "red")
```
- This graph visually shows this negative trend from 2017 - 2020



- Regression model showing the millions of people who cannot afford a healthy diet in the Oceania from  2018 - 2020
```R
summary(model__unaffordable_diet_Oceania)

Call:
lm(formula = unaffordable_diet ~ year, data = unaffordable_diet_Oceania_data)

Residuals:
      1       2       3 
-0.1333  0.2667 -0.1333 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept) 409.2333   466.2681   0.878    0.541
year         -0.2000     0.2309  -0.866    0.546

Residual standard error: 0.3266 on 1 degrees of freedom
Multiple R-squared:  0.4286,	Adjusted R-squared:  -0.1429 
F-statistic:  0.75 on 1 and 1 DF,  p-value: 0.5456
```
- It appears that since the p-value is higher than 0.05, we can accept the null hypothesis and determine that there is nothing worth noting going on in this data. However, this data only covers the years 2018 - 2020 (as this was the only data available for this region), which may affect how realistically accurate this model actually is. This could be due to how small most of these island countries are in Oceania.

```R
#Plot of Millions of people who cannot afford a healthy diet in Oceania from 2018 - 2020
plot(unaffordable_diet_Oceania_data$year, unaffordable_diet_Oceania_data$unaffordable_diet,
     xlab = "Year", ylab = "Millions of people who cannot afford a healthy diet in Oceania"
)
abline(model__unaffordable_diet_Oceania, col = "red")
```
- This graph shows a negative trend in millions of people who cannot afford a healthy diet. However, when looking at how much it is actually going down, it appears it is not as much of drastic a change afterall.


- Regression model showing the millions of people who cannot afford a healthy diet in Vietnam from 2017 - 2020.
```R
summary(model_unaffordable_diet_Vietnam)

Call:
lm(formula = unaffordable_diet ~ year, data = unaffordable_diet_Vietnam_data)

Residuals:
    1     2     3     4 
 1.23 -0.69 -2.31  1.77 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept) 1401.030   2064.206   0.679    0.567
year          -0.680      1.023  -0.665    0.575

Residual standard error: 2.287 on 2 degrees of freedom
Multiple R-squared:  0.181,	Adjusted R-squared:  -0.2284 
F-statistic: 0.4421 on 1 and 2 DF,  p-value: 0.5745
```
- This model shows a p-value higher than 0.05 which means that we can accept the null hypothesis, and there is nothing special worth noting that is occuring in this data. However this could be due to the fact that there was only data available from 2017 - 2020.

```R
#Plot of Millions of people who cannot afford a healthy diet in Vietnam from 2017 - 2020
plot(unaffordable_diet_Vietnam_data$year, unaffordable_diet_Vietnam_data$unaffordable_diet,
     xlab = "Year", ylab = "Millions of people who cannot afford a healthy diet in Vietnam"
)
abline(model_unaffordable_diet_Vietnam, col = "red")
```
- This graph shows the negative correlation from 2017 - 2020 of the millions of people who cannot afford a healthy diet. This is fitting for Vietnam, as they were once considered a low-income country, and they have economically made the transition of being considered to be a lower-middle income country. This economic transition may influence how many people can afford a healthy diet, or this might have to do with how they culturally eat food.


- Regssion model showing the Domestic Supply Quantity of vegetable oil in Oceania from 2010 - 2020.
```R
summary(model_Oceania_supply)

Call:
lm(formula = domestic_supply_quantity ~ year, data = Oceania_supply_data)

Residuals:
    Min      1Q  Median      3Q     Max 
-57.318  -6.168   3.382  15.132  31.482 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -39049.682   5368.963  -7.273 4.70e-05 ***
year            19.900      2.664   7.469 3.82e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 27.95 on 9 degrees of freedom
Multiple R-squared:  0.8611,	Adjusted R-squared:  0.8456 
F-statistic: 55.78 on 1 and 9 DF,  p-value: 3.817e-05
```
- This model shows a very low p-value beneath 0.05 which means that we can reject the null hypothesis and say that there is something significant occurring in our data. This may be because of the small island countries in Oceania having the highes obesity rates, and using vegetable oil a lot in their food.

```R
#Plot of the domestic supply quantity of vegetable oil in Oceania from 2010 - 2020
ggplot(Oceania_supply_data, aes(x = year)) + 
  geom_line(aes(y = domestic_supply_quantity, color = "Oceania domestic supply quantity of vegetable oil"))
```
- This graph shows an increase in vegetable oil domestic supply from 2010 - 2020. Although it may appear to be a rather slow increase in the past 10 years, the population sizes in the small island countries must be taken into account. These small island countries have in recent years also been making the transition to eating more processed foods imported by larger neighboring countries such as Austraila. When taking these factors into account, it is alarming that vegetable oil has been overall increasing in Oceania, as the small countries in Oceania have the highest obesity rates in the world currently.


- Regression model showing the Domestic Supply Quantity of vegetable oil in the US from 2010 - 2020.
```R
summary(model_US_supply)

Call:
lm(formula = domestic_supply_quantity ~ year, data = US_supply_data)

Residuals:
    Min      1Q  Median      3Q     Max 
-453.68 -156.32   55.55  131.07  317.64 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -1.011e+06  4.469e+04  -22.62 3.06e-09 ***
year         5.093e+02  2.218e+01   22.97 2.67e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 232.6 on 9 degrees of freedom
Multiple R-squared:  0.9832,	Adjusted R-squared:  0.9814 
F-statistic: 527.4 on 1 and 9 DF,  p-value: 2.673e-09
```
- This model shows a p-value very lowe than 0.05 which means that we can reject the null hypothesis and say that there is something significant occuring in our data. This makes sense for the US, as it is still one of the top countries in the world with the highest obesity rates with also a large population.

```R
#Plot of the domestic supply quantity of vegetable oil in the US from 2010 - 2020
ggplot(US_supply_data, aes(x = year)) + 
  geom_line(aes(y = domestic_supply_quantity, color = "US domestic supply quantity of vegetable oil"))
```
- This graph shows a very large increase over the past 10 years of the domestic supply qunatity of vegetable oils in the US. This makes sense due to many reasons, one being that the food industry (specifcally the fast food industry that makes fried foods) is a very popular business in the American economic market, and another one being that the American diet consists of eating many processed and fried foods on the daily, which is essential for keeping the businesses in the food industry responsible for these foods alive. These vegetable oils may also may possibly used for exporting to different countries, or the American food businesses spread throughout the world (or ones influenced) may need these vegetable oils as well.

- Regression model showing the Domestic Supply Quantity of vegetable oil in Vietnam from 2010 - 2020.
```R
summary(model_vietnam_supply)

Call:
lm(formula = domestic_supply_quantity ~ year, data = Vietnam_supply_data)

Residuals:
     Min       1Q   Median       3Q      Max 
-121.100  -86.795    6.409   80.145  144.136 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)
(Intercept) -12429.227  18917.028  -0.657    0.528
year             6.627      9.388   0.706    0.498

Residual standard error: 98.46 on 9 degrees of freedom
Multiple R-squared:  0.05246,	Adjusted R-squared:  -0.05282 
F-statistic: 0.4983 on 1 and 9 DF,  p-value: 0.4981
```
- This model shows a p-value that is higher than 0.05 which means we can accept the null hypothesis and say that there is nothign significant occurring in our data. This may be an explaining factor as to why Vietnam has the lowest obesity rate in the world, as there appears to be nothing significant with the amounts of vegetable oil avaialble in Vietnam domestically over the past 10 years.

```R
#Plot of the domestic supply quantity of vegetable oil in Vietnam from 2010 - 2020
ggplot(Vietnam_supply_data, aes(x = year)) + 
  geom_line(aes(y = domestic_supply_quantity, color = "Vietnam domestic supply quantity of vegetable oil"))
```
- This graph shows how for the most part the vegetable oil domestic supply quantity in Vietnam has been low. Although it shows it skyrocketing in 2020, this could be due to the country potentially engaging in a cultural shift in how they are eating their food, possible engaging with more Western food companies, as Vietnam has transitioned over the years from a low income country to a lower-middle income country. The low amounts of vegetable oil shown in this graph could also explain the cultural food consumption habits Vietnam "used" to have, as they have been known to stick with a more natural and less processed diet.


- These next plots will now show combined data that has been previously exaplained
```R
#Combined Plot of the domestic supply quantities of vegetable oil between Oceania, the US, and Vietnam to show the differences
ggplot(Combined_supply_data, aes(x = year)) + 
  geom_line(aes(y = Oceania_domestic_supply_quantity, color = "Oceania domestic supply vegetable oil")) + 
  geom_line(aes(y = US_domestic_supply_quantity, color = "US domestic supply vegetable oil")) + 
  geom_line(aes(y = Vietnam_domestic_supply_quantity, color = "Vietnam domestic supply vegetable oil"))
```
- This plot shows the relation between the domestic supply quantities of vegetable oil in Oceania, the US, and Vietnam from 2010 - 2020. It shows specifically how the US has blown Oceania and Vietnam out of proportion when looking at the amount of vegetable oil it has made avaialable domestically. This could primarily be because of the population difference the US has compared to Oceania and Vietnam. This could also be because of the food companies the US is tied to that need vegetable oil for their food, as well as the countries that accept vegetable oil from the US as an exported good.


```R
#Combined Plot of the domestic supply quantities of vegetable oil between Oceania and Vietnam (this plot excludes the US to show how much
#Oceania has truly increased over the past 10 years, and when Oceania is plotted with the US, Oceana's plot appears visually 
#disproportionate. This is primarily due to how much more vegetable oil is available domestically based on both region's population size).
ggplot(Combined_supply_data, aes(x = year)) + 
  geom_line(aes(y = Oceania_domestic_supply_quantity, color = "Oceania domestic supply vegetable oil")) + 
  geom_line(aes(y = Vietnam_domestic_supply_quantity, color = "Vietnam domestic supply vegetable oil"))
```
- This plot shows the same data from the previous plot, except without the US being plotted. This plot is used to compare the vegetable oil domestic supply quantities of Oceania and Vietnam, and how much Oceania has increased compared to Vietnam over the past 10 years.


- The next regression models and plots are created from the combined data of the millions of people who can't afford a healthy diet and the domestic supply of vegetable oil in the US, Oceania, and Vietnam.
- This regression model shows the relationship between the domestic supply quantity of vegetable oil and millions of people who can't afford a healthy diet in the US.
```R
summary(model_combined_one)

Call:
lm(formula = US_domestic_supply_quantity + unaffordable_diet_US ~ 
    year, data = Combined_unaffordable_supply_data)

Residuals:
   Min     1Q Median     3Q    Max 
-454.1 -156.6   55.6  131.0  317.0 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -1.010e+06  4.470e+04  -22.60 3.08e-09 ***
year         5.092e+02  2.218e+01   22.95 2.69e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 232.7 on 9 degrees of freedom
Multiple R-squared:  0.9832,	Adjusted R-squared:  0.9813 
F-statistic: 526.8 on 1 and 9 DF,  p-value: 2.688e-09
```
- This model shows a p-value very lower than 0.05 which means that we can reject the null hypothesis and say that there is something significant occuring in our data. This tells us that there is a correlation between the millions of people who can't afford a healthy diet and the domestic suppply quantity of vegetable oil in the US over the past 10 years.

```R
plot(model_combined_one)
```
- This shows multiple plots explaining visually how the millions of people who can't afford a healthy diet and the domestic supply quantity of vegetable oil are correlated, as the residuals are plotted around the line of best fit (in the plot titled Residuals vs. Fitted).


- This regression models shows the relationship between the domestic supply quantity of vegetable oil and millions of people who can't afford a healthy diet in Oceania
```R
summary(model_combined_three)

Call:
lm(formula = Oceania_domestic_supply_quantity + unaffordable_diet_Oceania ~ 
    year, data = Combined_unaffordable_supply_data)

Residuals:
    Min      1Q  Median      3Q     Max 
-57.645  -6.188   3.422  15.145  31.533 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -39022.218   5386.302  -7.245 4.84e-05 ***
year            19.889      2.673   7.440 3.93e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 28.04 on 9 degrees of freedom
Multiple R-squared:  0.8602,	Adjusted R-squared:  0.8446 
F-statistic: 55.36 on 1 and 9 DF,  p-value: 3.932e-05
```
- This model shows a p-value very lower than 0.05 which means that we can reject the null hypothesis and say that there is something significant occurring in our data. This tells us that there is a correlation between the millions of people who can't afford a healthy diet and the domestic suppply quantity of vegetable oil in Oceania over the past 10 years.

```R
plot(model_combined_three)
```
- This shows multiple plots explaining visually how the millions of people who can't afford a healthy diet and the domestic supply quantity of vegetable oil are correlatted, as they plotted around the line of best fit, some even touching it (in the plot titled Residuals vs. Fitted).


- This regression model shows the relationship between the domestic supply quantity of vegetable oil and millions of people who can't afford a healthy diet in Vietnam
```R
summary(model_combined_two)

Call:
lm(formula = Vietnam_domestic_supply_quantity + unaffordable_diet_Vietnam ~ 
    year, data = Combined_unaffordable_supply_data)

Residuals:
     Min       1Q   Median       3Q      Max 
-120.599  -86.484    5.641   78.831  145.041 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)
(Intercept) -11760.041  18834.012  -0.624    0.548
year             6.310      9.347   0.675    0.517

Residual standard error: 98.03 on 9 degrees of freedom
Multiple R-squared:  0.0482,	Adjusted R-squared:  -0.05756 
F-statistic: 0.4557 on 1 and 9 DF,  p-value: 0.5166
```
- This model shows a p-value above 0.05 which means we can accept the null hypothesis and say that there is nothing significant occuring in our data. This tells us that there is not a correlation between the millions of people who can't afford a healthy diet and the domestic suppply quantity of vegetable oil in Oceania over the past 10 years. This would make sense for Vietnam when looking at their low obesity rates, as if these variables were correlated, it would more than likely make Vietnam's obesity rates increase.

```R
plot(model_combined_two)
```
- This shows multiple plots explaining visually how the millions of people who can't afford a healthy diet and the domestic supply quantity of vegetable oil are not correlatted, as they not plotted as close the line of best fit (in the plot titled Residuals vs. Fitted).


- This regression model shows the domestic supply quantity of vegetable oils in low income food deficit countries. It may be important to look at this as Vietnam was once recently considered a low-income country (now they have transitioned to be considered a lower-middle income country, and many of the small island countries in Oceania are also considered low income as well). 
```R
summary(model_low_income_supply)

Call:
lm(formula = domestic_supply_quantity ~ year, data = Low_income_supply_data)

Residuals:
    Min      1Q  Median      3Q     Max 
-2693.8 -1162.0     5.3   708.0  3548.5 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -2448053.8   341611.0  -7.166 5.27e-05 ***
year            1231.3      169.5   7.263 4.75e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1778 on 9 degrees of freedom
Multiple R-squared:  0.8542,	Adjusted R-squared:  0.838 
F-statistic: 52.75 on 1 and 9 DF,  p-value: 4.751e-05
```
- This models shows a p-value very lower than 0.05 which means we can reject the null hypothesis and say that there is something significant occurring in our data. This directly correlates to how many of the small island countries in Oceania have the highest obesity rates, as the data of domestic supply quantity of vegetable oil appears to be significant when looking at the past 10 years. However, this does not specifically look at Oceania, this looks at a general picture of all the low-income food deficit countries in the world.

```R
ggplot(Low_income_supply_data, aes(x = year)) + 
  geom_line(aes(y = domestic_supply_quantity, color = "Low income countries vegetable oil domestic supply"))
```
- This plot visually shows how the domestic supply quantities of vegetable oil in low income countries have increased on a drastic level, leading to a very harsh positive trend over the past 10 years. Although this plot looks at all of the low-income food deficit countries in the world ata general view, this nonetheless proves that over the past 10 years low-income countries have seen a very high increase of vegetable oils.


- This regression models shows the fat quantity supply in vegetable oils in low income food deficit countries. This may prove that there is a correlation in these types of countries with the amount of domestic vegetable oil available to them, and their obesity rates (which could explain Oceania).
``` R
summary(model_low_income_fat)

Call:
lm(formula = fat_quantity_supply ~ year, data = Low_income_fat_data)

Residuals:
    Min      1Q  Median      3Q     Max 
-1.0269 -0.3068 -0.1196  0.5394  0.8333 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)   
(Intercept) -385.88409  124.62021  -3.096  0.01279 * 
year           0.20245    0.06185   3.274  0.00963 **
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.6486 on 9 degrees of freedom
Multiple R-squared:  0.5435,	Adjusted R-squared:  0.4928 
F-statistic: 10.72 on 1 and 9 DF,  p-value: 0.009628
```
- This model shows a p-value below 0.05 which means we can reject the null hypothesis and say that there is something significant occurring in our data. This can prove the correlation between the amount of domestic vegetable oil available in low income food deficit countries.

```R
ggplot(Low_income_fat_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "Low income countries vegetable oil fat supply"))
```
- This plot visually shows the positive trend in fat quantity supply in vegetable oil in low income food deficite countries over the past 10 years, which can lead us to conclude that vegatable oil may be a concreate factor explaining why the small island countries Oceania has the highest obesity rates.

## Q2, Method, Code and Conclusion
2. What are cultural differences in food consumption between multiple different countries or regions? We focused on the US, Oceania, and Vietnam.

- It is worth noting that every type of vegetable oil we chose was one that was most commonly associated with each country or region. We chose to focus on sunflowerseed oil for Oceania, soybean oil in the US, and palm oil in Vietnam. While the data for these variables is essential for understanding how each might affect the food industry, it is important to keep in mind that Oceania, the US, and Vietnam uses multiple other types of vegetable oil at the same time. We only wanted to choose the most popular tyoe of vegetable oil.    It is also worth noting that every country in the world may use vegetable oil in their own ways within their culture. However, high obesity rates have been correlated with countries having poor diets while consuming more Westernized foods.

- This regression model shows the Import Quantity of sunflower seed oil in Oceania. We chose to focus on Import Quantity because the smaller island countries in Oceania primarily gets their vegetable imported to them from other larger countries neighboring, them such as Australia.
```R
summary(model_sunflowerseed_imoprts_oceania)

Call:
lm(formula = import_quantity ~ year, data = Oceania_sunflowerseed_data)

Residuals:
   Min     1Q Median     3Q    Max 
-6.427 -3.123  1.327  3.255  5.500 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -1.093e+04  8.496e+02  -12.87 4.24e-07 ***
year         5.464e+00  4.216e-01   12.96 3.99e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 4.422 on 9 degrees of freedom
Multiple R-squared:  0.9491,	Adjusted R-squared:  0.9435 
F-statistic: 167.9 on 1 and 9 DF,  p-value: 3.991e-07
```
- This model shows a p-value very below 0.05 which means we can reject the null hypothesis and say that there is something significant occurring in our data.

```R
ggplot(Oceania_sunflowerseed_data, aes(x = year)) + 
  geom_line(aes(y = import_quantity, color = "Imports of sunflower seed oil in Oceania"))
```
- This plot visually shows a drastic positive trend and increase over the past 10 years in the imports of sunflowerseed oil in Oceania. This may be the case because many of the small island low income food deficit countries in Oceania have in recent years transitioned into a diet of more prrocessed and fried foods, popularized from countries with Western food culture engrained in them. This could be why Austrailia imports vegetable oil into the rest of Oceania, as their economy is much stronger, and have some Western influence on their food. This Western influence can come from many of the food companies or busnisses within Austrailia (for example) mainly tied to the US.


- This regression model shows the Production of soybean oil in the US. We chose to focus on Production because most of the vegetable oil in the US is produced within the country itself, instead of imported inwards.
```R
summary(model_soyabean_production_US)

Call:
lm(formula = production ~ year, data = US_soyabean_production_data)

Residuals:
    Min      1Q  Median      3Q     Max 
-185.56  -93.09  -29.14   85.74  217.51 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -569683.68   27945.73  -20.39 7.67e-09 ***
year            287.65      13.87   20.74 6.59e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 145.5 on 9 degrees of freedom
Multiple R-squared:  0.9795,	Adjusted R-squared:  0.9772 
F-statistic: 430.2 on 1 and 9 DF,  p-value: 6.587e-09
```
- This model shows a p-value very lower than 0.05 which means we can reject the null hypothesis and say that there is something significant occurring in our data. 

```R
ggplot(US_soyabean_production_data, aes(x = year)) + 
  geom_line(aes(y = production, color = "Production of palm oil in the US"))
```
- This plot visually shows how soybean oil rates from the past 10 years have only increased drastically creating a positive trend in the US. This can explain how much the US both uses their soybean oil nationally, and internationally with their exports. This could be directly related to the US's growing high obesity rates corressponding with the size of their population, and how the Westernized food businesses may have made their mark on the global economy. 


- This regression model shows the Import Quantity of palm oil in Vietnam. We chose to focus on Import Quantity because most of the vegetable oil in Vietnam is imported into the country from neighboring countries.
```R
summary(model_palmoil_imports_Vietnam)

Call:
lm(formula = import_quantity ~ year, data = Vietnam_palmoil_data)

Residuals:
    Min      1Q  Median      3Q     Max 
-118.89  -84.26   16.50   70.55  146.23 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)
(Intercept)  1288.6818 19113.1237   0.067    0.948
year           -0.3727     9.4854  -0.039    0.970

Residual standard error: 99.48 on 9 degrees of freedom
Multiple R-squared:  0.0001715,	Adjusted R-squared:  -0.1109 
F-statistic: 0.001544 on 1 and 9 DF,  p-value: 0.9695
```
- This models shows a p-value higher than 0.05 which means we can accept the null hypothesis and say that there is nothing significant occurring in our data. This makes sense for Vietnam, as they have just transitioned to becoming a lower-middle class country, as well as transitioning their food culture, they may not use vegetable oil the same way as Ocenia or the US might.

```R
ggplot(Vietnam_palmoil_data, aes(x = year)) + 
  geom_line(aes(y = import_quantity, color = "Imports of palm oil in Vietnam"))
```
- This plot visually shows how for the most part over the past 10 years palm oil imports has been fairly low and inconsistent. This tells us that it may not have been a significant resource for Vietnam to have.


- The next plots will show the relation between the production of soybean oil in the US and the import quantities of sunflower seed oil in Oceania and palm oil in Vietnam.
```R
ggplot(Combined_import_data, aes(x = year)) + 
  geom_line(aes(y = Oceania_sunflowerseed_import_quantity, color = "Oceania sunflowerseed oil imports")) + 
  geom_line(aes(y = US_Soyabean_production_quantity, color = "US Soyabean production")) + 
  geom_line(aes(y = Vietnam_palmoil_import_quantity, color = "Vietnam palm oil imports"))
```
- This plot visually displays how the production of soybean oil blows the import qunatities of sunflower seed oil in Oceania and palm oil in Vietnam out of proportion. This could be due to the population difference in the US, as well as how involved the US is in the food industry, as they may need to produce this high amount of soybean oil to compete in the global market.

```R
ggplot(Combined_import_data, aes(x = year)) + 
  geom_line(aes(y = Oceania_sunflowerseed_import_quantity, color = "Oceania sunflowerseed oil imports")) + 
  geom_line(aes(y = Vietnam_palmoil_import_quantity, color = "Vietnam palm oil imports"))
```
- This plot shows the same data as the last plot except without the production of soybean oil in the US. This is designed to better visually display the differences in Oceania and Vietnam. Although Oceania is overall much lower in their importations, they are still gradually rising, while Vietnam is very inconsistent. Oceania is also primarily made up of many small island countries with low populations, which means that less imports may be needed, whereas Vietnam is a geographically bigger country compared to those smaller individual island countries with a much larger population.

## Q3, Method, Code and Conclusion

3. How may the food industry contribute to the high obesity rates in multiple different countries or regions. We focused on the US, Oceania, and Vietnam.

- It is worth noting that we chose to also focus on poultry meat in each country or region because chicken is often associated with fried food, especially in the American diet. It is important to keep in mind that vegetable oils are used for the creation of multiple other types of food, but since vegetable oil is used primarily in processed, fried, or "fatty" foods, we though to focus on poulty meat as a variable. We also wanted to focus on poultry meat in order to understand how each country or region may consume poultry meat in their culture, and how ultimately they may use their vegetable oil.   It is also worth noting tthat the same type of vegetable oil for Oceania, the US, and Vietnam is the same from the last research question.    Finally, we chose to focus on the variable Fat Quantity Supply to determine the relationship of linoleic acid/omega-6/omega-3 fatty acids in each type of vegetable oil, as consuming an excessive amount of these type of acids are known to cause obesity.

- This regression model shows the Fat Quantity Supply in sunflower seed oil in Oceania
```R
summary(model_sunflowerseed_fat_oceania)

Call:
lm(formula = fat_quantity_supply ~ year, data = Oceania_fat_quantity_data)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.156364 -0.074091  0.008182  0.061818  0.161818 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -183.39364   20.49675  -8.947 8.96e-06 ***
year           0.09182    0.01017   9.026 8.34e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.1067 on 9 degrees of freedom
Multiple R-squared:  0.9005,	Adjusted R-squared:  0.8895 
F-statistic: 81.48 on 1 and 9 DF,  p-value: 8.335e-06
```
- This model shows a p-value very lower than 0.05 which means we can reject the null hypothesis and say that there is something significant occurring in our data. This can mean that there is a large amount of fatty acids inside of this oil that can potentially cause obesity.

```R
ggplot(Oceania_fat_quantity_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "Fat quantity supply of sunflowerseed oil in Oceania"))
```
- This plot shows the drastic increase of fatty acids in sunflower seed oil in Oceania ove the past 10 years, which appears to display evidence that there is a large amount of fat consumption in Oceania which is causing the high obesity rates in the small island countries.

- This regression model shows the poultry meat supply quantity in Oceania.
```R
summary(model_poultry_supply_oceania)

Call:
lm(formula = food_supply_quantity ~ year, data = Oceania_poultry_quantity_data)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.94682 -0.26359 -0.07918  0.20141  0.95827 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)   
(Intercept) -481.54409  108.14671  -4.453  0.00159 **
year           0.25627    0.05367   4.775  0.00101 **
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.5629 on 9 degrees of freedom
Multiple R-squared:  0.717,	Adjusted R-squared:  0.6855 
F-statistic:  22.8 on 1 and 9 DF,  p-value: 0.001008
```
- This model shows a p-value beneath 0.05 which means we can reject the null hypothesis and say that there is something significant occurring in our data.

```R
ggplot(Oceania_poultry_quantity_data, aes(x = year)) + 
  geom_line(aes(y = food_supply_quantity, color = "Oceania food supply quantity of poultry meat"))
```
- This plot shows how the poultry meat supply quantity in Oceania has been on the rise in the past 10 years. This could posibly due to an increase of fried foods (such as fried chicken) with the cultural shift in a Westernized diet imported from larger countries such as Australia into the smaller island countries.


- This plot now shows if there is a relation between the fat quantity supply in sunflower seed oil and the poultry meat supply quantity in Oceania
```R
ggplot(Combined_Oceania_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "Oceania fat quantity supply of sunflowerseed oil")) + 
  geom_line(aes(y = food_supply_quantity, color = "Oceania food supply quantity of poultry meat"))
```
- This plot shows that there very well could be a relation. Although both lines plotted do not intersect or are not near one another. They still appear to follow the same positive trend fairy at similar rates over the past 10 years. This may be because Oceania like any other country or region uses many other types os vegetable oil other than sunflower seed oil, and they do not just use this type of oil to fry their food. There are also multiple different types of countries included in Oceania with different economic situtaions, such as Australia and Nauru. This means that they could possibly eat poultry meat in different ways culturally, or use vegetable oil in general in different amounts or ways.


- This regression models shows the fat quantity supply of soybean oil in the US
```R
summary(model_soyabean_fat_US)

Call:
lm(formula = fat_quantity_supply ~ year, data = US_fat_quantity_data)

Residuals:
     Min       1Q   Median       3Q      Max 
-16.0132  -0.8756   1.0910   3.0526   7.4142 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)
(Intercept) 1594.6086  1248.3391   1.277    0.233
year          -0.7626     0.6195  -1.231    0.250

Residual standard error: 6.498 on 9 degrees of freedom
Multiple R-squared:  0.1441,	Adjusted R-squared:  0.04901 
F-statistic: 1.515 on 1 and 9 DF,  p-value: 0.2495
```
- This model shows a p-value above 0.05 which means we can accept the null hypothesis and say that there is nothing significant occuring with our data. This could be due to the state the US has been in for numerous years with their obesity rates and sterotype placed on their citizens.

```R
ggplot(US_fat_quantity_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "US fat quantity supply of soybean oil"))
```
- This plot shows a fairly neutral trend in the past 10 years of fat quantity supply of soybean oil in the US. Especially if the fat quantity supply of soybean oil increased in the US, this would more than likely increase their obesity rates, as soybean oil is used in numerous processed and fried food in the Westernized diet.


- This regression model shows the poultry meat supply quantity in the US
```R
summary(model_poultry_supply_US)

Call:
lm(formula = food_supply_quantity ~ year, data = US_poultry_quantity_data)

Residuals:
    Min      1Q  Median      3Q     Max 
-2.0020 -0.7796  0.1494  0.7187  1.7832 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -1863.8150   257.0713   -7.25 4.82e-05 ***
year            0.9517     0.1276    7.46 3.85e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.338 on 9 degrees of freedom
Multiple R-squared:  0.8608,	Adjusted R-squared:  0.8453 
F-statistic: 55.65 on 1 and 9 DF,  p-value: 3.852e-05
```
- This model shows a p-value that is very lower than 0.05 which means we can reject the null hypothesis and say that there is something significant occurring in our data.

```R
ggplot(US_poultry_quantity_data, aes(x = year)) + 
  geom_line(aes(y = food_supply_quantity, color = "US food supply quantity of poultry meat"))
```
- This plot shows a drastic increase and positive trend of the poultry meat supply quantity over the past 10 years in the US. This could be because how much poultry meat is invloved in the food industry nationally or internationally. Especially in fast food, chicken is a primary commodity that is needed to keep businsses alive. Every country consunmes poultry meat in different ways, even within the US poultry meat is consumed or used other ways than fried food; it is very popular.


- This plot shows the combined data of the fat quantity of soybean oil and the poultry meat supply quantity to see if there is a relation
```R
ggplot(Combined_US_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "US fat quantity supply of soybean oil")) + 
  geom_line(aes(y = food_supply_quantity, color = "US food supply quantity of poultry meat"))
```
- This plot shows that the fat quantity supply of soybean oil and the poultry meat supply quntity within the US over the past 10 years has is very correlated. This can be seen as the soybean oil line is plotted faily close to the poultry meat line with very high amounts. These lines also appear to follow nearly the same positive trend. This could mean that soybean oil is more often used in fast food (fried chicken). This could also mean that soybean oil may be one of the leading types of vegetale oil that is contributing to high obesity rates not only within the US, but other countries that may follow a similar Western diet, as well as any country that imports soybean oil to use for consumption purposes in any other way.


- This regression model shows the fat quantity supply in palm oil in Vietnam
```R
summary(model_palmoil_fat_Vietnam)

Call:
lm(formula = fat_quantity_supply ~ year, data = Vietnam_fat_quantity_data)

Residuals:
      1       2       3       4       5 
 0.7497 -0.6386 -1.3328  0.8330  0.3888 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)  
(Intercept) -1399.5409   573.8784  -2.439   0.0926 .
year            0.6942     0.2844   2.441   0.0924 .
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.094 on 3 degrees of freedom
Multiple R-squared:  0.6651,	Adjusted R-squared:  0.5535 
F-statistic: 5.958 on 1 and 3 DF,  p-value: 0.09243
```
- This model shows a p-value over 0.05 which means we can accept the null hypothesis and say that there is nothing significant occuring in our data. This can make sense due to the low obesity rates in Vietnam, and although palm oil is the most popular vegetable oil used in this country, it may not have a significant amount of linoleic acid/Omega-6/Omega-3 fatty acid a part of it that is being consumed.

```R
ggplot(Vietnam_fat_quantity_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "Vietnam fat quantity supply of palm oil"))
```
- This plot shows that for a fair amount of time, there was hardly and fat supply a part of palm oil until about 2018 where there was a sharp increase, but with a very small amount actually increased. This proves that there is hardly any fat quantity supply within palm oil that Vietnamese people are consuming. This could be evidence to determine why Vietnam's obesity rates are so low, when palm oil is the most conumed oil but hardly any fatty acids are being consumed. This may be because palm oil may naturally not have these fatty acids, and may overall be a more "healthier" option than other types of vegetable oils.


- This regression model shows the poultry meat supply quantity in Vietnam
```R
summary(model_poultry_supply_Vietnam)

Call:
lm(formula = food_supply_quantity ~ year, data = Vietnam_poultry_quantity_data)

Residuals:
    Min      1Q  Median      3Q     Max 
-2.5691 -1.6132 -0.3602  1.3063  3.4727 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)
(Intercept) -148.52818  425.64316  -0.349    0.735
year           0.07964    0.21124   0.377    0.715

Residual standard error: 2.215 on 9 degrees of freedom
Multiple R-squared:  0.01555,	Adjusted R-squared:  -0.09384 
F-statistic: 0.1421 on 1 and 9 DF,  p-value: 0.7149
```
- This models shows a p-value higher than 0.05 which means we can accept the null hypothesis and say that there is nothing signifcant occurring in our data. This could be bceause Vietnam may not culturally consume poultry meat the same way other countries might consume it where it is very popular not only culturally but economically as well (for the food industry). 

```R
ggplot(Vietnam_poultry_quantity_data, aes(x = year)) + 
  geom_line(aes(y = food_supply_quantity, color = "Vietnam food supply quantity of poultry meat"))
```
- This plot shows a very inconsistent amount of poultry meat supply quantity over the past 10 years in Vietnam. This inconsistency could relate to how much the Vietnamese cuture prioritizes poultry meat in their diet.


- This plot shows the combined data of the dat quantity supply of palm oil and the poultry meat supply quantity in Vietnam to see if there is a relation
```R
ggplot(Combined_Vietnam_data, aes(x = year)) + 
  geom_line(aes(y = fat_quantity_supply, color = "Vietnam fat quantity supply of palm oil")) + 
  geom_line(aes(y = food_supply_quantity, color = "Vietnam food supply quantity of poultry meat"))
```
- This plot shows how there may not be a relation to the fat quantity supply of palm oil and poultry meat supply quantity over the past 10 years in Vietnam. This is because both lines plotted for both variables are not plotted close to one another at all, and neither of the lines follow the same trend. Both appear to be inconsistent. There also does not appear to be a large amount of either, espeically considering the size of the popualtion of Vietnam. This may relate to how much the country actually includes frying poultry meat with palm oil in their diet.

### In conclusion

- Obesity is a complex issue, and the causes of obesity are multifactorial. Our research on the subject suggests that factors like sedentary lifestyle, high calorie intake, and genetics play a significant role in the development of obesity. However, we cannot overlook the role of food processing, chemicals, and sugar in causing obesity. Future research should continue to explore these complex factors to develop effective interventions and policies to reduce obesity rates.

- Body Mass Index (BMI) is the most commonly used method of measuring obesity. However, research suggests that BMI may not be the most accurate measure of obesity, as it does not account for factors like muscle mass or distribution of fat in the body. Waist-to-height ratio (WHtR) may be a better measure, as it considers the distribution of fat in the body. However, both measures have their limitations, and future research should explore other measures that may be more accurate in assessing obesity.

- Our research on the types and sources of vegetable oils used in Polynesia, the United States, and Vietnam suggests that soybean oil is the most commonly used vegetable oil in the United States. In Polynesia, coconut oil is the most commonly used vegetable oil, and in Vietnam, palm oil is the most commonly used vegetable oil. It is important to note that the type and source of vegetable oil used in a country may depend on factors like availability, price, and cultural practices. Future research should explore the impact of vegetable oil consumption on health outcomes and the environment.

- In summary, our research on these foundational questions has shed light on important issues related to obesity, measures of obesity, and vegetable oil consumption. This knowledge can inform policies and interventions aimed at reducing obesity rates and promoting sustainable and equitable food systems.


- It becomes abundantly clear to anyone who has spent time reading through nutritional scientific literature that there’s a lot more we don’t know about the body than what we do know. We don’t yet fully understand what’s happening when different species in different environments eat different foods, or why those things happen.

- With enough time and better science, we’re sure to figure it out. But until then, we have a chronic disease and obesity pandemic on our hands, and there are clear mechanistic data, animal studies, and human studies showing the obesogenic properties of excess vegetable oil consumption.

- Vegetable oils are the major category of food in our diet that has increased the most in the last hundred years, during which time obesity has gone from obscurity to commonplace, so in our fight against obesity, reducing vegetable oils and their primary fat linoleic acid in our diets seems like a good place to start.

---

(Did you remember to place the names of yourself and your group members above?)
message.txt
13 KB
