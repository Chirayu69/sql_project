-- 1) join the necessary tables to find the total quantity of each pizza category ordered

select pizza_types.category , 
sum(order_details.quantity) as quantity
from pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category order by quantity desc;

-- 2) determine the distribution of orders by hour of the day 

select hour(order_time) as hour , count(order_id) as ordercount from pizza_orders group by hour(order_time);

-- 3) join the relevent tables to find the category wise distribution of pizzas

select category , count(name) from pizza_types group by category;

-- 4) group the orders by date and calculate the average number of pizzas ordered per day 

select round(avg(quantity),0) from 
(select pizza_orders.order_date, sum(order_details.quantity) as quantity 
from pizza_orders join order_details
on pizza_orders.order_id = order_details.order_id
group by pizza_orders.order_date) as order_quantity;

-- 5) determine the top 3 most ordered pizza types based on revenue 

select pizza_types.name, 
sum(order_details.quantity * pizzas.price) as revenue 
from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details 
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by revenue desc limit 3;
