create database god;
use god;
select * from pizzas;
select * from pizza_types;
create table pizza_orders (order_id int primary key not null , order_date date not null , order_time time not null);
create table order_details (order_details_id int not null primary key , order_id int not null , pizza_id text not null , quantity int not null);