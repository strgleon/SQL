SELECT 
    emp.employeeId, 
    emp.firstName, 
    emp.lastName, 
    COUNT(sls.salesId) AS NumOfCarsSold
FROM 
    sales sls
INNER JOIN 
    employee emp ON sls.employeeId = emp.employeeId
GROUP BY 
    emp.employeeId, emp.firstName, emp.lastName
HAVING 
    COUNT(sls.salesId) > 5
ORDER BY 
    NumOfCarsSold DESC;
