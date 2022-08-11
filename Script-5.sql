CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	vip BOOL
);


CREATE TABLE movie (
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR(50),
	rating VARCHAR(10)
);

CREATE TABLE ticket (
	ticket_id SERIAL PRIMARY KEY,
	movie_id INTEGER,
	customer_id INTEGER,
	price NUMERIC(5,2),
	FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE concession (
	concession_id SERIAL PRIMARY KEY,
	concession_name VARCHAR(50),
	description VARCHAR(100),
	price NUMERIC(5,2),
	customer_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
)

CREATE OR REPLACE FUNCTION add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _vip BOOL)
RETURNS void
AS $MAIN$
BEGIN 
	INSERT INTO customer(customer_id, first_name, last_name, vip)
	VALUES (_customer_id, _first_name, _last_name, _vip);
END;
$MAIN$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_movie(_movie_id INTEGER, _title VARCHAR, _rating VARCHAR)
RETURNS void
AS $MAIN$
BEGIN 
	INSERT INTO movie(movie_id, title, rating)
	VALUES (_movie_id, _title, _rating);
END;
$MAIN$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_concession(_concession_id INTEGER, _concession_name VARCHAR, _description VARCHAR, _price NUMERIC(5,2), _customer_id INTEGER)
RETURNS void
AS $MAIN$
BEGIN 
	INSERT INTO concession(concession_id, concession_name, description, price, customer_id)
	VALUES (_concession_id, _concession_name, _description, _price, _customer_id);
END;
$MAIN$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_ticket(_ticket_id INTEGER, _movie_id INTEGER, _customer_id INTEGER, _price NUMERIC(5,2))
RETURNS void
AS $MAIN$
BEGIN 
	INSERT INTO ticket(ticket_id, movie_id, customer_id, price)
	VALUES (_ticket_id, _movie_id, _customer_id, _price);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_customer(1, 'Corey', 'Hamren', TRUE);
SELECT add_customer(2, 'Shelley', 'Rappleye', FALSE);

SELECT add_movie(1, 'Gentleman Broncos', 'PG-13');
SELECT add_movie(2, 'Tropic Thunder', 'R');

SELECT add_ticket(1, 1, 1, 9);
SELECT add_ticket(2, 2, 2, 10);

SELECT add_concession(1, 'popcorn', 'buttery popcorn', 5, 1);
SELECT add_concession(2, 'skittles', 'rainbow orbs of flavor', 4, 2);

	
	
	
	
	
	
	
