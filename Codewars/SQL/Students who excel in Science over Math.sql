SELECT 
    s.id as student_id,
    s.name,
    sc.score - mc.score AS score_difference
FROM students s
JOIN courses sc ON s.id = sc.student_id
    AND sc.course_name = 'Science'
JOIN courses mc ON s.id = mc.student_id
    AND mc.course_name = 'Math'
WHERE sc.score > mc.score
ORDER BY score_difference DESC, s.id ASC;
