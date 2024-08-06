## Concept
This project showcases comprehensive data analysis on a dataset of vehicles to extract meaningful insights and answer various business questions. This includes calculating descriptive statistics, visualising data distributions, identifying correlations, and conducting hypothesis tests.

### The project included:
- Data import and exploration
- Descriptive statistics and insights
- Data visualisation
- Statistical analysis
- Correlation analysis

## Dataset
The dataset used for this analysis includes a variety of attributes related to vehicles, such as MSRP, engine horsepower, vehicle styles, transmission types, fuel types, and more. With more than 11 thousand rows it provides a rich source of information to explore different aspects of vehicle characteristics and performance.
<br/>
<br/>![image](https://github.com/user-attachments/assets/9af87a30-7af4-4061-9701-893a75fcf26c)

## Skills and Technologies
- Python: Data manipulation and analysis
- Pandas: Handling and processing the dataset
- Numpy: Numerical operations
- Matplotlib: Creating visualisations
- Seaborn: Advanced data visualisation on top of matplotlib
- Scipy: Statistical tests and calculations
- Textwrap: Formatting text outputs
- Warnings: Managing warning messages during execution

## Development
The development process involved several key steps:

1. Data Loading and Importing Libraries:
- Imported necessary Python libraries
``` python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats
```
- Read the data from CSV files and loaded it into a Pandas DataFrame, set display options for better readability
``` python
df_csv = pd.read_csv('car_dataset.csv')

df = pd.DataFrame(df_csv)
pd.set_option('display.expand_frame_repr', False) # expanding the table to show it in one row
pd.set_option('display.max_colwidth', 20)  # set maximum column width to 40 characters
print(df)
```
2. Descriptive Analysis:

- Computed basic statistics such as mean, median, standard deviation, and quantiles
``` python
average_msrp = df["MSRP"].mean().round(2) # calculating average MSRP 
print(f"The average manufacturer's suggested retail price (MSRP) of vehicles in the dataset is: {average_msrp}")

max_msrp = df["MSRP"].max() # calculating highest MSRP 
print(f"The highest MSRP among the vehicles is: {max_msrp}")

freq_transmission = df["Transmission Type"].mode().values[0] # looking up the most common transmission type among the vehicles
print(f"The most frequent type of transmission is: {freq_transmission}")

median_vehicle_popularity = df["Popularity"].median() # calculating median popularity of vehicles
print(f"The median vehicle popularity is: {median_vehicle_popularity}")

Engine_HP_75 = df['Engine HP'].quantile(0.75)
print(Engine_HP_75)
```
- Investigated the distribution of different attributes using bar plots and histograms
``` python
fuel_type_percentage = df['Engine Fuel Type'].value_counts(normalize = True) * 100  # calculate the percentage of each fuel type

plt.figure(figsize = (15, 6))
sns.barplot(x = fuel_type_percentage.index, y = fuel_type_percentage.values, palette = 'muted')
plt.title('Percentage of vehicles with a specific engine fuel type')
plt.xlabel('')
plt.ylabel('Percentage of vehicles')

for index, value in enumerate(fuel_type_percentage): # adding percentages on top of each bar
    plt.text(index, value + 1, '{:.2f}%'.format(value), ha = 'center', fontsize = 10)
plt.xticks(rotation = 45)  # rotate x-labels for better readability

import warnings
warnings.filterwarnings("ignore", category = FutureWarning)  # Ignore any future warnings
plt.show()
```
![image](https://github.com/user-attachments/assets/ceeb4e8a-ee98-4f99-8833-3e0cb019a137)
![image](https://github.com/user-attachments/assets/50448ccb-2969-403d-8216-c341774132d8)

- Analysed correlations between various features using correlation coefficients
``` python
corr_ec = df['Engine Cylinders'].corr(df['MSRP']).round(3) # correlation coefficient between 'Engine Cylinders' and 'MSRP'
print(f"The correlation between 'Engine Cylinders' and 'MSRP' is {corr_mpg}")

corr_mpg = df['highway MPG'].corr(df['city mpg']).round(3) # correlation between 'highway MPG' and 'city mpg'
print(textwrap.fill((f"The correlation between 'Highway MPG' and 'City MPG' is {corr_mpg}, strongly implying that the correlation between these features is highly positive."), width = 90))
```

3. Hypothesis Testing:

- Formulated and tested hypotheses using t-tests to determine significant differences between groups
- Analysed the results of the tests and interpreted the p-values to make informed decisions
``` python
automatic_city_mpg = df[df['Transmission Type'] == 'AUTOMATIC']['city mpg']
manual_city_mpg = df[df['Transmission Type'] == 'MANUAL']['city mpg']

import scipy.stats
t_statistic, p_value = scipy.stats.ttest_ind(automatic_city_mpg, manual_city_mpg, equal_var = False) # performing t-test

a = 0.05 # defining the coefficient value to check against
if p_value < a:
    print("There is a statistically significant difference in the mean 'City MPG' between vehicles with automatic and manual transmissions.")
else:
    print("There is no statistically significant difference in the mean 'City MPG' between vehicles with automatic and manual transmissions.")

p_value_decimal = "{:.13f}".format(p_value) # formatting the p value
print(f"The corresponding p value for the provided test hypothesis is {p_value_decimal}.")
```

4. Data Visualisation:

- Created a variety of plots (scatter plots, box plots, histograms) to visually explore the data
- Enhanced the readability of plots with labels, titles, and legends <br/>
<br/>![image](https://github.com/user-attachments/assets/afd0fc41-edac-4662-9ed2-4534ebd55df4)


5. Outlier Detection:

- Used z-score analysis to identify and visualise potential outliers in the dataset
- Confirmed the presence of outliers in attributes such as Engine HP and highway MPG
``` python
engine_hp_z_score = stats.zscore(df['Engine HP']) # calculating z-scores for the 'Engine HP' attribute
sns.histplot(data = engine_hp_z_score, bins = 100, color = 'lightblue') # plotting the z-score values to see their distribution and identify correct threshold value to eliminate outliers
plt.title('Distribution of Z-score for the Engine HP attribute')
plt.xlabel('Z-score')
plt.ylabel('Frequency')
plt.show()

threshold = 2 # defining the threshold to remove the outliers against
print(textwrap.fill(f"Taking a look at the distribution of z-score values in the histogram below, we can say that the threshold value of {threshold} would suffice our research.", width = 90))

outliers = df[(engine_hp_z_score > threshold) | (engine_hp_z_score < -threshold)] # identifying potential outliers based on threshold
print("\nPotential outliers in 'Engine HP':\n") # adding a blank space between rows
sns.histplot(data = outliers, x = 'Engine HP', bins = 50, color = 'darkred') # plotting the z-score values to see their distribution and identify correct threshold value to eliminate outliers
plt.title('Outliers in the Engine HP attribute')
plt.xlabel('Engine HP')
plt.ylabel('Frequency')
plt.show()
```
![image](https://github.com/user-attachments/assets/f326f4f5-0f37-4646-99be-4d623d49f3af)
![image](https://github.com/user-attachments/assets/5348626b-f645-4c2c-b5a1-d2d9f664ab30)

6. Final Analysis:

- Combined visual and statistical analysis to draw comprehensive insights
- Summarised the findings and presented them in an easy-to-understand format
