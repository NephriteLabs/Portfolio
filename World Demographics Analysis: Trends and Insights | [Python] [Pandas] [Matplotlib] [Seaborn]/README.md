## Concept
The project aims to analyse global population trends and insights using a comprehensive dataset of world demographics. By leveraging data visualisation and statistical methods, the analysis provides an understanding of population dynamics across different continents and time periods.

### The project included:
- Data loading and preprocessing
- Summary statistics and exploratory data analysis
- Data filtering and sorting
- Grouping and aggregating data
- Data visualisation using Matplotlib and Seaborn
- Exporting the processed data for further use

## Dataset
The dataset used in this project is sourced from an Excel file, 'world_population.xlsx', which contains demographic information including population data by country, capital, continent, and year. The dataset includes columns like Rank, Country, Capital, Area (km²), Density (per km²), Growth Rate, and World Population Percentage (2022).

## Skills and Technologies
- Python: For data manipulation and analysis
- Pandas: For data loading, preprocessing, and manipulation
- Matplotlib, Seaborn: For creating informative visualisations

#### Development
1. Data Loading and Preprocessing:
    - Imported the dataset from an Excel file into a Pandas DataFrame
    - Displayed the first 30 rows and the last 20 rows to understand the structure of the dataset
    - Generated summary statistics for numerical columns to gain initial insights
    ```python
    import pandas as pd

    df_excel = pd.read_excel('world_population.xlsx', sheet_name='world_population')
    df = pd.DataFrame(df_excel)
    pd.set_option('display.expand_frame_repr', False)
    pd.set_option('display.max_colwidth', 20)
    print(df)
    
    print(df.head(30))
    print(df.tail(20))
    
    print(df.describe())
    ```

2. Data Access and Manipulation:
    - Accessed specific columns and rows using .loc[] and .iloc[]
    - Retrieved and printed specific data points, such as the population of the country ranking 18th in 2022
    ```python
    name_column = df['Capital']
    print(name_column)

    row_31 = df.loc[30]
    pd.set_option('display.max_colwidth', None)
    print(row_31)

    column = 'Country'
    index = 26
    country_value = df.loc[index, column]
    print(f"Accessing the {column} value of the row with index {index}:")
    print()
    print(country_value)

    row_112 = df.iloc[111]
    print(row_112)
    
    row_index = df[df['Rank'] == 18].index[0]
    population_value = df.at[row_index, 2022]
    population_info = df.iloc[row_index]

    print(population_info)
    print()
    print("Population in 2022:", population_value)
    ```

3. Data Sorting and Grouping:
    - Sorted the dataset based on the population in 1970
    - Grouped the data by continent and calculated the total population for 2020 for each continent
    ```python
    sort_1970 = df.sort_values(by=1970, ascending=False)
    print("\nTable sorted by population numbers from 1970:")
    print()
    pd.set_option('display.expand_frame_repr', False)
    print(sort_1970)
    
    grouped_data = df.groupby('Continent').agg({2020: 'sum'})
    print("\nTotal population by continent in 2020:")
    print()
    print(grouped_data)
    ```

4. Advanced Filtering:
    - Applied filters to focus on specific subsets, like European populations and Asian countries ranked 100+
    - Used the query method to filter countries in North America with a rank less than 60
    ```python
    filtered_data = df[df.Continent == 'Europe']
    print("\nPopulation in Europe:")
    print()
    pd.set_option('display.expand_frame_repr', False)
    print(filtered_data)

    multi_filter_data = df[(df.Continent == 'Asia') & (df.Rank >= 100)]
    print(multi_filter_data)
    
    query_filter = df.query("Rank < 60 and Continent == 'North America'")
    print(query_filter)
    ```

5. Data Visualisation:
    - Created a line chart to show the change in population over time for each continent
    ```python
    import matplotlib.pyplot as plt

    line_continent_group = df.groupby('Continent').sum().drop(['Rank', 'CCA3', 'Country', 'Capital', 'Area (km²)', 'Density (per km²)', 'Growth Rate', 'World Population Percentage (2022)'], axis=1)
    line_continent_group = line_continent_group.T

    plt.figure(figsize=(15, 6))
    for continent in line_continent_group.columns:
        plt.plot(line_continent_group.index, line_continent_group[continent], marker='o', label=continent)

    plt.title('World population over time by continent')
    plt.xlabel('')
    plt.ylabel('Population in billions')
    plt.legend()
    plt.tight_layout()
    plt.grid(True)
    plt.show()
    ```
    ![image](https://github.com/user-attachments/assets/be2888eb-e814-471d-a256-a9dbed040d13)

    - Visualised the total population by continent for 2022 using a bar chart
    ```python
    import seaborn as sns
    import warnings

    total_population_2022 = df.groupby('Continent')[2022].sum().reset_index()

    plt.figure(figsize=(8, 6))
    sns.barplot(x='Continent', y=2022, data=total_population_2022, palette='muted')
    warnings.filterwarnings("ignore", category=FutureWarning)
    plt.title('Total population by continent')
    plt.xlabel('')
    plt.ylabel('Population in billions')
    plt.show()
    ```
    ![image](https://github.com/user-attachments/assets/68910e4f-fd67-4aa2-a329-9b550a17c67b)


6. Exporting Data:
    - Exported the cleaned and processed DataFrame to a CSV file for further analysis and reporting
    ```python
    df.to_csv('population_database.csv', index=False)
    ```
