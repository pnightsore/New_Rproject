

# summery_statistics_and_graphs_study
this is a documenation for my R project.

## datasets
three Datasets are used for this project and they are called GDP/GINI/refugee which are all downloaded from [World bank website](https://www.worldbank.org) in excel format.
After having been downloaded, the data has been cleaned and saved as .text and **17 countries** are kept as observations for each data set, and the data represents **27 years(from 1990 to 2017)**.

### dataset description
- **GDP** representing the annual GDP per country for all 17  years.
- **GINI** respresenting the gini index assigned to a country.
- **refugee** representing the number of people who migrate from the specific country.

## In R
Using Rstudio, the three data sets were successfully imported and the working directory was set.

### creating two functions 
1. **the 'summary_stat'function**
 it calculates the summary statistics for a given country along a given data set through all the years.
 the summary statistics consists of :**mean/standard deviation/minimum/maximum/median**

2. **the'explore_plot'function** that prints a pdf file with the main four plots for a country in a data set that is requested through all the  years.
   the main four plots are: **trend plot/density plot/istogram/boxplot**
