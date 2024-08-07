## Concept
This fun project focuses on retrieving and analysing cat facts using an API. It demonstrates data collection, processing, and visualisation techniques.

### The project included:

1. Fetching cat facts from an API
2. Storing the facts along with timestamps
3. Creating a DataFrame to organise the data
4. Visualising the distribution of fact lengths using a histogram


## Dataset
The dataset is dynamically created by making 100 API calls to the "catfact.ninja/fact" endpoint. Each entry contains a timestamp of when the fact was retrieved and the cat fact itself.

## Skills and Technologies

- Python programming
- API interaction using the 'requests' library
- Data manipulation with Pandas
- Data visualisation using Seaborn and Matplotlib
- JSON parsing
- DateTime handling
- Basic statistical analysis (distribution of fact lengths)


## Development


1. The code starts by importing necessary libraries
``` python
import requests
import textwrap
import json
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime
```
2. It then sets up a loop to make 100 API calls to retrieve cat facts, each fact is stored with a timestamp in a list
``` python
cat_facts_number = 100 # retrieving 100 facts about cats
fact_data = [] # adding an array to put data from the loop into

for i in range(1, cat_facts_number + 1): # iterating through the number of cat facts, starting from 1
    fact_response = requests.get('https://catfact.ninja/fact') # sending get request to api to get the data
    cat_fact = json.loads(fact_response.text)['fact']
    current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S') # adding current date and time
    fact_data.append({'Date': current_time, 'Fact': cat_fact})
```

3. The list is converted into a pandas DataFrame for easy manipulation, with custom formatting options
``` python
df = pd.DataFrame(fact_data)
df.index += 1 # change index to start from 1

pd.options.display.width = 250 # increasing the width of the display window
pd.set_option('display.max_rows', None) # display all rows
pd.set_option('display.max_colwidth', 180) # display max column width

print(f"\nLet's get {cat_facts_number} facts about cats:")
print() # blank space
print(df)

fact_length = df['Fact'].apply(len)
print()
```
4. Finally, a histogram is created to visualise the distribution of fact lengths
``` python
fig = plt.figure(figsize = (8, 5))
sns.histplot(data = df, x = fact_length, bins = 10, color = 'darkgreen', alpha = 0.7)
plt.title('Distribution of cat facts by length')
plt.xlabel('Length')
plt.ylabel('Frequency')
plt.show()
```
![image](https://github.com/user-attachments/assets/b9a34521-9ef8-4d92-94c3-ee90ba152f36)
