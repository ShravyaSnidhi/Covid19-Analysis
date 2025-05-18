--> This project analyzes the economic impact of the COVID-19 pandemic using data science techniques in R. It integrates global COVID-19 data with economic indicators (GDP, Human Capital Index, etc.) and applies a four-step analytics framework:

✅ Descriptive: What happened?

✅ Diagnostic: Why did it happen?

✅ Predictive: What might happen next? and Prescriptive: What should be done?

--> The goal of this project was to derive insights into how the pandemic affected world economies and provide data-driven recommendations for resilience.

DATASETS:

✅ The dataset combines: COVID-19 case data from Google's COVID-19 Open Data

✅ Socio-economic indicators like GDP, GDP per capita, and Human Capital Index

✅ All missing values were handled using filtering or imputation techniques. Outliers were detected and studied during analysis.

--> TOOLS AND TECHNOLOGIES:

✅ Language: R

✅ Libraries: ggplot2, dplyr, cluster, tidyr, lmtest

--> Techniques Used:

✅ Data Cleaning & Preprocessing

✅ Exploratory Data Analysis (EDA)

✅ Linear Regression Modeling

✅ K-Means Clustering

✅ Hypothesis Testing

✅ Outlier Detection

--> Descriptive Analysis: Summary statistics and distributions of economic indicators. It aslo has pie charts and bar plots to visualize GDP and HCI per country

--> Diagnostic Analysis: Explored relationships using scatter plots, histograms, and line charts; Clustered countries by GDP patterns (k-means), Detected economic outliers and Calculated correlations between GDP and GDP per capita

--> Predictive Analysis

✅ Built a linear regression model to predict GDP per capita from GDP and HCI

✅ Evaluated using RMSE and visualized predicted vs. actual values

--> Prescriptive Analysis

✅ Performed statistical testing (e.g., t-test, correlation analysis

✅ Gave actionable recommendations based on model insights

--> INSIGHTS:

✅ GDP and GDP per capita are positively correlated

✅ Clusters showed economic disparities between countries

✅Outlier nations like the US had extremely high GDP, requiring different policy approaches
