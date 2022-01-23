INSERT INTO places (name, address) VALUES ('s' , 's')

SELECT SUM(price) FROM log a JOIN shopping b ON a.id = b.purchase_id WHERE MONTH ( a.date ) = MONTH ( CURRENT_DATE() ) AND food_id IS NOT NULL

SELECT a.*, SUM(b.price) as 'spent' FROM log a JOIN shopping b ON a.id = b.purchase_id GROUP BY a.id ORDER BY date DESC

SELECT user FROM mysql.user;

CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'aaaa';
SHOW GRANTS FOR 'root'@'localhost';
GRANT SELECT ON *.* TO 'newuser'@'localhost'