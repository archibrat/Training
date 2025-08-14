SELECT
  n,
  (
    ((n * (n + 1)) / 2)::bigint
  ) *
  (
    ((n * (n + 1)) / 2)::bigint
  ) AS res
FROM cubes
ORDER BY n ASC;