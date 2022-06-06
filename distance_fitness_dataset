--View all columns and correct the datatype of the date column
SELECT 
    DISTINCT *,
    PARSE_DATE("%m/%d/%Y", ActivityDate) AS correct_date,
FROM 
    `elite-replica-332817.fitbit_data.daily_activity`
ORDER BY 
    Id, correct_date
    
    
--Discrepancies in distance columns
SELECT 
    Id,
    PARSE_DATE("%m/%d/%Y", ActivityDate) AS correct_date,
    TotalSteps,
    TotalDistance,
    TrackerDistance,
    (VeryActiveDistance+ModeratelyActiveDistance+LightActiveDistance+SedentaryActiveDistance) AS distance
FROM 
    `elite-replica-332817.fitbit_data.daily_activity`
WHERE
    TotalDistance != TrackerDistance
ORDER BY 
    Id, correct_date
    
    
--Users with up to four weeks of data logged (Consistent users)
SELECT
    Id,
    COUNT(ActivityDate) AS number_of_days
FROM
    `elite-replica-332817.fitbit_data.daily_activity`
GROUP BY
    Id
HAVING
    COUNT(ActivityDate)>=28
ORDER BY 
    number_of_days
    
    
--Distance summary statistics for consistent users
SELECT 
    Id,
    COUNT(DISTINCT ActivityDate) AS number_of_days,
    SUM(TotalDistance) AS monthly_total_distance,
    AVG(TotalDistance) AS avg_total_distance_perday,
    SUM(VeryActiveDistance) AS monthly_active_distance,
    AVG(VeryActiveDistance) AS avg_active_distance_perday,
    ROUND((SUM(VeryActiveMinutes)/60), 2) AS monthly_active_hours,
    ROUND(AVG(VeryActiveMinutes),2) AS avg_active_minutes_perday,
    SUM(ModeratelyActiveDistance) AS monthly_moderate_active_distance,
    AVG(ModeratelyActiveDistance) AS avg_moderate_active_distance_perday,
    ROUND((SUM(FairlyActiveMinutes)/60), 2) AS monthly_moderate_active_hours,
    ROUND(AVG(FairlyActiveMinutes),2) AS avg_moderate_active_minutes_perday,
    SUM(LightActiveDistance) AS monthly_light_distance,
    AVG(LightActiveDistance) AS avg_light_active_distance_perday,
    ROUND((SUM(LightlyActiveMinutes)/60), 2) AS monthly_light_active_hours,
    ROUND((AVG(LightlyActiveMinutes)/60), 2) AS avg_light_active_hours_perday,
    SUM(SedentaryActiveDistance) AS monthly_sedentary_distance,
    AVG(SedentaryActiveDistance) AS avg_sedentary_distance_perday,
    ROUND((SUM(SedentaryMinutes)/60), 2) AS monthly_sedentary_active_hours,
    ROUND((AVG(SedentaryMinutes)/60), 2) AS avg_sedentary_active_hours_perday
FROM
    `elite-replica-332817.fitbit_data.daily_activity`
WHERE
    TotalDistance = TrackerDistance
GROUP BY 
    Id
HAVING 
    number_of_days >= 28
