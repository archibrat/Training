select cust.customer_id, cust.email, count(pay.payment_id) as payments_count, cast(sum(pay.amount) as float ) as total_amount
from customer cust 
join payment pay on pay.customer_id = cust.customer_id
group by cust.customer_id, cust.email
order by total_amount desc
limit 10
