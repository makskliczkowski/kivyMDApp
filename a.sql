INSERT INTO places (name, address) VALUES ('s' , 's')

DOING QUERY SELECT SUM(price) FROM log a JOIN shopping b ON a.id = b.purchase_id WHERE MONTH ( a.date ) = MONTH ( CURRENT_DATE() ) AND health_id IS NOT NULL