use BikeStores
----Display all data on the tables
select * from production.brands 
select * from production.categories 
select * from production.products 
select * from production.stocks

select * from sales.customers 
select * from sales.order_items
select * from sales.orders
select * from sales.stores
select * from sales.staffs

-- the bike is most expensive and the motive behind pricing this bike at the high price
select top(1) product_name , list_price
from production.products p
order by 2 desc

--How many total customers does BikeStore have?
select COUNT( customer_id) as num_customers
from sales.customers

---- Would you consider people with order status 3 as customers substantiate your answer?
select COUNT( distinct customer_id) as num_customers
from sales.orders
where  order_status =3

--- How many stores does BikeStore have?
select COUNT(store_id) num_stores
from sales.stores 
----What is the total price spent per order?
select  order_id , sum([list_price] *[quantity]*(1-[discount])) as total_price
from sales.order_items 
group by order_id 
--- What’s the sales/revenue per store
select store_id , sum(list_price * quantity *(1-[discount])) as Sales_revenue
from sales.order_items i inner join sales.orders o
on o.order_id = i.order_id 
group by store_id 
order by 1

------Which category is most sold?
select top(1) category_id , sum(quantity ) as sum_sold
from production.products P inner join sales.order_items I
on p.product_id = I.product_id
group by category_id 
order by 2 desc

--- Which category rejected more orders(3= Rejected)
 select top(1) category_name , COUNT(c.category_id) most_rejected
 from production.products P inner join  sales.order_items I
 on P.product_id =I.product_id
inner join sales.orders O
on I.order_id = o.order_id
inner join production.categories  C
on C.category_id =p.category_id
and order_status =3
group by category_name , order_status 
order by 2 desc

---Which bike is the least sold?
select top(1) product_name , sum(quantity) as sum_sold
from production.products P inner join sales.order_items I
on P.product_id = I.product_id
group by product_name
order by 2 

---- What’s the full name of a customer with ID 259?
select c.customer_id , CONCAT(c.first_name ,' ',c.last_name) as full_name 
from sales.customers C
where customer_id = 259

---- What did the customer on question 9 buy and when? What’s the status ofthis order?

select customer_id ,product_name, required_date  , order_status
from sales.orders O inner join sales.order_items I
on O.order_id=I.order_id AND customer_id = 259
inner join production.products P 
on p.product_id = i.product_id


----Which staff processed the order of customer 259? And from which store?
select customer_id  ,staff_id , store_name
from sales.orders O
inner join sales.order_items I 
on i.order_id =o.order_id
inner join sales.stores S
on s.store_id=o.store_id
and  customer_id = 259 
----How many staff does BikeStore have?
select count(distinct staff_id) num_staff
from sales.orders

--- Who seems to be the lead Staff atBikeStore?
select  staff_id , CONCAT(first_name ,' ',last_name) as full_name 
from sales.staffs
where manager_id  is null
-----Which brand is the most liked?
select top(1) b.brand_name , count( order_id) as count_orders
from production.brands B inner join production.products P
on  B.brand_id = P.brand_id 
inner join sales.order_items I
on P.product_id =i.product_id
group by b.brand_name
order by 2 desc

-----How many categories does BikeStore have
select COUNT (distinct category_id) as num_categories
from production.categories

----which category is the leastliked?
select top(1) C.category_name , count( order_id) as count_orders 
from production.categories C inner join production.products P
on  C.category_id= P.category_id
inner join sales.order_items I
on P.product_id =i.product_id
group by category_name
order by 2

--- Which store still have more products of the most liked brand?
select TOP(1)b.brand_name , store_name, sum( quantity) as count_stocks 
from production.brands B inner join production.products P
on  B.brand_id = P.brand_id 
inner join production.stocks ST
on ST.product_id =P.product_id and brand_name ='Electra'
inner join sales.stores S
on s.store_id =st.store_id
group by brand_name , store_name 
order by 3  desc 

----16) Which state is doing better in terms of sales?
select top(1) c.state , sum(list_price * quantity *(1-[discount])) as Sales_revenue
from sales.customers C inner join sales.orders O
on  C.customer_id = O.customer_id 
inner join sales.order_items i
on o.order_id =i.order_id
group by state
order by 2 desc

----What’s the discounted price of product id 259?
select product_id, list_price -(discount* list_price) as discounted_price  from sales.order_items 
where product_id =  259


-----18) What’s the product name, quantity, price, category, model year and brandname of product number 44?
select P.product_id ,product_name, sum( quantity) as sum_quantity,p.list_price, category_id, model_year , brand_name  from 
production.products P inner join production.stocks ST
on ST.product_id =P.product_id
inner join production.brands b
on b.brand_id = p.brand_id
and p.product_id =  44
group by product_name ,p.product_id ,p.list_price, category_id, model_year , brand_name

----19) What’s the zip code of CA?
select distinct zip_code , state 
from sales.customers 
where state = 'CA'

--20) How many states does BikeStore operate in?
select count( distinct state) num_states
from sales.customers

----How many bikes under the children category were sold in the last 8 onths?
--Children Bicycles
select category_name , order_date
from production.categories C inner join production.products P
on C.category_id =P.category_id and category_name = 'Children Bicycles'
inner join sales.order_items I 
on P.product_id = i.product_id
inner join sales.orders O
on I.order_id =O.order_id
and order_date >= DATEADD(MONTH, -8, '2018-12-28')

-----22) What’s the shipped date for the order from customer 523
select customer_id , shipped_date
from sales.orders
  where customer_id = 523
---23) How many orders are still pending?
select COUNT(order_id) 'num_pended orders'
from sales.orders
where order_status =1

---What’s the names of category and brand does "Electra white water 3i -2018" fall under?
select brand_name,category_name , product_name
from
production.products P inner join production.brands B
on P.brand_id = B.brand_id
and product_name='Electra White Water 3i - 2018'
inner join production.categories C
on C.category_id = P.category_id
