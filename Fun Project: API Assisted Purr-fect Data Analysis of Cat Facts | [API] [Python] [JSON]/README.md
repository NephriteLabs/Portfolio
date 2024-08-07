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

2. It then sets up a loop to make 100 API calls to retrieve cat facts

3. Each fact is stored with a timestamp in a list

4. The list is converted into a pandas DataFrame for easy manipulation

5. The DataFrame is displayed with custom formatting options

6. Finally, a histogram is created to visualiіe the distribution of fact lengths
