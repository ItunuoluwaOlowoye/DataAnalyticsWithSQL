--What are the most popular CitiBike stations?
SELECT
	pickup_longitude,
	pickup_latitude,
	COUNT (*) AS num_trips
FROM
	PortfolioProject..newyork_citi_bikes
GROUP BY
	pickup_longitude, pickup_latitude
ORDER BY
	num_trips DESC
--Another data source with the station names, longitude and latitude can be used to find out the station names


--How long do the most popular routes take?
SELECT
	CONCAT(STR(pickup_longitude, 10, 5), STR(pickup_latitude, 10,6), '  to ', STR(dropoff_longitude, 10, 5), STR(dropoff_latitude, 10,6)) AS route,
	COUNT(*) AS num_trips,
	AVG(trip_duration/60) AS duration_minutes
FROM
	PortfolioProject..newyork_citi_bikes
GROUP BY
	pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude
ORDER BY
	num_trips DESC


--What are the popular routes by gender?
SELECT
	gender_id,
	CONCAT(STR(pickup_longitude, 10, 5), STR(pickup_latitude, 10,6), '  to ', STR(dropoff_longitude, 10, 5), STR(dropoff_latitude, 10,6)) AS route,
	COUNT(*) AS num_trips
FROM
	PortfolioProject..newyork_citi_bikes
WHERE
	gender_id=0
GROUP BY
	gender_id, pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude
ORDER BY
  num_trips DESC
--This is when gender id is 0


SELECT
	gender_id,
	CONCAT(STR(pickup_longitude, 10, 5), STR(pickup_latitude, 10,6), '  to ', STR(dropoff_longitude, 10, 5), STR(dropoff_latitude, 10,6)) AS route,
	COUNT(*) AS num_trips
FROM
	PortfolioProject..newyork_citi_bikes
WHERE
	gender_id=1
GROUP BY
	gender_id, pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude
ORDER BY
  num_trips DESC
  --This is when gender id is 1


SELECT
	gender_id,
	CONCAT(STR(pickup_longitude, 10, 5), STR(pickup_latitude, 10,6), '  to ', STR(dropoff_longitude, 10, 5), STR(dropoff_latitude, 10,6)) AS route,
	COUNT(*) AS num_trips
FROM
	PortfolioProject..newyork_citi_bikes
WHERE
	gender_id=2
GROUP BY
	gender_id, pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude
ORDER BY
  num_trips DESC
  --This is when gender id is 2