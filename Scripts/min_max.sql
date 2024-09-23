SELECT 
    emp.employeeId, 
    emp.firstName, 
    emp.lastName, 
    MIN(sls.salesAmount) AS LeastExpensiveCar, 
    MAX(sls.salesAmount) AS MostExpensiveCar
FROM 
    sales sls
INNER JOIN 
    employee emp ON sls.employeeId = emp.employeeId
GROUP BY 
    emp.employeeId, emp.firstName, emp.lastName
ORDER BY 
    emp.employeeId;
