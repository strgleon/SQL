-- Initial step: Select employee details from sales
SELECT emp.employeeId, emp.firstName, emp.lastName
FROM sales sls
INNER JOIN employee emp
    ON sls.employeeId = emp.employeeId;

-- Final step: Add GROUP BY and COUNT to get the number of cars sold by each employee
SELECT emp.employeeId, emp.firstName, emp.lastName, COUNT(*) AS NumOfCarsSold
FROM sales sls
INNER JOIN employee emp
    ON sls.employeeId = emp.employeeId
GROUP BY emp.employeeId, emp.firstName, emp.lastName
ORDER BY NumOfCarsSold DESC;
