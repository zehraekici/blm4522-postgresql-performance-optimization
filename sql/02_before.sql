-- indeks yokken performans analizi

EXPLAIN ANALYZE
SELECT *
FROM payment_big
WHERE payment_date BETWEEN '2007-03-01' AND '2007-03-31';

EXPLAIN ANALYZE
SELECT *
FROM payment_big
WHERE customer_id = 100;

EXPLAIN ANALYZE
SELECT *
FROM payment_big
WHERE customer_id = 100
  AND payment_date BETWEEN '2007-03-01' AND '2007-03-31';

EXPLAIN ANALYZE
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_payment
FROM customer c
JOIN payment_big p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_payment DESC;

EXPLAIN ANALYZE
SELECT 
    r.rental_id,
    r.rental_date,
    c.first_name,
    c.last_name,
    i.film_id
FROM rental_big r
JOIN customer c ON r.customer_id = c.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE r.rental_date >= '2005-07-01'
ORDER BY r.rental_date DESC;