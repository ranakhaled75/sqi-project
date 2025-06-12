# bikestore-project
## scope
 designed to manage all aspects of a bike store's operations, featuring comprehensive tables for products, customers, sales, employees, and more
- Production.Brands: stores information about brands.
- Production.Categories : stores information about product categories.
- Production.Products:  stores information about products.
- Production.Stocks :  stores information about product stock.
- Sales.Customers :  stores information about customers.
- Sales.Orders :  stores information about orders.
- Sales.OrderItems : stores information about order items.
- Sales.OrderItems :  stores information about staff members.
- Sales.Stores : stores information about stores.


## entities
Production.Brands
- brand_id (int): Unique identifier for the brand
- brand_name (varchar(255)): Name of the brand

Production.Categories
- category_id (int): Unique identifier for the category
- category_name (varchar(255)): Name of the category

Production.Products
- product_id (int): Unique identifier for the product
- product_name (varchar(255)): Name of the product
- brand_id (int): Foreign key referencing the Brands table
- category_id (int): Foreign key referencing the Categories table

Production.Stocks
- product_id (int): Foreign key referencing the Products table
- quantity (int): Quantity of the product in stock

Sales.Customers
- customer_id (int): Unique identifier for the customer
- first_name (varchar(255)): First name of the customer
- last_name (varchar(255)): Last name of the customer
- email (varchar(255)): Email address of the customer

Sales.Orders
- order_id (int): Unique identifier for the order
- customer_id (int): Foreign key referencing the Customers table
- order_date (date): Date the order was placed

Sales.OrderItems
- order_id (int): Foreign key referencing the Orders table
- product_id (int): Foreign key referencing the Products table
- quantity (int): Quantity of the product ordered

Sales.Staffs
- staff_id (int): Unique identifier for the staff member
- first_name (varchar(255)): First name of the staff member
- last_name (varchar(255)): Last name of the staff member
- email (varchar(255)): Email address of the staff member

Sales.Stores
- store_id (int): Unique identifier for the store
- store_name (varchar(255)): Name of the store

## Relationships
The entity relationship diagram below describes the relationships between entities in my database.
![image](https://github.com/user-attachments/assets/40511782-e916-42c9-aa7a-d67da80b6372)

### describe
- One customer can place many orders.
-	One staff member can handle many orders.
-	One order contains many order items.
- 	Many order items can refer to the same product.
-	Many products belong to one category.
-	Each product has stock info.
-One store can have multiple stock entries.

Usage
- Use SQL to query data
- You can use various SQL clauses to retrieve and manipulate data, including:
    - SELECT
    - JOIN
    - WHERE
    - GROUP BY
    - HAVING
    - ORDER BY
    - TOP


License
- This project is licensed under the MIT License
