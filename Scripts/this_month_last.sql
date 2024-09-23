-- Step 1: Get the number of cars sold per month
SELECT 
    strftime('%Y-%m', soldDate) AS MonthSold,
    COUNT(*) AS NumberCarsSold
FROM sales
GROUP BY strftime('%Y-%m', soldDate)
ORDER BY MonthSold;

-- Step 2: Apply the window function to show the number of cars sold last month
SELECT 
    strftime('%Y-%m', soldDate) AS MonthSold,
    COUNT(*) AS NumberCarsSold,
    LAG(COUNT(*), 1, 0) OVER (ORDER BY strftime('%Y-%m', soldDate)) AS LastMonthCarsSold
FROM sales
GROUP BY strftime('%Y-%m', soldDate)
ORDER BY MonthSold;
