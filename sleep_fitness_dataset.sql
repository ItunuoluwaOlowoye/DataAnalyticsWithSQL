--Sleep summary statistics for consistent users with both distance and sleep data
SELECT 
    DISTINCT activity.Id,
    COUNT(DISTINCT activity.ActivityDate) AS number_of_days,
    ROUND(SUM(sleep.TotalTimeInBed)/60, 2) AS monthly_bed_hours,
    ROUND(AVG(sleep.TotalTimeInBed)/60, 2) AS avg_bed_hours_perday,
    ROUND(SUM(sleep.TotalMinutesAsleep)/60, 2) AS monthly_sleep_hours,
    ROUND(AVG(sleep.TotalMinutesAsleep)/60, 2) AS avg_sleep_hours_perday
FROM
    `elite-replica-332817.fitbit_data.daily_activity` AS activity
JOIN
    `elite-replica-332817.fitbit_data.sleep_data` AS sleep ON
    activity.Id = sleep.Id AND 
    PARSE_DATE('%m/%d/%Y', activity.ActivityDate) = CAST(PARSE_DATETIME('%m/%d/%Y %I:%M:%S %p', sleep.SleepDay) AS date)
WHERE
    activity.TotalDistance = activity.TrackerDistance
GROUP BY 
    activity.Id
HAVING 
    number_of_days >= 28
    
    
-- A particular user's information
SELECT 
    DISTINCT activity.Id,
    COUNT(DISTINCT activity.ActivityDate)
FROM
    `elite-replica-332817.fitbit_data.daily_activity` AS activity
JOIN
    `elite-replica-332817.fitbit_data.sleep_data` AS sleep ON
    activity.Id = sleep.Id AND 
    PARSE_DATE('%m/%d/%Y', activity.ActivityDate) = CAST(PARSE_DATETIME('%m/%d/%Y %I:%M:%S %p', sleep.SleepDay) AS date)
WHERE
   activity.Id=8378563200
GROUP BY 
    activity.Id
