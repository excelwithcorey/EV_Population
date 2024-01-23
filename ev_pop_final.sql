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
----------------- Import CSV File --------------------
COMPLETE
--------------Exploratory Data Analysis --------------
I want to evaluate the data and learn about the data before I dive a little deeper into the dataset through EDA.

SELECT * FROM ev_pop;

Exploring the data to see how many unique countys there are in this dataset. I am seeking to discover insights for the stakeholder.  

SELECT DISTINCT
	county
FROM ev_pop;

Lets find out how many cities the dataset includes to make more in depth discoveries later in the project. 

SELECT DISTINCT
	city
FROM ev_pop;

How many states are there in this dataset?
SELECT DISTINCT
	state
FROM ev_pop;

What different makes and models are included in the dataset?
SELECT 
	make,
	model
FROM ev_pop;

How many of each make and models are includes?
SELECT 
	make,
	model
	COUNT (*) AS total_ev
FROM ev_pop
GROUP BY make, model
ORDER BY total_ev;

How many electric vehicles are in each postal code?
SELECT 
	postal_code,
	COUNT (*) AS post_cnt
FROM ev_pop
GROUP BY postal_code
ORDER BY post_cnt DESC;

We can also conclude which make and model is the most popular among the ev vehicle industry in this dataset. 

------------------ Market Share Analysis ------------------
1. What is the market share make in the dataset? Which make currently has the highest market share?
SELECT make, COUNT(*) AS vehicle_count, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop) AS market_share_percentage
FROM ev_pop
GROUP BY make
ORDER BY market_share_percentage DESC;

A: Tesla, Nissan, and Cheverolet are the top 3 makes that hold the highest market share in this dataset. 

2. Which cities has the highest market share of EV?
SELECT city, COUNT(*) AS vehicle_count, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop) AS market_share_percentage
FROM ev_pop
GROUP BY city
ORDER BY market_share_percentage DESC
LIMIT 5;

A: Seattle, Bellvue and Redmond are top 3 cities that has the highest market share in the dataset. This can be because the population is much higher in these two cities.
Also this dataset mainly focuses on WA and is limited to one main state for its analysis. 

3. What is the market share with the distribution of EV with different electric range?
SELECT 
   CASE
      WHEN electric_range <= 100 THEN '0-100 miles'
      WHEN electric_range <= 200 THEN '101-200 miles'
      ELSE '201+ miles'
   END AS range_category,
   COUNT(*) AS vehicle_count,
   COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop) AS market_share_percentage
FROM ev_pop
GROUP BY range_category
ORDER BY market_share_percentage DESC; 

A: 
"0-100 miles"	125514	77.0000920217171252
"201+ miles"	30914	18.9650624213981166
"101-200 miles"	6577	4.0348455568847581
We can gain insights that BEV and PHEV needs to increase their range. 

4. How has the market share of EV changed over the year?
SELECT model_year, COUNT(*) AS vehicle_cnt, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop) AS market_share_percentage
FROM ev_pop
GROUP BY model_year
ORDER BY model_year;

A: Based on the data 2021 - 2023 the market share in total = 57.89%. In 2023 the marketshare increased 12.44% from the previous year. 
We can conclude that the adoption of EV is increasing over the years and is significantlly getting more recognized as an alternative for transportation. 

5: What is the market share of different vehicle types in the dataset? (ex: plug-in-hybrid, battery-electric)
SELECT ev_type, COUNT(*) AS vehicle_count, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop) AS market_share_percentage
FROM ev_pop
GROUP BY ev_type
ORDER BY market_share_percentage DESC;

A: 
Battery Electric Vehicle (BEV) = 77.97%
Plug-in-hybrid Electric (PHEV) = 22.02%
We can conclude that BEV is significantlly higher in the dataset. 

-------------------- EV Range Analysis ---------------------
1. What are the top 5 electric vehicle make and models that have the highest range? 
SELECT make, model, 
	AVG(electric_range) AS avg_range
FROM ev_pop
GROUP BY make, model
ORDER BY avg_range DESC
LIMIT 5;

A: We can conclude that Hyundai currently is the leading make that has the highest average range in the market. We want to improve ranges for both Tesla, Jaguar to compete against Hyundai. 
"HYUNDAI"	"KONA"	    258.00
"TESLA"	    "ROADSTER"	234.36
"JAGUAR"    "I-PACE"	205.01
"TESLA"	    "MODEL S"	180.64
"CHEVROLET"	"BOLT EV"	156.43

2. What is the average range for each EV type?
SELECT ev_type, 
       COALESCE(AVG(electric_range), 0) AS avg_range
FROM ev_pop
WHERE electric_range IS NOT NULL
GROUP BY ev_type
ORDER BY avg_range DESC;

A: The average ranges for both categories are BEV = 72.61 miles and for PHEV = 30.73 miles. 

3. What is the distribution of EV range of the dataset?
SELECT 
   CASE
      WHEN electric_range <= 100 THEN '0-100 miles'
      WHEN electric_range <= 200 THEN '101-200 miles'
      ELSE '201+ miles'
   END AS range_category,
   COUNT(*) AS vehicle_cnt
FROM ev_pop
GROUP BY range_category
ORDER BY vehicle_cnt DESC;

A: The distribution of range between each categories demonstrate that EVs still currently need to increase their range to meet the demand of other types of vehicles. 
"0-100 miles"	125514
"201+ miles"	30914
"101-200 miles"	6577

-------------------- Demographic Analysis ---------------------
1. What is the distribution and adoption rate across the states?
SELECT state,
       COUNT(*) AS ev_count,
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop WHERE ev_type IS NOT NULL) AS adoption_percentage
FROM ev_pop
WHERE ev_type IS NOT NULL
GROUP BY state
ORDER BY adoption_percentage DESC;

A: Since this data mainly focuses on WA we find that WA has the highest adoption rate at 99.77%. 

2. Are there certain makes and models that dominate the market?
SELECT make, model,
       COUNT(*) AS ev_count,
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop WHERE ev_type IS NOT NULL) AS market_share_percentage
FROM ev_pop
WHERE ev_type IS NOT NULL
GROUP BY make, model
ORDER BY market_share_percentage DESC;

A: We can conlcude that Tesla holds the top make in the market. Specifically the Model Y.

3. What is the adoption rate across each postal code?
SELECT postal_code, state,
       COUNT(*) AS ev_count,
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop WHERE ev_type IS NOT NULL) AS adoption_percentage
FROM ev_pop
WHERE ev_type IS NOT NULL
GROUP BY postal_code, state
ORDER BY adoption_percentage DESC;

A: each postal code demonstrate which market we can target more to adopt EV. It seems like 98117 is close to a adoption rate of the highest, and we can target the market further. 

4. What is the adoption rate difference between 2023 and 2022?
SELECT model_year, state,
       COUNT(*) AS ev_count,
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop WHERE ev_type IS NOT NULL AND state = 'WA' AND (model_year = 2022 OR model_year = 2023)) AS adoption_percentage
FROM ev_pop
WHERE ev_type IS NOT NULL AND state = 'WA' AND (model_year = 2022 OR model_year = 2023)
GROUP BY model_year, state
ORDER BY model_year, adoption_percentage DESC;

A: We can demonstrate through this analysis that 2023 had a 50% increase in adoption rate among EVs in this dataset. 
2022	"WA"	27550	36.53
2023	"WA"	47870	63.47

