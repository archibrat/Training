CREATE OR REPLACE FUNCTION weekdays(
  dt1 date,
  dt2 date)
    RETURNS INTEGER
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
beg_date date;
end_date date;
BEGIN
beg_date := dt1;
end_date := dt2;
return (select count(*) as weekdays 
        from generate_series(least(beg_date,end_date),greatest(beg_date,end_date),'1 day') as period
        where extract(DOW from period) NOT in (0,6));
END;
$BODY$;
