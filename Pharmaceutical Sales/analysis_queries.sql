/* Calculate net profit */
Select sum(sales_amount)as Tot_Sales_Amount,
round(sum(upc)::numeric, 2) as Tot_Unit_Cost, 
round(sum(sales_amount)-sum(sales_qty*upc)::numeric, 2) as Net_Profit 
from transactions;

/* Select top product w.r.t. sales amount */
select product_code, 
sum(sales_amount)as tot_sales_amount
from transactions 
group by product_code 
order by sum(sales_amount) desc;

/* Which product type has the highest sales */
select product_type,
sum(sales_amount)as tot_sales_amount 
from transactions 
group by product_type 
order by sum(sales_amount) desc;

/* Which product type has the highest net profit */
select product_type,
round(sum(net_profit)::numeric,2)as tot_net_profit 
from transactions 
group by product_type 
order by sum(net_profit) desc;