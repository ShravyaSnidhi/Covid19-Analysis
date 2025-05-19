# Load necessary libraries
library(readr)  # For reading data
library(ggplot2)  # For data visualization

# Read the dataset
data <- read.csv("C:/Users/shrav/OneDrive/Desktop/COVID19 PROJECT/cleaned_economy_data.csv")

# Check the structure of the dataset
str(data)

# Check the column names to verify the presence of 'location' and 'human_capital_index'
names(data)

# Create a pie chart for Human Capital Index distribution
pie_data <- data.frame(Country = data$location_key, Human_Capital_Index = data$human_capital_index)

# Filter out rows with missing values for Human Capital Index
pie_data <- pie_data[complete.cases(pie_data), ]

# Check the number of rows in the pie_data
nrow(pie_data)
# Create the pie chart
pie_chart <- ggplot(pie_data, aes(x = "", y = Human_Capital_Index, fill = Country)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Distribution of HCI by Country") +
  theme_minimal()

# Print the pie chart
print(pie_chart)


bar_chart <- ggplot(data, aes(x = location_key, y = gdp_per_capita_usd)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  xlab("Country") +
  ylab("GDP per Capita (USD)") +
  ggtitle("GDP per Capita by Country") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Print the bar chart
print(bar_chart)

