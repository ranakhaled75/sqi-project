# bikestore-project
 database for a learn production and sales for bike store

Production.Brands
This table stores information about brands.

- brand_id (int): Unique identifier for the brand
- brand_name (varchar(255)): Name of the brand

Production.Categories
This table stores information about product categories.

- category_id (int): Unique identifier for the category
- category_name (varchar(255)): Name of the category

Production.Products
This table stores information about products.

- product_id (int): Unique identifier for the product
- product_name (varchar(255)): Name of the product
- brand_id (int): Foreign key referencing the Brands table
- category_id (int): Foreign key referencing the Categories table

Production.Stocks
This table stores information about product stock.

- product_id (int): Foreign key referencing the Products table
- quantity (int): Quantity of the product in stock

Sales.Customers
This table stores information about customers.

- customer_id (int): Unique identifier for the customer
- first_name (varchar(255)): First name of the customer
- last_name (varchar(255)): Last name of the customer
- email (varchar(255)): Email address of the customer

Sales.Orders
This table stores information about orders.

- order_id (int): Unique identifier for the order
- customer_id (int): Foreign key referencing the Customers table
- order_date (date): Date the order was placed

Sales.OrderItems
This table stores information about order items.

- order_id (int): Foreign key referencing the Orders table
- product_id (int): Foreign key referencing the Products table
- quantity (int): Quantity of the product ordered

Sales.Staffs
This table stores information about staff members.

- staff_id (int): Unique identifier for the staff member
- first_name (varchar(255)): First name of the staff member
- last_name (varchar(255)): Last name of the staff member
- email (varchar(255)): Email address of the staff member

Sales.Stores
This table stores information about stores.

- store_id (int): Unique identifier for the store
- store_name (varchar(255)): Name of the store

Usage
- Use SQL to query data
- Use joins , group by , having and where to display database

License
- This project is licensed under the MIT License
