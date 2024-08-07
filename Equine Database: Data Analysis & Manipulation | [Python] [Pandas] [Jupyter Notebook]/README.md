## Concept
This project focused on data manipulation using the Pandas library in Python. It demonstrates various operations and techniques for working with structured data in a tabular format.

### The project included:
1. Creating a database of horse breeds
2. Manipulating and analysing the dataset using Pandas
3. Demonstrating various data manipulation techniques
4. Visualising and exporting the processed data

## Dataset
The project uses a custom-created dataset about horse breeds:
``` python
database =  {'Breed': ['Arabian', 'Thoroughbred', 'American Quarter Horse', 'Friesian', 'Andalusian'],
             'Origin': ['Arabian Peninsula', 'England', 'United States', 'Netherlands', 'Spain'],
             'Height': [142, 163, 152, 155, 157],  # shown in centimeters
             'Weight': [408, 498, 544, 589, 498],  # shown in kilograms
             'Temperament': ['Energetic and alert', 'Energetic and spirited', 'Gentle and willing', 'Gentle and calm', 'Noble and docile'],
             'Historical Significance': ['Ancient breed known for endurance', 'Developed for horse racing', 'Developed for short-distance racing and cattle work', 'One of the oldest European horse breeds', 'Historically used in warfare and dressage'],
             'Description': ['Known for endurance and stamina', 'Known for speed and agility', 'Known for versatility and speed over short distances', 'Known for its elegant appearance and gentle temperament', 'Known for its athleticism and versatility']}
```

## Skills and technologies:
- Python programming
- Pandas library for data manipulation
- Jupyter Notebook for interactive coding and documentation
- Data analysis techniques (filtering, sorting, grouping)
- Data visualisation
- Data export to CSV and Excel

## Development
The notebook progresses through several stages:

1. Data Creation and Import:
   - Importing the Pandas library
   - Converting the dictionary to a Pandas DataFrame
   ``` python
   import pandas as pd

   horses_df = pd.DataFrame(database)
   pd.set_option('display.expand_frame_repr', False) # expanding the table to show it in one row
   pd.set_option('display.max_colwidth', 40)  # set maximum column width to 40 characters
   print(horses_df)
   ```

2. Basic Data Exploration:
   - Generating summary statistics with describe()
   - Using head() and tail() functions
   ``` python
   # displaying the first 3 rows of the DataFrame using head function
   print(horses_df.head(3)) 

   # displaying the last 2 rows of the DataFrame using tail function
   print(horses_df.tail(2)) 

   # summary statistics of numerical columns in the dataset using describe function
   print(horses_df.describe()) 
   ```

3. Data Selection:
   - Accessing specific columns and rows
   - Using loc[] and iloc[] for data selection
   ``` python
   # accessing third row using .loc[]
   row_3 = horses_df.loc[2] 
   pd.set_option('display.max_colwidth', None)  # show full content of columns
   print(row_3)

   # accessing second value in the Temperament column using .loc[]
   column = 'Temperament'
   index = 2
   temperament_value = horses_df.loc[index, column]
   print(f"Accessing the {column} value of the row with index {index}:")
   print() # adding a blank line for formatting purposes
   print(temperament_value)

   # finding horses that are usually found in England using .iloc[]
   england_row_index = horses_df[horses_df['Origin'] == 'England'].index[0] # locating the index of the row where the 'Origin' column has the value 'England'
   england_origin = horses_df.at[england_row_index, 'Origin'] # getting the value of the 'Origin' column for horses from England
   england_horse_info = horses_df.loc[england_row_index] # getting info on horses from England

   print(f"These horses are usually found in {england_origin}:")
   print()
   print(england_horse_info)
   ```
   - Selecting multiple columns and rows
   ``` python
   # selecting multiple columns, Breed and Description
   selected_columns = horses_df[['Breed', 'Description']]
   print("\nSelected Breed and Description columns:")
   pd.set_option('display.max_colwidth', None)  # show full content of columns
   print()
   print(selected_columns)

   # selecting multiple rows with indices 0 and 4
   selected_rows_loc = horses_df.loc[[0, 4]]
   print("\nSelected rows with indices 0 and 4 using .loc[]:")
   pd.set_option('display.max_colwidth', 40)  # set maximum column width to 40 characters
   print()
   print(selected_rows_loc)
   ```
   
4. Data Analysis:
   - Sorting data based on specific columns
   - Grouping data and applying aggregate functions
   ``` python
   # sorting data
   sorted_weight = horses_df.sort_values(by='Weight', ascending=True) # sort data on average horse weight in ascending order
   sorted_height = horses_df.sort_values(by='Height', ascending=False) # sort data on average horse height in descending order

   print("\nAverage horse height sorted in descending order:")
   print()
   pd.set_option('display.expand_frame_repr', False)
   print(sorted_height)

   # grouping data
   grouped_data = horses_df.groupby('Origin').agg({'Height': 'max'}) # grouping the data by origin, calculating the maximum value of the Height column for each       group
   print("\nGrouped data with aggregate statistics:")
   print()
   print(grouped_data)
   ```
   - Filtering data using conditions and the query() method
   ``` python
   # applying basic filter
   filtered_data = horses_df[horses_df.Temperament != 'Energetic and alert'] # filter data for a horse with temperament other than Energetic and alert
   print("\nPick these horses:")
   print()
   pd.set_option('display.expand_frame_repr', False)
   print(filtered_data)

   # applying multiple filters
   multi_filter_data = horses_df[(horses_df['Origin'] == 'England') | (horses_df['Weight'] > 500)] #applying multiple filter to show horses which Origin is either    England or their weight is over 500 kg
   print(multi_filter_data)

   # using query method
   query_filter = horses_df.query("Weight > 560 and Temperament != 'Developed'")
   print(query_filter)
   ```
   
5. Exporting the DataFrame to CSV and Excel:
   ``` python
   horses_df.to_csv('horses_database.csv', index=False)
   # horses_df.to_excel('horses_database.xlsx', index=False, sheet_name='Sheet1')
   ```
     
