# Load necessary libraries
install.packages("dplyr")
library(dplyr)   # For data manipulation
install.packages("tidyr")
library(tidyr)   # For data reshaping
install.packages("ggplot2")
library(ggplot2) # For data visualization
install.packages("lmtest")
library(lmtest)  # For statistical tests
install.packages("readr")
library(readr)
# Load and preprocess the economy dataset
economy_data <- read.csv("C:/Users/shrav/OneDrive/Desktop/COVID19 PROJECT/cleaned_economy_data.csv")

# Assuming you have a dataset with columns: 'location', 'gdp_usd', 'gdp_per_capita_usd', 'human_capital_index'

# Split data into training and testing sets
set.seed(123) # Set seed for reproducibility
train_index <- sample(1:nrow(economy_data), 0.8 * nrow(economy_data)) # 80% training data
train_data <- economy_data[train_index, ]
test_data <- economy_data[-train_index, ]

# Develop predictive model to forecast GDP per Capita
model <- lm(gdp_per_capita_usd ~ gdp_usd + human_capital_index, data = train_data)

# Summary of the model
summary(model)

# Evaluate model performance on test data
predictions <- predict(model, newdata = test_data)
mse <- mean((test_data$gdp_per_capita_usd - predictions)^2) # Mean Squared Error
rmse <- sqrt(mse) # Root Mean Squared Error
cat("Root Mean Squared Error (RMSE):", rmse, "\n")

# Combine test_data and predictions into plot_data dataframe
plot_data <- cbind(test_data, predictions)

# Reshape the data for plotting using gather
plot_data_long <- plot_data %>%
  select(location_key, gdp_per_capita_usd, predictions) %>%
  gather(key = "Type", value = "Value", -location_key)

# Visualize actual vs. predicted GDP per Capita using a bar plot
ggplot(plot_data_long, aes(x = location_key, y = Value, fill = Type)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  labs(title = "Actual vs. Predicted GDP per Capita",
       x = "Country",
       y = "GDP per Capita (USD)",
       fill = "Type") +
  theme_minimal()

# Perform statistical tests to assess model significance
bptest(model) # Breusch-Pagan test for heteroskedasticity

