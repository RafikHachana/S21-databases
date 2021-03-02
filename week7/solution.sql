-- Exercise 1.1

SELECT first_name,last_name,title FROM
	(customer CROSS JOIN (
		SELECT film_id,title FROM (SELECT title,film.film_id,rating,category_id FROM film INNER JOIN film_category ON film.film_id =film_category.film_id) movies
		WHERE (rating='R' OR rating='PG-13') AND (category_id=11 OR category_id=14) ) selected_movies
	) crossproduct
WHERE
NOT (film_id,customer_id) IN
(SELECT film_id,customer_id FROM 
inventory INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
);


-- Exercise 1.2
SELECT city_id,max(income) FROM
	(SELECT sums.store_id,store.address_id,income FROM (SELECT store_id,sum(payment.amount) as income from
	staff inner join payment on staff.staff_id=payment.staff_id
	--where extract(month from timestamp payment_date)='10'
	group by staff.store_id) sums
INNER JOIN store on sums.store_id = store.store_id) store_list inner join 
address on store_list.address_id = address.address_id

group by address.city_id;
