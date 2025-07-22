CREATE DATABASE myDB;

USE myDB;

DROP DATABASE myDB;

CREATE DATABASE myDB;

USE myDB;

ALTER DATABASE myDB READ ONLY = 1;

ALTER DATABASE myDB READ ONLY = 0;

RENAME TABLE employees TO workers;

DROP TABLE employees;

ALTER TABLE employees
ADD phone_number VARCHAR(15);

ALTER TABLE employees
RENAME COLUMN phone_number TO email;

ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100);


ALTER TABLE employees
MODIFY email VARCHAR(100)
AFTER last_name;

SELECT * FROM employees;


ALTER TABLE employees
MODIFY email VARCHAR(100)
FIRST;

SELECT * FROM employees;


ALTER TABLE employees
DROP COLUMN email;

SELECT * FROM employees;


INSERT INTO employees
VALUES (1, "Eugene", "Krabs", 25.50, "2023-01-02");

SELECT * FROM employees;




INSERT INTO employees
VALUES (2, "Squidward", "Tentacles", 15.00, "2023-01-03"),
       (3, "Spongebob", "Squarepants", 12.50, "2023-01-04"),
       (4, "Patrick", "Star", 12.50, "2023-01-05"),
       (5, "Sandy", "Cheeks", 17.25, "2023-01-06");

SELECT * FROM employees;




INSERT INTO employees (employee_id, first_name, last_name)
VALUES (6, "Sheldon", "Plankton");

SELECT * FROM employees;



SELECT first_name, last_name FROM employees;



SELECT * FROM employees WHERE employee_id = 1;



SELECT * FROM employees WHERE first_name = "Spongebob";



SELECT * FROM employees WHERE hourly_pay >= 15;



SELECT * FROM employees WHERE hire_date <= "2023-01-03";



SELECT * FROM employees WHERE employee_id != 1;



SELECT * FROM employees WHERE hire_date = NULL;





SELECT * FROM employees WHERE hire_date IS NOT NULL;



SELECT first_name FROM employees WHERE hire_date IS NOT NULL;



UPDATE employees 
SET hourly_pay = 10.25 
WHERE employee_id = 6;
SELECT * FROM employees;



UPDATE employees 
SET hourly_pay = 10.25,
	hire_date = "2023-01-07"
WHERE employee_id = 6;
SELECT * FROM employees;



UPDATE employees 
SET hire_date = NULL
WHERE employee_id = 6;
SELECT * FROM employees;



UPDATE employees
SET hourly_pay = 10.25;
SELECT * FROM employees;



DELETE FROM employees
WHERE employee_id = 6;
SELECT * FROM employees;



SET AUTOCOMMIT = OFF;




COMMIT;




ROLLBACK;




CREATE TABLE test(
	my_date DATE,
	my_time TIME,
	my_datetime DATETIME
);




SELECT * FROM test;




INSERT INTO test
VALUES(CURRENT_DATE(), CURRENT_TIME(), NOW());

SELECT * FROM test;




INSERT INTO test
VALUES(CURRENT_DATE() + 1, NULL, NULL);

SELECT * FROM test;




INSERT INTO test
VALUES(CURRENT_DATE() - 1, NULL, NULL);

SELECT * FROM test;



DROP TABLE test;




CREATE TABLE products (
	product_id INT,
	product_name VARCHAR(25) UNIQUE,
    price DECIMAL(4, 2)
);




ALTER TABLE products
ADD CONSTRAINT
UNIQUE(product_name);




SELECT * FROM products;





INSERT INTO products
VALUES  (100, "hamburger", 3.99),
	(101, "fries", 1.89),
        (102, "soda", 1.00),
        (103, "ice cream", 1.49);




SELECT * FROM products;




ALTER TABLE products
MODIFY price DECIMAL(4, 2) NOT NULL;




SELECT * FROM products;




INSERT INTO products
VALUES (104, "cookie", 0);

SELECT * FROM products;




CREATE TABLE employees (
	employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE,
    CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10.00)
);




ALTER TABLE employees
ADD CONSTRAINT chk_hourly_pay CHECK(hourly_pay >= 10.00);




SELECT * FROM employees;




ALTER TABLE employees
DROP CHECK chk_hourly_pay;




INSERT INTO products
VALUES  (104, "straw", 0.00),
	(105, "napkin", 0.00),
        (106, "fork", 0.00),
        (107, "spoon", 0.00);





DELETE FROM products
WHERE product_id >= 104;
SELECT * FROM products;




CREATE TABLE products (
	product_id INT,
	product_name VARCHAR(25),
	price DECIMAL(4, 2) DEFAULT 0
);






ALTER TABLE products
ALTER price SET DEFAULT 0;




INSERT INTO products (product_id, product_name)
VALUES  (104, "straw"),
		(105, "napkin"),
        (106, "fork"),
        (107, "spoon");
SELECT * FROM products;




CREATE TABLE transactions(
	transaction_id INT,
    amount DECIMAL(5, 2),
    transaction_date DATETIME DEFAULT NOW()
);




SELECT * FROM transactions;




INSERT INTO transactions (transaction_id, amount)
VALUES (1, 4.99);

SELECT * FROM transactions;




DROP TABLE transactions;




CREATE TABLE products (
	product_id INT,
	product_name varchar(25) UNIQUE,
	price DECIMAL(4, 2) DEFAULT 0.00
);




CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY,
    	amount DECIMAL(5, 2)
);
SELECT * FROM transactions;




ALTER TABLE transactions
ADD CONSTRAINT
PRIMARY KEY(transaction_id);

SELECT * FROM transactions;




INSERT INTO transactions
VALUES  (1000, 4.99);
	(1001, 3.38);
	

SELECT * FROM transactions;




SELECT amount
FROM transactions
WHERE transaction_id = 1001;




DROP TABLE transactions;




CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    	amount DECIMAL(5, 2)
);
SELECT * FROM transactions;




INSERT INTO transactions (amount)
VALUES  (4.99),
	(2.89),
	(3.38),
	(4.99);
SELECT * FROM transactions;




ALTER TABLE transactions
AUTO_INCREMENT = 1000;





DELETE FROM transactions;
SELECT * FROM transactions;




CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
SELECT * FROM customers;




INSERT INTO customers (first_name, last_name)
VALUES  ("Fred", "Fish"),
	("Larry", "Lobster"),
        ("Bubble", "Bass");
SELECT * FROM customers;




DROP TABLE transactions;




CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
SELECT * FROM transactions;




ALTER TABLE transactions
DROP FOREIGN KEY transactions_ibfk_1;




ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id
FOREIGN KEY(customer_id) REFERENCES customers(customer_id);




DELETE FROM transactions;
SELECT * FROM transactions;





ALTER TABLE transactions
AUTO_INCREMENT = 1000;





INSERT INTO transactions (amount, customer_id)
VALUES  (4.99, 3),
	(2.89, 2),
        (3.38, 3),
        (4.99, 1);
SELECT * FROM transactions;




INSERT INTO transactions (amount, customer_id)
VALUES (1.00, NULL);
SELECT * FROM transactions;





INSERT INTO customers (first_name, last_name)
VALUES ("Poppy", "Puff");
SELECT * FROM customers;




SELECT *
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;




SELECT *
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;






SELECT transactio_id, amount, first_name, last_name
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;





SELECT transaction_id, amount, first_name, last_name
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;




SELECT *
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;




SELECT *
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;





SELECT COUNT(amount)
FROM transactions;




SELECT MAX(amount)
FROM transactions;






SELECT MIN(amount)
FROM transactions;





SELECT AVG(amount)
FROM transactions;





SELECT SUM(amount)
FROM transactions;




SELECT CONCAT(first_name," ", last_name)
FROM employees;




ALTER TABLE employees
ADD COLUMN job VARCHAR(25) AFTER hourly_pay;
SELECT * FROM employees;





UPDATE employees
SET job = "manager"
WHERE employee_id = 1;
SELECT * FROM employees;





SELECT *
FROM employees
WHERE hire_date < "2023-01-5";




SELECT * 
FROM employees
WHERE hire_date < "2023-01-05" AND job = "manager";




SELECT *
FROM employees
WHERE job = "cook" OR job = "cashier";





SELECT *
FROM employees
WHERE job = "cook" OR job = "cashier";





SELECT *
FROM employees
WHERE NOT job = "manager";




SELECT *
FROM employees
WHERE NOT job = "manager" AND NOT job = "asst. manager";




SELECT *
FROM employees
WHERE hire_date BETWEEN "2023-01-04" AND "2023-01-07";




SELECT *
FROM employees
WHERE job IN ("cook", "cashier", "janitor");




SELECT * FROM employees
WHERE first_name LIKE "s%";





SELECT * FROM employees
WHERE hire_date LIKE "2023%";





SELECT * FROM employees
ORDER BY last_name;





SELECT * FROM employees
ORDER BY last_name DESC;





SELECT * FROM employees
ORDER BY hire_date DESC;






SELECT * FROM employees
ORDER BY amount, customer_id;





SELECT * FROM customers
LIMIT 1;





SELECT * FROM customers
LIMIT 2;





SELECT * FROM customers
ORDER BY last_name LIMIT 1;






SELECT * FROM customers
ORDER BY last_name DESC LIMIT 1;





SELECT * FROM customers
LIMIT 1, 1;





SELECT * FROM customers
LIMIT 2, 1;





SELECT first_name, last_name FROM employees;
UNION
SELECT first_name, last_name FROM customers;





SELECT first_name, last_name FROM employees;
UNION ALL
SELECT first_name, last_name FROM customers;






INSERT INTO customers
VALUES(5, "Sheldon", "Plankton");
SELECT * FROM customers;





ALTER TABLE customers
ADD referral_id INT;
SELECT * FROM customers;




UPDATE customers
SET referral_id = 1
WHERE customer_id =2;
SELECT * FROM customers;





UPDATE customers
SET referral_id = 2
WHERE customer_id =2;
SELECT * FROM customers;





SELECT *
FROM customers AS a
INNER JOIN customers AS b
ON a.referral_id = b.customer_id;





SELECT a.customer_id, a.first_name, a.last_name, CONCAT(b.first_name," ", b.last_name) AS "referred_by"
FROM customers AS a
LEFT JOIN customers AS b
ON a.referral_id = b.customer_id;





ALTER TABLE employees
ADD supervisor_id INT;
SELECT * FROM employees;




UPDATE employees
SET supervisor_id = 5
WHERE employee_id = 2;
SELECT * FROM employees;





SELECT *
FROM employees AS a
INNER JOIN employees AS b
ON a.supervisor_id = b.employee_id;





SELECT a.first_name, a.last_name, CONCAT(b.first_name, " ", b.last_name) AS "reports to"
FROM employees AS a
INNER JOIN employees AS b
ON a.supervisor_id = b.employee_id;





SELECT a.first_name, a.last_name, CONCAT(b.first_name, " ", b.last_name) AS "reports to"
FROM employees AS a
LEFT JOIN employees AS b
ON a.supervisor_id = b.employee_id;





SELECT * FROM employees;






CREATE VIEW employee_attendance AS
SELECT first_name, last_name
FROM employees;





SELECT * FROM employee_attendance;





SELECT * FROM employee_attendance
ORDER BY last_name ASC;





DROP VIEW employee_attendance;





SELECT * FROM customers;





ALTER TABLE customers
ADD COLUMN email VARCHAR(50);
SELECT * FROM customers;






UPDATE customers
SET email = "FFish@gmail.com"
WHERE customer_id = 1;
SELECT * FROM customers;





SELECT * FROM customer_emails;





INSERT INTO customers
VALUES (6, "Pearl", "Krab", NULL, "PKrabs@gmail.com");

SELECT * FROM customers;





SELECT * FROM customer_emails;





SHOW INDEXES FROM customers;





CREATE INDEX last_name_idx
ON customers(last_name);






SELECT * FROM customers
WHERE last_name = "Puff";






CREATE INDEX last_name_first_name_idx
ON customers(last_name, first_name);






SHOW INDEXES FROM customers;






ALTER TABLE customers
DROP INDEX last_name_idx;

SHOW INDEXES FROM customers;





SELECT * FROM customers
WHERE last_name = "Puff" AND first_name = "Poppy";






SELECT AVG(hourly_pay) FROM employees;





SELECT first_name, last_name, hourly_pay, (SELECT AVG(hourly_pay) FROM employees)
FROM employees;





SELECT first_name, last_name, hourly_pay
FROM employees
WHERE hourly_pay > 15.45;





SELECT customer_id
FROM transactions
WHERE customer_id IS NOT NULL;





SELECT DISTINCT customer_id
FROM transactions
WHERE customer_id IS NOT NULL;





SELECT first_name, last_name
FROM customers
WHERE customer_id IN
(SELECT DISTINCT customer_id
FROM transactions
WHERE customer_id IS NOT NULL);







SELECT first_name, last_name
FROM customers
WHERE customer_id NOT IN
(SELECT DISTINCT customer_id
FROM transactions
WHERE customer_id IS NOT NULL);






SELECT first_name, last_name
FROM customers
WHERE customer_id NOT IN (1, 2, 3);




SELECT SUM(amount), customer_id
FROM transactions
GROUP BY customer_id;





SELECT MAX(amount), customer_id
FROM transactions
GROUP BY customer_id;





SELECT AVG(amount), customer_id
FROM transactions
GROUP BY customer_id;






SELECT COUNT(amount), customer_id
FROM transactions
GROUP BY customer_id;





SELECT COUNT(amount), customer_id
FROM transactions
GROUP BY customer_id;
HAVING COUNT(amount) > 1;





SELECT COUNT(amount), customer_id
FROM transactions
GROUP BY customer_id;
HAVING COUNT(amount) > 1 AND customer_id IS NOT NULL;





SELECT COUNT(transaction_id) AS "# of orders", customer_id
FROM transactions
GROUP BY customer_id WITH ROLLUP;





SELECT SUM(hourly_pay) AS "hourly pay", employee_id
FROM employees
GROUP BY employee_id WITH ROLLUP;





DELETE FROM customers
WHERE customer_id = 4;
SELECT * FROM customers;





SET foreign_key_checks = 0;

DELETE FROM customers
WHERE customer_id = 4;
SELECT * FROM customers;





INSERT INTO customers
VALUES(4, "Poppy", "Puff", 2, "PPuff@gmail.com");
SELECT * FROM customers;





ALTER TABLE transactions
ADD CONSTRAINT ft_customer_id
FOREIGN KEY(customer_id) REFERENCE customers(customer_id)
ON DELETE SET NULL;






ALTER TABLE transactions DROP FOREIGN KEY fk_customer_id;





ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id
FOREIGN KEY(customer_id) REFERENCE customers(customer_id)
ON DELETE SET NULL;





ALTER TABLE transactions DROP FOREIGN KEY fk_customer_id;





ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_id
FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE;





UPDATE transactions
SET customer_id = 4
WHERE transaction_id = 1005;

SELECT * FROM transactions;





SELECT DISTINCT first_name, last_name
FROM transactions
INNER JOIN customers
ON transactions.customer_id = customers.customer_id;





CALL get_customers();





DELIMITER $$
CREATE PROCEDURE get_customers()
BEGIN
	SELECT * FROM customers;
END $$
DELIMITER;





DROP PROCEDURE get_customers;





CALL get_customers(1);






CREATE PROCEDURE find_customer(IN id INT)
BEGIN
	SELECT *
    FROM customers
    WHERE customer_id = id;
END





DELIMITER $$
CREATE PROCEDURE find_customer(IN id INT)
BEGIN
	SELECT *
    FROM customers
    WHERE customer_id = id;
END $$
DELIMITER;





DROP PROCEDURE find_customer;





DELIMITER $$
CREATE PROCEDURE find_customer(IN f_name VARCHAR(50), IN 1_name VARCHAR(50))

BEGIN
	SELECT *
    FROM customers
    WHERE first_name = f_name AND last_name = 1_name;
END $$
DELIMITER;




CALL find_customer("Larry", "Lobster");





ALTER TABLE employees
ADD COLUMN salary DECIMAL(10, 2) AFTER hourly_pay;
SELECT * FROM employees;





UPDATE employees
SET salary = hourly_pay * 2080;
SELECT * FROM employees;




CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.salary = NEW.hourly_pay * 2080;





SHOW TRIGGERS;





UPDATE employees
SET hourly_pay = 50
WHERE employee_id = 1;
SELECT * FROM employees;





DELETE FROM employees
WHERE employee_id = 6;
SELECT * FROM employees;





CREATE TRIGGER before_hourly_pay_insert
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay * 2080);





INSERT INTO employees
VALUES (6, "Sheldon", "Plankton", 10, NULL, "janitor", "2023-01-07", 5);

SELECT * FROM employees;





CREATE TABLE expenses(
    expense_id INT PRIMARY KEY,
    expense_name VARCHAR(50),
    expense_total DECIMAL(10, 2)
);
SELECT * FROM expenses;





INSERT INTO expenses
VALUES  
    (1, "salaries", 0),
    (2, "suppliers", 0),
    (3, "taxes", 0);

SELECT * FROM expenses;





UPDATE expenses
SET expense_total = (SELECT SUM(salary) FROM employees)
WHERE expense_name = "salaries";
SELECT * FROM expenses;





CREATE TRIGGER after_salary_delete
AFTER DELETE ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total - OLD.salary
WHERE expense_name = "salaries";





CREATE TRIGGER after_salary_insert
AFTER INSERT ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total + NEW.salary
WHERE expense_name = "salaries";





INSERT INTO employees
VALUES (6, "Sheldon", "Plankton", 10, NULL, "janitor", "2023-01-07", 5);

SELECT * FROM expenses;





CREATE TRIGGER after_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total + (NEW.salary - OLD.salary)





CREATE TRIGGER after_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total + (NEW.salary - OLD.salary)
WHERE expense_name = "salaries";





UPDATE employees
SET hourly_pay = 100
WHERE employee_id = 1;
SELECT * FROM expenses;

















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































