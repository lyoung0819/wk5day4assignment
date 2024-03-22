--- THURSDAY HOMEWORK ---

-- ANSWERS:
-- 1. Create a Stored Procedure that will insert a new film into the film table with the
-- following arguments: title, description, release_year, language_id, rental_duration,
-- rental_rate, length, replace_cost, rating
CREATE OR REPLACE PROCEDURE insert_new_film(title VARCHAR, description TEXT, release_year PUBLIC.YEAR, language_id INTEGER, rental_duration INTEGER, rental_rate NUMERIC(4,2), film_length INTEGER, replacement_cost NUMERIC(5,2), rating MPAA_RATING)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, film_length, replacement_cost, rating)
	VALUES (title, description, release_year, language_id, rental_duration, rental_rate, film_length, replacement_cost, rating); 
END;
$$;



-- 2. Create a Stored Function that will take in a category_id and return the number of
-- films in that category
CREATE OR REPLACE FUNCTION category_count(num INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE category_num INTEGER;
BEGIN
	SELECT COUNT(*)
	INTO category_num
	FROM film_category fc 
	WHERE category_id = num
	GROUP BY fc.category_id;
	RETURN category_num;
END;
$$;

-----------------------------------------------------------------
-----------------------------------------------------------------

-- WORK:

-- >> Q1: << 

SELECT * FROM film f;

ALTER TABLE film RENAME COLUMN length TO film_length;
 
CREATE OR REPLACE PROCEDURE insert_new_film(title VARCHAR, description TEXT, release_year PUBLIC.YEAR, language_id INTEGER, rental_duration INTEGER, rental_rate NUMERIC(4,2), film_length INTEGER, replace_cost NUMERIC(5,2), rating MPAA_RATING)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, film_length, replace_cost, rating)
	VALUES (title, description, release_year, language_id, rental_duration, rental_rate, film_length, replace_cost, rating); 
END;
$$;

DROP PROCEDURE IF EXISTS insert_new_film;

CREATE OR REPLACE PROCEDURE insert_new_film(title VARCHAR, description TEXT, release_year PUBLIC.YEAR, language_id INTEGER, rental_duration INTEGER, rental_rate NUMERIC(4,2), film_length INTEGER, replacement_cost NUMERIC(5,2), rating MPAA_RATING)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, film_length, replacement_cost, rating)
	VALUES (title, description, release_year, language_id, rental_duration, rental_rate, film_length, replacement_cost, rating); 
END;
$$;


CALL insert_new_film('Hello World','XYZ', '2018', '1', '2', '12.99', '3', '22.30', 'R');
SELECT * FROM film f
WHERE title = 'Hello World';


-- >> Q2 << 

-- From a Category ID, we want to the number of films in that catergoy
SELECT category_id, COUNT(*)
	FROM film_category fc 
	WHERE category_id = num
	GROUP BY fc.category_id;


CREATE OR REPLACE FUNCTION category_count(num INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE category_num INTEGER;
BEGIN
	SELECT COUNT(*)
	INTO category_num
	FROM film_category fc 
	WHERE category_id = num
	GROUP BY fc.category_id;
	RETURN category_num;
END;
$$;

SELECT category_count(1);
SELECT category_count(8);