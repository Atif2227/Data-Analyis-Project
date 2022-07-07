/* Creating Customer Table */

create table customers as (
select customer_code, market_code, market_name, zone 
from transactions group by customer_code);

create table customers
(
  customer_code varchar(100) not null,
  market_code varchar(100) not null,
  market_name varchar(100) not null,
  zone varchar(100) not null,
  primary key (customer_code)
);

insert into customers (customer_code, market_code,market_name,zone)
  select distinct customer_code, market_code,market_name,zone
  from transactions;
  
select * from customers order by customer_code;

/*----------------------------------------------------------------------------------------------*/
/* Creating Markets Table */
create table markets as (
select distinct market_code, market_name, zone from transactions order by market_code);
    
/*---------------------------------------------------------------------------------------------*/
/* Creating Products Table */
Create table products as(
select distinct product_code, product_type from transactions order by product_code
);

/*---------------------------------------------------------------------------------------------*/
/* Creating UPC Table */
Create table upc as(
select distinct product_code, upc from transactions order by product_code
);

