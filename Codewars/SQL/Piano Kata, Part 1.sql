-- Piano Kata, Part 1
SELECT 
    n,
    CASE (n - 1) % 88 % 12
        WHEN 1 THEN 'black'
        WHEN 4 THEN 'black'
        WHEN 6 THEN 'black'
        WHEN 9 THEN 'black'
        WHEN 11 THEN 'black'
        ELSE 'white'
    END as res
FROM pianokeys;

