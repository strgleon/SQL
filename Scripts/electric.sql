-- 1. Join sales and inventory to see which cars were sold
SELECT *
FROM sales sls
INNER JOIN inventory inv
  ON sls.inventoryId = inv.inventoryId;

-- 2. Review the model table (this step can be run independently for checking data)
SELECT *
FROM model
LIMIT 10;

-- 3. Lookup the modelId for electric cars
SELECT modelId
FROM model
WHERE EngineType = 'Electric';

-- 4. Final query: Find sales of electric cars using a subquery
SELECT sls.soldDate, sls.salesAmount, inv.colour, inv.year
FROM sales sls
INNER JOIN inventory inv
  ON sls.inventoryId = inv.inventoryId
WHERE inv.modelId IN (
  SELECT modelId
  FROM model
  WHERE EngineType = 'Electric'
);
