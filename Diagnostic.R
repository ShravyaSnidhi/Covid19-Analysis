# Load the dataset
data <- read.csv("C:/Users/shrav/OneDrive/Desktop/COVID19 PROJECT/cleaned_economy_data.csv") 

# Check the structure of the dataset
str(data)

# Summarize the dataset
summary(data)

# Check for missing values
colSums(is.na(data))

# Scatter plot
plot(data$gdp_usd, data$gdp_per_capita_usd, xlab = "GDP (USD)", ylab = "GDP per Capita (USD)", main = "Scatter Plot: GDP vs GDP per Capita")

# Histogram
hist(data$gdp_per_capita_usd, xlab = "GDP per Capita (USD)", main = "Histogram: Distribution of GDP per Capita", col = "skyblue")

# Line graph
plot(data$gdp_per_capita_usd, type = "l", col = "blue", xlab = "Country", ylab = "GDP per Capita (USD)", main = "GDP per Capita (USD) by Country")

# You can also calculate the correlation between variables
cor(data$gdp_usd, data$gdp_per_capita_usd)

# Cluster Analysis
library(cluster)
set.seed(123)  # Set seed for reproducibility
cluster_data <- data[, c("gdp_usd", "gdp_per_capita_usd")]
kmeans_model <- kmeans(cluster_data, centers = 3)  

# Assuming 3 clusters
data$cluster <- as.factor(kmeans_model$cluster)

library(ggplot2)
# Visualize clusters
ggplot(data, aes(x = gdp_usd, y = gdp_per_capita_usd, color = cluster)) +
  geom_point() +
  labs(title = "Cluster Analysis of GDP and GDP per Capita", x = "GDP (USD)", y = "GDP per Capita (USD)", color = "Cluster")

# Outlier Detection
library(dplyr)
outliers <- data %>% filter(gdp_usd > quantile(gdp_usd, 0.95) | gdp_per_capita_usd > quantile(gdp_per_capita_usd, 0.95))

# View the outliers
print(outliers)
