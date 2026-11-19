use shoppingdb;

select * from items;
select * from orders;
select order_date,Category  from items inner join orders on items.Item_ID =orders.Item_ID;
select Customer_Name,Quantity  from items inner join orders on items.Item_ID =orders.Item_ID;
select Item_name, Price,Category  from items inner join orders on items.Item_ID =orders.Item_ID;


-- 1. display item_id, item_name and customer_name for all matching records
select items.item_id, items.item_name, orders.customer_name
from items
inner join orders
on items.item_id = orders.item_id;


-- 2. display order_id, customer_name and item_name
select orders.order_id, orders.customer_name, items.item_name
from items
inner join orders
on items.item_id = orders.item_id;


-- 3. display all items along with their order details, including items that have never been ordered
select *
from items
left join orders
on items.item_id = orders.item_id;


-- 4. display all orders along with their corresponding item names
select orders.*, items.item_name
from orders
inner join items
on orders.item_id = items.item_id;


-- 5. display all possible combinations of items and orders
select *
from items
cross join orders;


-- 6. display item_name, category, customer_name and quantity
select items.item_name, items.category,
       orders.customer_name, orders.quantity
from items
inner join orders
on items.item_id = orders.item_id;


-- 7. display all items and their corresponding order_id
select items.item_name, orders.order_id
from items
left join orders
on items.item_id = orders.item_id;


-- 8. display all orders with item_name and price
select orders.*, items.item_name, items.price
from orders
inner join items
on orders.item_id = items.item_id;


-- 9. display all items, even if no customer has ordered them
select items.*
from items
left join orders
on items.item_id = orders.item_id;


-- 10. display all customers who have ordered products
select distinct orders.customer_name
from orders
inner join items
on orders.item_id = items.item_id;


-- 11. display item_name, customer_name and order_date
select items.item_name, orders.customer_name, orders.order_date
from items
inner join orders
on items.item_id = orders.item_id;


-- 12. display order_id, item_name, price, quantity and customer_name
select orders.order_id, items.item_name, items.price,
       orders.quantity, orders.customer_name
from items
inner join orders
on items.item_id = orders.item_id;


-- 13. display all items with their matching orders, including items with no matching orders
select *
from items
left join orders
on items.item_id = orders.item_id;


-- 14. display all orders with their matching item details
select *
from orders
inner join items
on orders.item_id = items.item_id;