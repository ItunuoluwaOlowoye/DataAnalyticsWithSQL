--View weight data of users and convert date column to appropriate datatype
SELECT
    Id,
    CAST(PARSE_DATETIME('%m/%d/%Y %I:%M:%S %p', Date) AS DATE) AS Day,
    WeightKg,
    BMI
FROM
    `elite-replica-332817.fitbit_data.weight_data`
ORDER BY
    Id, BMI


--Identify underweight and overweight users
SELECT DISTINCT
    Id,
    BMI
FROM
    `elite-replica-332817.fitbit_data.weight_data`
WHERE
    BMI < 18.5 OR BMI >24.9
ORDER BY
    BMI


--Weight and distance data of overweight and underweight users
SELECT
    cal.Id,
    CAST(AVG(cal.Calories) AS int) AS Calory,
    AVG(BMI) AS bmi,
    AVG(VeryActiveDistance) AS avg_active_distance_perday,
    AVG(ModeratelyActiveDistance) AS avg_moderate_active_distance_perday,
    AVG(LightActiveDistance) AS avg_light_active_distance_perday,
    AVG(SedentaryActiveDistance) AS avg_sedentary_distance_perday
FROM
    `elite-replica-332817.fitbit_data.hourly_calories` AS cal
JOIN 
    `elite-replica-332817.fitbit_data.daily_activity` AS activity ON
    cal.Id=activity.Id AND CAST(PARSE_DATETIME('%m/%d/%Y %I:%M:%S %p', cal.ActivityHour) AS DATE)=PARSE_DATE('%m/%d/%Y', activity.ActivityDate)
JOIN 
    `elite-replica-332817.fitbit_data.weight_data` AS weight ON
    cal.Id=weight.Id AND CAST(PARSE_DATETIME('%m/%d/%Y %I:%M:%S %p', weight.Date) AS DATE)=CAST(PARSE_DATETIME('%m/%d/%Y %I:%M:%S %p', ActivityHour) AS DATE)
GROUP BY 
    Id
HAVING
    BMI < 18.5 OR BMI >24.9
ORDER BY
    Id
