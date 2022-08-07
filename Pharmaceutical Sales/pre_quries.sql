SELECT * FROM transactions;

update transactions set sales_amount = (sales_amount * 80)  where currency = 'USD';
select distinct currency from transactions;
update transactions set currency = 'INR';

/* Adding Zone column */
Alter table transactions add column zone varchar (20);
/* Naming the zones */
update transactions set zone = 'Bihar' where market_code in ('Mark001','Mark002', 'Mark003', 'Mark004', 'Mark011');
update transactions set zone = 'Jharkhand' where market_code in ('Mark007','Mark009','Mark010','Mark014');
update transactions set zone = 'West_Bengal' where market_code in ('Mark005','Mark012','Mark015');
update transactions set zone = 'UP' where market_code in ('Mark006','Mark008','Mark013');

/* CHeck distinct zones */
select distinct zone from transactions;

/* Adding the column 'unit_prod_price' specificaly after 'sales_qty'.*/
alter table transactions add column unit_prod_price integer after sales_qty;

/* Selecting top 50 products by total sales amount*/
select product_code, sum(sales_amount) from transactions group by product_code order by sum(sales_amount) desc limit 50;

/* Selecting the top zones by sum of sales amount */
select zone, sum(sales_amount) from transactions group by zone order by sum(sales_amount) desc;

Select * from transactions;

/* Add column 'market_name' after market_code */
alter table transactions add column market_name varchar(20) after market_code;
/* Adding market nmaes W.R.T. market codes */
update transactions set market_name = 'Darbhanga' where market_code = 'Mark001';
update transactions set market_name = 'Patna' where market_code = 'Mark002';
update transactions set market_name = 'Bhagalpur' where market_code = 'Mark003';
update transactions set market_name = 'Muzaffarpur' where market_code = 'Mark004';
update transactions set market_name = 'Purnia' where market_code = 'Mark011';
update transactions set market_name = 'Dhanbad' where market_code = 'Mark007';
update transactions set market_name = 'Hazaribag' where market_code = 'Mark009';
update transactions set market_name = 'Ranchi' where market_code = 'Mark010';
update transactions set market_name = 'Jamshedpur' where market_code = 'Mark014';
update transactions set market_name = 'Siliguri' where market_code = 'Mark005';
update transactions set market_name = 'Durgapur' where market_code = 'Mark012';
update transactions set market_name = 'Kolkata' where market_code = 'Mark015';
update transactions set market_name = 'Gorakhpur' where market_code = 'Mark006';
update transactions set market_name = 'Lucknow' where market_code = 'Mark008';
update transactions set market_name = 'Bareilly' where market_code = 'Mark013';

/* Check if market names are distinctly 15 or not. */
Select count(distinct market_name) from transactions;

/* Select the sum of sales quantity and sum of sales amount for each product */

select product_code, sum(sales_qty), sum(sales_amount) from transactions group by product_code order by product_code desc;

select * from transactions;
select product_code, sum(sales_amount)/sum(sales_qty) from transactions group by product_code;

/* Creating a table out of the output */
create table unit_pp as (select product_code, sum(sales_amount)/sum(sales_qty) as unitpp from transactions group by product_code);
select * from unit_pp;


/* Making new table with unit_PP */
select * from transactions
join unit_pp
on transactions.product_code = unit_pp.product_code
where transactions.product_code = unit_pp.product_code;

select * from transactions;
create table new_transactions as (
select unit_pp.product_code,customer_code, market_code, market_name, order_date, sales_qty, unit_pp.unitpp, sales_amount, currency, zone
from transactions
join unit_pp
on transactions.product_code = unit_pp.product_code
where transactions.product_code = unit_pp.product_code);

select * from new_transactions;
select * from transactions;

select product_code, sum(sales_amount), sum(sales_qty), unitpp from new_transactions where product_code = 'Prod318';

select product_code, sum(sales_amount), sum(sales_qty), unitpp from new_transactions group by product_code;
