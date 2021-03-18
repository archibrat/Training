SELECT  COUNT(*)      AS visits_count
       ,v1.entry_time AS when_happened
FROM visits v1
JOIN visits v2
ON v1.entry_time >= v2.entry_time AND v1.entry_time < v2.exit_time
GROUP BY  v1.id
         ,v1.entry_time
ORDER BY visits_count desc
         ,when_happened asc
LIMIT 1;