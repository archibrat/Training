SELECT film_id,title, length  FROM film
WHERE length NOT between 
  (SELECT min(length) from film where rating = 'R') 
  and 
  (SELECT percentile_disc(0.50) within group (order by LENGTH asc) FROM film where rating = 'PG-13' ) 
GROUP  BY 1,2,3
ORDER BY LENGTH ASC, title, film_id