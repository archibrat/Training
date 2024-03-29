WITH RECURSIVE employee_levels(level, id, first_name, last_name,
manager_id)
AS
(
    SELECT 1 AS level,
    id, first_name, last_name, manager_id
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT level+1,
    e.id, e.first_name, e.last_name, 
    e.manager_id from employees e
    join employee_levels e1 on e.manager_id = e1.id 
     
)
SELECT level, id, first_name, last_name, manager_id
FROM employee_levels;

