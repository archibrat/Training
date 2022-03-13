/*
--CAST is needed to catch integer overflow
can be replaced with ::bigint
*/
 
 WITH RECURSIVE FibonacciNumbers (RecursionLevel, FibonacciNumber, NextNumber) AS (
SELECT  1                 AS RecursionLevel
       ,cast(0 AS bigint) AS FibonacciNumber
       ,cast(1 AS bigint) AS NextNumber 
UNION ALL
SELECT  a.RecursionLevel + 1                             AS RecursionLevel
       ,cast(a.NextNumber                     AS bigint) AS FibonacciNumber
       ,cast(a.FibonacciNumber + a.NextNumber AS bigint) AS NextNumber
FROM FibonacciNumbers a
WHERE a.RecursionLevel <90 ) 
SELECT  fn.FibonacciNumber AS number
FROM FibonacciNumbers fn; 
