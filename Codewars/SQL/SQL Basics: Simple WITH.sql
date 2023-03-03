WITH special_sales AS (
SELECT department_id as dep_id 
  FROM sales 
WHERE price >90
)

SELECT id, name 
FROM departments
where id in (select dep_id from special_sales)

