-- First, join the tables to get the necessary data
SELECT emp.firstName, emp.lastName, mdl.model, sls.salesId
FROM sales sls
INNER JOIN employee emp
  ON sls.employeeId = emp.employeeId
INNER JOIN inventory inv
  ON inv.inventoryId = sls.inventoryId
INNER JOIN model mdl
  ON mdl.modelId = inv.modelId;

-- Now, apply grouping to find out how many of each model was sold by each employee
SELECT emp.firstName, emp.lastName, mdl.model,
  COUNT(mdl.model) AS NumberSold
FROM sales sls
INNER JOIN employee emp
  ON sls.employeeId = emp.employeeId
INNER JOIN inventory inv
  ON inv.inventoryId = sls.inventoryId
INNER JOIN model mdl
  ON mdl.modelId = inv.modelId
GROUP BY emp.firstName, emp.lastName, mdl.model;

-- Finally, add the windowing function to rank the models sold by each employee
SELECT emp.firstName, emp.lastName, mdl.model,
  COUNT(mdl.model) AS NumberSold,
  RANK() OVER (PARTITION BY emp.employeeId ORDER BY COUNT(mdl.model) DESC) AS Rank
FROM sales sls
INNER JOIN employee emp
  ON sls.employeeId = emp.employeeId
INNER JOIN inventory inv
  ON inv.inventoryId = sls.inventoryId
INNER JOIN model mdl
  ON mdl.modelId = inv.modelId
GROUP BY emp.firstName, emp.lastName, mdl.model
ORDER BY emp.lastName, Rank;
