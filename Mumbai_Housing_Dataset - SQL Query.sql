	-- The aim of the project is to analyse the data set of mumbai housing data
use real_estate;

SELECT * FROM mumbai_housing_dataset;

-- Q1. Client wants to buy a house in Mumbai, show all the loactions where houses are available in MUmbai
select distinct Location from mumbai_housing_dataset;

-- Q2. Calculate the number of houses in each loaction for client to help him
-- to choose a loacton with the highest number of houses
select location , count(*) as total_properties from mumbai_housing_dataset group by location order by 2 desc;

-- Q3. Show top five areas with highest number of properties
select location, count(*) as total_properties 
from mumbai_housing_dataset 
group by location
order by 2 desc
limit 5;

-- Q4. Help client to find out the average price of houses in each location 
-- to make a better choice as per her budget
select location, round(avg(price),0) as avg_price from mumbai_housing_dataset
group by 1;

-- Q5. Client wants the least average price for each location with their count 
select location, round(avg(price),0) as avg_price, count(location) as properties_available
from mumbai_housing_dataset
group by 1 order by 2;

-- Q6. Client wants to move from Vasai to a 3 BHK apartement in a new location. 
-- Find the best affordable location 
select location, No_of_Bedrooms ,round(avg(price),0) as avg_price, count(Location) as options_available 
from mumbai_housing_dataset 
where location <> 'Vasai' and  No_of_Bedrooms = '3'
group by 1 order by 3 asc;

-- Q7. Client is a fitness enthusiast. Which loaction is offering the best price in mumbai
select location, round(avg(price),1) as avg_price  
from mumbai_housing_dataset
where Gymnasium = 1 and Clubhouse = 1 and `Jogging Track` = 1 and `Indoor Games` = 1 and `Swimming Pool` = 1
group by 1 order by 2;

-- Q8. Client is a Family man with two kids.
-- Help him to find a new property in goregaon at the lowest price
select location, round(min(price),1) as lowest_price , count(*) as options_available, No_of_Bedrooms
from mumbai_housing_dataset
where Location = 'Goregaon' and No_of_Bedrooms in (2,3,4) and `Car Parking` = 1 and `Childrens Play Area` = 1 and `Landscaped Gardens` = 1 and `Indoor Games` = 1
group by 1 order by 2;

-- Q9. Compare the price in Andheri for Soniya who is buying a house for her grandparents

select location, price, count(*) from mumbai_housing_dataset
where location = 'Andheri' and `Jogging Track` = 1 and `Landscaped Gardens` = 1 and Lift_Available = 1;

SELECT * FROM mumbai_housing_dataset;









