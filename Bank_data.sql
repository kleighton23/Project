-- Calculating average salary by region and gender
SELECT Geography, Gender, Round(AVG(EstimatedSalary), 2) as 'AverageSalary'
FROM bank_db.bank_data
GROUP BY Geography, Gender
ORDER BY Geography;

-- Calculating average balance by region and gender
SELECT Geography, Gender, Round(AVG(Balance), 2) as 'AverageBalance'
FROM bank_db.bank_data
GROUP BY Geography, Gender
ORDER BY Geography;
-- While salaries are similar across all regions, Germany stands out with significantly higher average balances compared to France and Spain.

-- Calculating churn by region and gender
SELECT Geography, Gender, Round(SUM(CASE WHEN Exited = 'True' THEN 1 ELSE 0 END) / COUNT(*) * 100 ,2) AS 'PercentChurn'
FROM bank_db.bank_data
GROUP BY Geography, Gender
ORDER BY Geography;
-- Germany shows a significantly higher churn rate than other regions,
-- with nearly half of female customers exiting 45.87% compared to 30.22% of males.
-- In Spain and France, churn rates are lower overall, but females still leave
-- at nearly double the rate of males. This suggests that both geography and gender 
-- play an important role in customer retention, with German females being the 
-- most at-risk group.

-- Shows how each customer's balance compares to others in their region, helping identify top or bottom percentile customers
SELECT Surname, Geography, Gender, Balance, PERCENT_RANK() OVER (PARTITION BY Geography ORDER BY Balance  asc)* 100 AS 'BalancePercentile'
FROM bank_db.bank_data
WHERE Balance > 0;

