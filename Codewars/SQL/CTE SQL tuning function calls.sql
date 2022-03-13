 WITH CTE AS (
SELECT  d.department_id
       ,d.department_name
       ,pctIncrease(d.department_id) AS pct
FROM departments d )
SELECT  e.employee_id
       ,e.first_name
       ,e.last_name
       ,e.salary           AS old_salary
       ,d.department_name
       ,e.salary*(1+d.pct) AS new_salary
FROM Employees e
INNER JOIN CTE d
ON e.department_id = d.department_id
ORDER BY 1; */
