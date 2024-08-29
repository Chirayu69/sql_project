-- 1) retrive the total number of orders placed 

select count(order_id) as total_orders from order_details;

-- 2) calculate the total revenue generated from pizza sales 

select sum(order_details.quantity * pizzas.price ) as total_reveue
from order_details join pizzas
on pizzas.pizza_id = order_details.pizza_id;

-- 3) identify the highest prized pizza

select pizza_types.name , pizzas.price
from pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- 4) identify the most common pizza size ordered

select pizzas.size , count(order_details.order_details_id) as count
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizzas.size order by count desc;

-- 5) list the top 5 most ordered pizza types along with their quantities 

select pizza_types.name ,
sum(order_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by quantity desc limit 5;