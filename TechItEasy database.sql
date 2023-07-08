DROP TABLE IF EXISTS products, televisions, remote_controlers, ci_modules, wall_brackets, users;

 CREATE TABLE televisions (
	 id INT GENERATED ALWAYS AS IDENTITY,
 	 tv_size FLOAT NOT NULL,
	 color VARCHAR(25) NOT NULL,
	 PRIMARY KEY (id)
 );
 
 CREATE TABLE remote_controlers (
	 id INT GENERATED ALWAYS AS IDENTITY,
	 color VARCHAR(25),
	 PRIMARY KEY (id)
 );
 
 CREATE TABLE ci_modules (
	 id INT GENERATED ALWAYS AS IDENTITY,
	 provider VARCHAR(50) NOT NULL,
	 PRIMARY KEY (id)
 );
 
 CREATE TABLE wall_brackets (
	 id INT GENERATED ALWAYS AS IDENTITY,
	 wall_bracket_size VARCHAR NOT NULL,
	 PRIMARY KEY (id)
 );

 CREATE TABLE products (
	 id INT GENERATED ALWAYS AS IDENTITY,
	 brand VARCHAR(25) NOT NULL,
	 product_type VARCHAR(50) NOT NULL UNIQUE,
	 stock INT DEFAULT 0, 
	 remote_controler_id INT NOT NULL,
	 ci_module_id INT NOT NULL,
	 wall_bracket_id INT NOT NULL,
	 PRIMARY KEY (id),
	 CONSTRAINT fk_remote_controler_id FOREIGN KEY (remote_controler_id) REFERENCES remote_controlers(ID),
	 CONSTRAINT fk_ci_module_id FOREIGN KEY (ci_module_id) REFERENCES ci_modules(ID),
	 CONSTRAINT fk_wall_bracket_id FOREIGN KEY (wall_bracket_id) REFERENCES wall_brackets(ID)
 );
 
 CREATE TABLE users (
	 id INT GENERATED ALWAYS AS IDENTITY,
	 front_name VARCHAR(25) NOT NULL,
	 last_name VARCHAR(25) NOT NULL,
	 gender CHAR(1),
	 user_function VARCHAR(50) NOT NULL,
	 PRIMARY KEY (id)
 );
 
 INSERT INTO remote_controlers (color) 
 VALUES 
 ('Black'),
 ('Black'),
 ('Gray');
 
 INSERT INTO ci_modules (provider)
 VALUES 
 ('Kpn'),
 ('Ziggo'),
 ('T-Mobile');
 
 INSERT INTO wall_brackets (wall_bracket_size)
 VALUES
 ('10,0 t/m 20,0 cm'),
 ('20 t/m 30 cm'),
 ('30 t/m 40 cm');
 
 INSERT INTO products (brand, product_type, stock, remote_controler_id, ci_module_id, wall_bracket_id)
 VALUES 
 ('Samsung', 'SKB-12.16', 4, 1, 1, 1),
 ('Sony', 'LED-2551/2', 2, 2, 2, 2),
 ('Philips', '55643/LED', 3, 3, 3, 3),
 ('Samsung', 'FFD-17.21', 7, 1, 1, 3);
 
 INSERT INTO users (front_name, last_name, gender, user_function)
 VALUES
 ('Hella', 'Langevelden', 'F', 'Administratie'),
 ('Paulus', 'Langevelden', 'M', 'Verkoop verantwoordelijke'),
 ('Robin', 'Langevelden', 'X', 'Magazijn verantwoordelijke');
 
 SELECT * FROM wall_brackets;
 
 SELECT * FROM ci_modules WHERE ci_modules.provider = 'Kpn';

 SELECT * FROM remote_controlers JOIN products ON remote_controlers.id = products.remote_controler_id WHERE remote_controlers.id = 1; 
 


 
 