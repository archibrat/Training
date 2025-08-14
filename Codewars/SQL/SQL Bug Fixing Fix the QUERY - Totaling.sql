SELECT
    CAST(s.transaction_date AS DATE) AS day,
    d.name AS department,
    COUNT(1) AS sale_count
FROM sale AS s
JOIN department AS d ON s.department_id = d.id
GROUP BY CAST(s.transaction_date AS DATE), d.name
ORDER BY day ASC, department ASC;
