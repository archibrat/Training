--# write your SQL statement here: 
--you are given a table 'zerofuel' with columns 'distance_to_pump', 'mpg' and 'fuel_left'
--, return a table with all the columns and your result in a column named 'res'.
CREATE or REPLACE FUNCTION zerofuel ()
returns table(distance_to_pump integer, mpg int,fuel_left int, res bool)
as
$$ 

SELECT distance_to_pump,mpg,fuel_left, 
CASE WHEN mpg*fuel_left-distance_to_pump>=0 THEN TRUE 
else false end 
FROM zerofuel

$$
LANGUAGE SQL;
SELECT * from zerofuel()