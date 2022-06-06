--Standard SQL
--These queries were run on Google's BigQuery data warehouse
--Run each line of code separated by a select statement separately--We want to find out which routes are popular for one-time customers and subscribers

--What are the most popular CitiBike stations?
SELECT 
    start_station_name,
    COUNT (*) AS number_of_trips
FROM 
    `bigquery-public-data.new_york.citibike_trips`
GROUP BY 
    start_station_name
ORDER BY 
    number_of_trips DESC 



--What are the most popular routes by user type?
SELECT
    usertype,
    CONCAT(start_station_name, " to ", end_station_name) AS route,
    COUNT(*) AS number_of_trips,
FROM 
    `bigquery-public-data.new_york.citibike_trips`
WHERE
    usertype = "Customer"
GROUP BY 
   usertype, start_station_name, end_station_name
ORDER BY 
    number_of_trips DESC
LIMIT 10
--This is for customers

SELECT
    usertype,
    CONCAT(start_station_name, " to ", end_station_name) AS route,
    COUNT(*) AS number_of_trips,
FROM 
    `bigquery-public-data.new_york.citibike_trips`
WHERE
    usertype = "Subscriber"
GROUP BY 
   usertype, start_station_name, end_station_name
ORDER BY 
    number_of_trips DESC
LIMIT 10
--This is for subscribers

--These results show the bike-sharing company the most popular routes by different types of users
--They can know where to keep more bikes for users.



--How long do the most popular routes take?
SELECT 
    CONCAT(start_station_name, " to ", end_station_name) AS route,
    COUNT(*) AS number_of_trips,
    AVG(tripduration/60) AS avg_duration_minutes
FROM 
    `bigquery-public-data.new_york.citibike_trips`
GROUP BY 
    start_station_name, end_station_name
ORDER BY 
    number_of_trips DESC
--This will help with logistics planning for fuel and other resources these bikes will need in popular routes



--What are the popular routes by gender?
--This information will help with improving UX experience based on demographic preference
SELECT 
    gender,
    CONCAT(start_station_name, " to ", end_station_name) AS route,
    COUNT(*) AS number_of_trips,
FROM 
    `bigquery-public-data.new_york.citibike_trips`
WHERE
    gender = "male"
GROUP BY 
    gender, start_station_name, end_station_name
ORDER BY 
    number_of_trips DESC 
--This is for men

SELECT 
    gender,
    CONCAT(start_station_name, " to ", end_station_name) AS route,
    COUNT(*) AS number_of_trips,
FROM 
    `bigquery-public-data.new_york.citibike_trips`
WHERE
    gender = "female"
GROUP BY 
    gender, start_station_name, end_station_name
ORDER BY 
    number_of_trips DESC 
--This is for women
