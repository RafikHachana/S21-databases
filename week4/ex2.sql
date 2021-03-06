-- view 1
drop view if exists v1;
create view v1 as
  select f.title, c.name
  from film f
  inner join film_category fc on f.film_id = fc.film_id
  inner join category c on c.category_id = fc.category_id and c.name='Horror';

select * from v1;

drop function if exists func() cascade;
CREATE FUNCTION func()
   RETURNS TRIGGER
   LANGUAGE PLPGSQL
AS
$$
BEGIN
   -- trigger logic
   perform version();
   return null;
END

$$;

-- trigger 1
drop trigger if exists t1 on payment;

CREATE TRIGGER t1
   AFTER INSERT
   ON payment
   FOR EACH STATEMENT
       EXECUTE PROCEDURE func();



insert into payment(payment_id, customer_id, staff_id, rental_id, amount, payment_date) values
(182323, 1, 1, 1, 500, '1996-12-02');
