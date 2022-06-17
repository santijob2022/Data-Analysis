WITH T1 AS
(SELECT
strftime("%m",start_date) AS Month1,
COUNT(*) AS total_by_Month
FROM proof2
GROUP BY strftime("%m",start_date)
)

SELECT 
strftime("%m",start_date) AS Month,
total_by_Month,
member_casual,
COUNT(*) AS by_month_and_type,
ROUND((COUNT(*)*100)/(total_by_Month+0.0), 3) AS percentage
FROM proof2 JOIN T1 ON Month1 = Month
GROUP BY strftime("%m",start_date), member_casual

LIMIT 30