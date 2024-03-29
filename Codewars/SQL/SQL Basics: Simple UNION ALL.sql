select 'US' as location, id,name,price,card_name,card_number,transaction_date from ussales
where price>50
union all
select 'EU' as location, id,name,price,card_name,card_number, transaction_date from eusales
where price>50
order by 1 desc

/*
also can be accepted
select * from 
( select 'US' as location ,
id,
name,
price ,
card_name,
card_number,
transaction_date      
from ussales
where price>50                 
union all 
               
select 
'EU' as location,
id,
name,
 price ,
card_name,
card_number,
transaction_date
from eusales
where price>50
              )
as resultant 
order by 1 desc,2

*/
