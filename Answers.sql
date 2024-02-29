-- QUESTION 1
select customer_id, customer.address_id, district
from customer
inner join address
on customer.address_id = address.address_id
where district = 'Texas';

-- QUESTION 2
select payment_id, first_name, last_name, payment.customer_id, staff_id, rental_id, amount, payment_date
from payment
inner join customer
on customer.customer_id = customer.customer_id
where amount < 6.99;

-- Question 3 (Original)
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 175
);

-- Question 3 (Modified becuase there is no payment heigher than $175)
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 100
);

-- QUESTION 4
select customer_id, first_name, last_name, address_id
from customer
where address_id in (
	select address_id
	from address
	where city_id in (
		select city_id
		from city
		where country_id in (
			select country_id
			from country
			where country = 'Nepal'
		)
	)
)

-- QUESTION 5 (It is staff_id 2)
select count(amount) as transactions, payment.staff_id, first_name, last_name
from payment
inner join staff
on payment.staff_id = staff.staff_id
group by payment.staff_id, first_name, last_name order by count(amount) desc;

-- QUESTION 6
select count(rating), rating
from film
group by rating
order by count(rating) desc;

select film_id, title, rating
from film
group by film_id, title, rating order by rating;

-- QUESTION 7
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
);

-- QUESTION 8
select count(rental_id) from rental
where inventory_id in (
	select inventory_id
	from inventory
	where film_id in (
		select film_id
		from film
		where rental_rate <= 0
	)
)



