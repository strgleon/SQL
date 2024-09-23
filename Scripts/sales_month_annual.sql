-- Step 1: Retrieve sales data, formatted by year and month
SELECT 
    strftime('%Y', soldDate) AS soldYear, 
    strftime('%m', soldDate) AS soldMonth, 
    salesAmount
FROM sales;

-- Step 2: Group by year and month and sum the salesAmount to calculate monthly sales totals
SELECT 
    strftime('%Y', soldDate) AS soldYear, 
    strftime('%m', soldDate) AS soldMonth,
    SUM(salesAmount) AS salesAmount
FROM sales
GROUP BY soldYear, soldMonth
ORDER BY soldYear, soldMonth;

-- Step 3: Use a CTE to simplify the query and add a window function to calculate annual running totals
WITH cte_sales AS (
    SELECT 
        strftime('%Y', soldDate) AS soldYear, 
        strftime('%m', soldDate) AS soldMonth,
        SUM(salesAmount) AS salesAmount
    FROM sales
    GROUP BY soldYear, soldMonth
)
SELECT 
    soldYear, 
    soldMonth, 
    salesAmount,
    SUM(salesAmount) OVER (
        PARTITION BY soldYear 
        ORDER BY soldMonth
    ) AS AnnualSales_RunningTotal
FROM cte_sales
ORDER BY soldYear, soldMonth;
