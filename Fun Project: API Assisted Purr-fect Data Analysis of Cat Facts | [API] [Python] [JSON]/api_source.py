# -*- coding: utf-8 -*-
"""Denys-Bukariev_Week-8_API-Day-1_29-04-2024.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1UcqoN1W57m58enm7IKJYcv45ndMSn67z
"""

# importing libraries to make aт API request
import requests
import textwrap
import json
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime

cat_facts_number = 100 # retrieving 100 facts about cats
fact_data = [] # adding an array to put data from the loop into

for i in range(1, cat_facts_number + 1): # iterating through the number of cat facts, starting from 1
    fact_response = requests.get('https://catfact.ninja/fact') # sending get request to api to get the data
    cat_fact = json.loads(fact_response.text)['fact']
    current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S') # adding current date and time
    fact_data.append({'Date': current_time, 'Fact': cat_fact})

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
fig = plt.figure(figsize = (8, 5))
sns.histplot(data = df, x = fact_length, bins = 10, color = 'darkgreen', alpha = 0.7)
plt.title('Distribution of cat facts by length')
plt.xlabel('Length')
plt.ylabel('Frequency')
plt.show()