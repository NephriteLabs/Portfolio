## Concept
The project aim was to try out various techniques for analysing and visualising a small dataset using popular Python libraries for data science.

### The project included:

- Data importation and basic exploration
- Visualisation of numerical and categorical variables
- Exploration of relationships between variables
- Outlier detection
- Calculation and presentation of summary statistics

## Dataset
The project uses a small, manually created dataset with 5 entries. Each entry contains Name, Age, Gender, City and Salary.

## Skills and Technologies

- Python programming
- Data manipulation with Pandas
- Numerical operations with NumPy
- Data visualisation with Matplotlib and Seaborn
- Statistical analysis (z-scores, correlation)
- Use of SciPy for statistical functions
- Text formatting with textwrap
- Table creation with tabulate

## Development
The script progresses through several stages of analysis:

1. Data Creation and Import:
- Creating a dictionary-based dataset
- Converting the dictionary to a Pandas DataFrame
``` python
data = {'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
        'Age': [25, 30, 35, 40, 45],
        'Gender': ['Female', 'Male', 'Male', 'Male', 'Female'],
        'City': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Miami'],
        'Salary': [60000, 70000, 80000, 90000, 100000]}

df = pd.DataFrame(data)

```

2. Basic Data Exploration:

- Displaying the entire DataFrame
- Generating summary statistics with describe()
``` python
print(df)
print(df.describe())
```

3. Data Visualisation:

- Creating histograms and box plots for numerical variables
- Generating scatter plots and correlation matrices to explore relationships
- Using bar plots for categorical variables
``` python
plt.figure(figsize = (6, 4)) # creating a histogram for age column with matplotlib
plt.hist(df['Age'], bins = range(df['Age'].min(),df['Age'].max() + 2, 1), alpha=0.7, color = 'lightgreen', edgecolor = 'black') # converting age values to int, formatting
plt.title('Histogram of Age')
plt.xlabel('Age')
plt.ylabel('Frequency')
plt.grid(False)
plt.show()

print() # blank row

plt.figure(figsize = (6, 4)) # visualising salary distribution with seaborn boxplot
sns.boxplot(data = df, y = 'Salary', color = 'lightblue')
plt.ylabel('Salary')
plt.title('Distribution of Salary')
plt.show()
```


4. Statistical Analysis:

- Calculating and visualising z-scores for outlier detection
- Computing summary statistics (mean, median, standard deviation)
``` python
print("Let's use z-score method to find outliers in the dataset.")
print()

fig, axes = plt.subplots(1, 2, figsize = (8, 5)) # adding subplots to show the z-score distributions next to each other

from scipy import stats # importing stats library to calculate z-score
import textwrap # importing text wrapping module

# calculating z-scores for the 'Age' and 'Salary' attributes
age_z_score = stats.zscore(df['Age'])
salary_z_score = stats.zscore(df['Salary'])

sns.histplot(data = age_z_score, bins = 10, color = 'lightblue', ax = axes[0]) # plotting a histogram of z-score values for Age column
axes[0].set_title('Age')
axes[0].set_xlabel('Z-score')
axes[0].set_ylabel('Frequency')

sns.histplot(data = salary_z_score, bins = 10, color = 'lightgreen', ax = axes[1]) # plotting a histogram of z-score values for Salary column
axes[1].set_title('Salary')
axes[1].set_xlabel('Z-score')
axes[1].set_ylabel('')

fig.suptitle('Exploring z-score distribution for Age and Salary columns', fontsize = 12)
plt.tight_layout() # adjusting layout
plt.show()

print(textwrap.fill(("From the looks of z-score value distribution for both Age and Salary column, we can make a conclusion that there are no outliers in our data, as the threshold value doesn't even get to a value of 2.0"), width = 120))
```
5. Data Presentation:

- Using various plot types (histogram, box plot, scatter plot, heatmap, bar plot)
![image](https://github.com/user-attachments/assets/666aa2c1-d4be-4bb0-b11d-614f2ea02721)
- Creating a formatted table for summary statistics
``` python
mean_value = df.drop(columns = ['Name', 'Gender', 'City']).mean() # calculating mean excluding non numerical values
median_value = df.drop(columns = ['Name', 'Gender', 'City']).median() # calculating median excluding non numerical values
std_dev_value = df.drop(columns = ['Name', 'Gender', 'City']).std().round(2) # calculating standard deviation values excluding non numerical values

from tabulate import tabulate # importing library to show as a table

table = [
    ['Mean', *mean_value],
    ['Median', *median_value],
    ['Standard Deviation', *std_dev_value]]

print(tabulate(table, headers = ['Statistic', 'Age', 'Salary'], tablefmt = 'plain')) # printing table
```
