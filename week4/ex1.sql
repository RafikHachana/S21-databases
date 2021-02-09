-- 1
select * from country
order by country_id
offset 11 limit 6;

-- 2
select address, city
from address inner join city on address.city_id = city.city_id
where city like 'A%';

-- 3
select first_name, last_name, city
from customer inner join address
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id;

-- 4
select first_name, last_name, amount
from payment inner join customer on payment.customer_id = customer.customer_id
where amount > 11;

-- 5
select first_name from customer out
where (select count(*) from customer inr
where inr.first_name = out.first_name) > 1;

