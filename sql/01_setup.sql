-- DVD Rental table (restore)
SELECT 'customer' AS table_name, COUNT(*) FROM customer
UNION ALL
SELECT 'film', COUNT(*) FROM film
UNION ALL
SELECT 'inventory', COUNT(*) FROM inventory
UNION ALL
SELECT 'rental', COUNT(*) FROM rental
UNION ALL
SELECT 'payment', COUNT(*) FROM payment;


DROP TABLE IF EXISTS payment_big;
DROP TABLE IF EXISTS rental_big;

--  Veri artırma
CREATE TABLE payment_big AS
SELECT 
    row_number() OVER () AS big_payment_id,
    p.payment_id,
    p.customer_id,
    p.staff_id,
    p.rental_id,
    p.amount,
    p.payment_date
FROM payment p
CROSS JOIN generate_series(1, 300) gs;

ALTER TABLE payment_big
ADD CONSTRAINT payment_big_pk PRIMARY KEY (big_payment_id);


CREATE TABLE rental_big AS
SELECT 
    row_number() OVER () AS big_rental_big_id,
    r.rental_id,
    r.rental_date,
    r.inventory_id,
    r.customer_id,
    r.return_date,
    r.staff_id,
    r.last_update
FROM rental r
CROSS JOIN generate_series(1, 200) gs;

ALTER TABLE rental_big
ADD CONSTRAINT rental_big_pk PRIMARY KEY (big_rental_big_id);

-- İstatistikleri güncelle
ANALYZE payment_big;
ANALYZE rental_big;

-- kontrol
SELECT COUNT(*) AS payment_big_count FROM payment_big;
SELECT COUNT(*) AS rental_big_count FROM rental_big;