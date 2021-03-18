     WITH  FibonacciNumbers (RecursionLevel, FibonacciNumber, NextNumber) 
AS (
   -- Anchor member definition
   SELECT  1  AS RecursionLevel,
           cast(0 as bigint)  AS FibonacciNumber,
           cast(1 as bigint)  AS NextNumber
   UNION ALL
   -- Recursive member definition
   SELECT  a.RecursionLevel + 1             AS RecursionLevel,
           cast(a.NextNumber as bigint)                     AS FibonacciNumber,
           cast(a.FibonacciNumber + a.NextNumber as bigint) AS NextNumber
   FROM FibonacciNumbers a
   WHERE a.RecursionLevel <=90
)
-- Statement that executes the CTE
SELECT  convert(varchar(max), fn.RecursionLevel - 1 ) AS FibonacciOrdinal, 
        fn.FibonacciNumber,
        fn.NextNumber
FROM FibonacciNumbers fn; 