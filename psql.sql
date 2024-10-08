INSERT INTO Companies (company_name) VALUES ('Company Name');
INSERT INTO Categories (category_name) VALUES ('Category Name');
INSERT INTO Products (company_id, company_name, price, description, active) VALUES ('company_id', 'Company Name', 100, 'Product Description', true);
INSERT INTO Warranties (product_id, warranty_months) VALUES (product_id, '12');
INSERT INTO ProductsCategoriesXref (product_id, category_id) VALUES (product_id, category_id);

SELECT * FROM Companies;
SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Warranties;
SELECT * FROM Products WHERE active = true;
SELECT * FROM Products WHERE company_id = company_id;
SELECT * FROM Companies WHERE company_id = company_id;
SELECT * FROM Categories WHERE category_id = category_id;
SELECT p.*, w.*, c.* FROM Products p JOIN Warranties w ON p.product_id = w.product_id JOIN ProductsCategoriesXref x ON p.product_id = x.product_id JOIN Categories c ON x.category_id = c.category_id WHERE p.product_id = product_id;
SELECT * FROM Warranties WHERE warranty_id = warranty_id;

UPDATE Companies SET company_name = 'New Company Name' WHERE company_id = company_id;
UPDATE Categories SET category_name = 'New Category Name' WHERE category_id = category_id;
UPDATE Products SET price = price WHERE product_id = product_id;
UPDATE Warranties SET warranty_months = '24' WHERE warranty_id = warranty_id;
UPDATE ProductsCategoriesXref SET category_id = category_id WHERE product_id = product_id AND category_id = category_id;

DELETE FROM Products WHERE product_id = product_id;
DELETE FROM Categories WHERE category_id = category_id; 
DELETE FROM Companies WHERE company_id = company_id;


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
  company_id INTEGER REFERENCES Companies(company_id),
  company_name VARCHAR NOT NULL,
  price INTEGER,
  description VARCHAR,
  active BOOLEAN DEFAULT true
);

CREATE TABLE ProductsCategoriesXref (
  product_id INTEGER REFERENCES Products(product_id),
  category_id INTEGER REFERENCES Categories(category_id),
  PRIMARY KEY (product_id, category_id)
);

CREATE TABLE Warranties (
  warranty_id SERIAL PRIMARY KEY,
  product_id INTEGER REFERENCES Products(product_id),
  warranty_months VARCHAR NOT NULL
);