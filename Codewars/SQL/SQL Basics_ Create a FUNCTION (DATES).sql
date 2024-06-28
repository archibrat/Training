CREATE FUNCTION agecalculator(date1 date) 
RETURNS integer 
AS $BODY$
SELECT date_part('year',AGE(NOW(), date1))::int AS age;
$BODY$  
LANGUAGE sql;
