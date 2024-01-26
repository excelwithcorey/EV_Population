
<p align="center">
  <img width="600" height="400" src="https://github.com/thatcreativecopy/Proj-1-EV_Population/assets/153139454/7d6b00ea-025b-46c9-b710-e45dffbd16d1">
</p>

# EV Population Data Analysis

## About

This project EV Population was collected and downloaded from Electric Vehicle Population from [data.gov](https://catalog.data.gov/dataset/electric-vehicle-population-data). Thank you to William for uploading the file on kaggle for people in the community to have access to this dataset. [Kaggle Electric Vehicle Population](https://www.kaggle.com/datasets/willianoliveiragibin/electric-vehicle-population).

This project aims to discover EV adoption in various states, and postal codes. Some limitations in the dataset include diversification of states: Washington (WA) accounts for 99.8 percent of the total data. Moving forward, we will be focusing on WA as our primary EV adoption. 

## Purpose

As an Analyst with a passion in motor vehicles and energy solutions to help improve fuel economy. The major goal of this project is to gain insights into the adoption of EV to understand the demands and growth. The project identifies the popularity of a manufacturer's make and model.

## About the Data

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| vin                     | Vehicle id number                       | VARCHAR(17)    |
| county                  | A territorial division                  | VARCHAR(50)    |
| city                    | The city of the state                   | VARCHAR(50)    |
| state                   | The state in the country(USA)           | VARCHAR(5)     |
| postal_code             | Mailing code of the address             | INTEGER        |
| model_year              | Cars production year                    | INTEGER        |
| make                    | Vehicles Make                           | VARCHAR(50)    |
| model                   | Vehicle model                           | VARCHAR(50)    |
| ev_type                 | Electric Vehicle Type                   | VARCHAR(100)   |
| clean_alt_fuel          | Type of fuel                            | VARCHAR(100)   |
| electric_range          | Range of EV                             | NUMERIC        |
| base_msrp               |Retail price of EV                       | INTEGER        |

## Methods Used
1. Data Cleaning and Wrangling: The first approach is to gather the data. Followed by cleaning the data to make sure NULL
values and missing values are exposed to further utilize the data.
* Create a database and table we want to make sure that the table contents match the CSV.
* Import CSV file that includes the data.
* Ensure that the data is able to be used with no NULL values. We can confirm that there will be no NULL values
due to filtering when creating our data type.
2. Exploratory Data Analysis (EDA): This process answers our questions geared toward the project. This step is important to understand 
the smaller details in the data to make more observations. 
3. Insights 

## Analysis Content
* Market Share Analysis
* Range Analysis
* Demographic Analysis


## Business Question & Objectives
General Questions:
1. How many unique states, cities, make models, and ev types does the data have?
2. Which state has the highest adoption of EV?
3. Which EV is the most popular among all make and models?

### Market Share:
1. How many EV’s are in each city?
2. What different makes and models are included in the dataset?
3. How many electric vehicles are in each postal code?
4. What make and model are the most popular?
5. Which EV has the highest rage among all EVs?
6. Which cities have the highest market share of EV?
7. What is the market share ‘make’ in the dataset? Which make currently has the highest?
8. What is the market share with the distribution of EV with different range?
9. How has the market share of EV changed over the years?
10. What is the market share of different vehicle types in the dataset? (ex: plug-in-hybrid, battery-electric)

### Range:
1. What are the top 5 make and models that have the highest range?
2. What is the average range for each EV type?
3. What is the distribution of EV range of the dataset?

### Demographic:
1. How many counties are in the dataset?
2. What are the unique cities?
3. How many states are included in the dataset?
4. How many EV are in each postal code?
5. What cities have the most EVs?
6. What is the distribution and adoption rate across the states?
7. Are there certain makes and models that dominate the market?
8. What is the adoption rate across each postal code?
9. What is the adoption rate difference between 2023 and 2022?

# Insights
* WA dominated the dataset in return we mainly focused on WA adoption rates.
* Tesla is the highest marketshare among all makes.
* Seattle has the highest adoption rate of EVs in WA.
* 2023 market share of EV increased by 12.44%.
* Battery Electric Vehicle is 55.95% greater than Plug-in-Hybrids. Which concludes that adoption of EV is growing rapidly.

## Code Used

If you'd like to see the rest of the code, click here [ev_pop_clean](https://github.com/thatcreativecopy/Proj-1-EV_Population/blob/main/ev_pop_final.sql) file

```sql
----- Create Database -----
CREATE DATABASE EV_Population

----- Create Table -----
CREATE TABLE ev_pop(
    vin VARCHAR (17) NOT NULL,
    county VARCHAR (50) NOT NULL,
    city VARCHAR (50) NOT NULL,
    state VARCHAR (5) NOT NULL,
    postal_code INT NOT NULL,
    model_year INT NOT NULL,
    make VARCHAR (50) NOT NULL,
    model VARCHAR (50) NOT NULL,
    ev_type VARCHAR (100) NOT NULL,
    clean_alt_fuel VARCHAR (100) NOT NULL,
    electric_range INT NOT NULL,
    base_msrp INT NOT NULL
);
```
