select 
    concat(a1.first_name, ' ', a1.last_name) as second_actor,
    concat(a2.first_name, ' ', a2.last_name) as first_actor,
    f.title
from (
    select 
        fa1.actor_id as actor_id_1, 
        fa2.actor_id as actor_id_2,
        count(fa1.film_id) as casted_together,
        array_agg(fa1.film_id) as film_ids
    from film_actor fa1 
    join film_actor fa2 on fa1.film_id = fa2.film_id and fa1.actor_id > fa2.actor_id
    join film f on fa1.film_id = f.film_id
    group by fa1.actor_id, fa2.actor_id
    order by casted_together desc
    limit 1
    ) q
join actor a1 on a1.actor_id = q.actor_id_1
join actor a2 on a2.actor_id = q.actor_id_2
join film f on f.film_id = any(q.film_ids)
