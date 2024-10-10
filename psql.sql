INSERT INTO Companies (company_name) VALUES ('Company Name');
INSERT INTO Categories (category_name) VALUES ('Apple');
INSERT INTO Products (company_id, company_name, price, description, active) VALUES (2, 'Apple', 100, 'Product Description', true);
INSERT INTO Warranties (product_id, warranty_months) VALUES (1, '12');
INSERT INTO ProductsCategoriesXref (product_id, category_id) VALUES (4, 2);

SELECT * FROM Companies;
SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Warranties;
SELECT * FROM Products WHERE active = true;
SELECT * FROM Products WHERE company_id = 1;
SELECT * FROM Companies WHERE company_id = 1;
SELECT * FROM Categories WHERE category_id = 1;
SELECT p.*, w.*, c.* FROM Products p JOIN Warranties w ON p.product_id = w.product_id JOIN ProductsCategoriesXref x ON p.product_id = x.product_id JOIN Categories c ON x.category_id = c.category_id WHERE p.product_id = 4;
SELECT * FROM Warranties WHERE warranty_id = 1;

UPDATE Companies SET company_name = 'New Company Name' WHERE company_id = 1;
UPDATE Categories SET category_name = 'New Category Name' WHERE category_id = 1;
UPDATE Products SET price = 10.99 WHERE product_id = 1;
UPDATE Warranties SET warranty_months = '24' WHERE warranty_id = 1;
UPDATE ProductsCategoriesXref SET category_id = 2 WHERE product_id = 1 AND category_id = 1;

DELETE FROM Products WHERE product_id = 2;
DELETE FROM Categories WHERE category_id = 2; 
DELETE FROM Companies WHERE company_id = 1;
DELETE FROM ProductsCategoriesXref;
DELETE FROM Warranties WHERE warranty_id = 1;


CREATE TABLE Companies (
  company_id SERIAL PRIMARY KEY,
  company_name VARCHAR UNIQUE NOT NULL
);

CREATE TABLE Categories (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR UNIQUE NOT NULL
);

CREATE TABLE Products (
  product_id SERIAL PRIMARY KEY,
  company_id INTEGER REFERENCES Companies(company_id) ON DELETE CASCADE,
  company_name VARCHAR NOT NULL,
  price INTEGER,
  description VARCHAR,
  active BOOLEAN DEFAULT true
);

CREATE TABLE ProductsCategoriesXref (
  product_id INTEGER REFERENCES Products(product_id) ON DELETE CASCADE,
  category_id INTEGER REFERENCES Categories(category_id) ON DELETE CASCADE,
  PRIMARY KEY (product_id, category_id)
);

CREATE TABLE Warranties (
  warranty_id SERIAL PRIMARY KEY,
  product_id INTEGER REFERENCES Products(product_id) ON DELETE CASCADE,
  warranty_months VARCHAR NOT NULL
);