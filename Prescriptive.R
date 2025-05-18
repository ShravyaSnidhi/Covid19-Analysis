# Load necessary libraries
library(readr)
library(dplyr)
library(ggplot2)

# Load the economy dataset
data <- read.csv("C:/Users/shrav/OneDrive/Desktop/COVID19 PROJECT/cleaned_economy_data.csv")

# Check the structure of the dataset
str(data)

# Summary statistics
summary(data)

# Data visualization
# Scatter plot to explore relationships between GDP and GDP per capita
ggplot(data, aes(x = gdp_usd, y = gdp_per_capita_usd)) +
  geom_point(color = "blue") +
  labs(title = "Relationship between GDP and GDP per Capita", x = "GDP (USD)", y = "GDP per Capita (USD)")

# Box plot to compare Human Capital Index across different regions
ggplot(data, aes(x = location_key, y = human_capital_index)) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Human Capital Index by Location", x = "Location", y = "Human Capital Index")

# Statistical analysis
# Perform hypothesis testing or regression analysis to understand relationships

# Verify if there are enough observations for hypothesis testing
# Check the number of observations for each location_key
n_AE <- sum(data$location_key == "AE")
n_AF <- sum(data$location_key == "AF")

if(n_AE >= 2 & n_AF >= 2) {
  # Hypothesis Testing Example: Test if there is a significant difference in GDP between two regions
  data_AE <- data[data$location_key == "AE", "gdp_usd"]
  data_AF <- data[data$location_key == "AF", "gdp_usd"]
  
  t_test_result <- t.test(data_AE, data_AF)
  print(t_test_result)
} else {
  cat("Not enough observations for hypothesis testing between regions AE and AF.\n")
}


# Regression Analysis Example: Fit a linear regression model to predict GDP per capita based on Human Capital Index
lm_model <- lm(gdp_per_capita_usd ~ human_capital_index, data = data)
summary(lm_model)

# Prescriptive analysis
# Based on the analysis, make recommendations or decisions
# For example, if there is a positive correlation between GDP and GDP per Capita, recommend policies to boost GDP to increase GDP per Capita

# Check the correlation between GDP and GDP per Capita
correlation <- cor(data$gdp_usd, data$gdp_per_capita_usd)

if(correlation > 0) {
  cat("There is a positive correlation between GDP and GDP per Capita.\n")
  cat("Recommendation: Implement policies to boost GDP in order to increase GDP per Capita.\n")
} else {
  cat("There is no positive correlation between GDP and GDP per Capita.\n")
  cat("Further analysis is needed to determine the relationship between GDP and GDP per Capita.\n")
}