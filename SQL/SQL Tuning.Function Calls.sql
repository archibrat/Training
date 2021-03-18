SELECT  e.employee_id
       ,e.first_name
       ,e.last_name
       ,d.department_name
       ,e.salary       AS old_salary
       ,e.salary*d.pct AS new_salary
FROM Employees e, 
(
	SELECT  department_id
	       ,department_name
	       ,1 + pctIncrease(department_id) pct
	FROM departments
) d
WHERE e.department_id = d.department_id
ORDER BY 1;  