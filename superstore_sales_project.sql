create database superstore_db;
use superstore_db;
create table superstore( 
Row_ID INT,
Order_ID varchar(50),
Order_Date DATE ,
Ship_Date DATE,
Ship_Mode varchar(50),
Customer_ID varchar(50),
Customer_Name Varchar(100),
Segment varchar(50),
Country varchar(100),
City varchar(100),
State varchar(100),
Postel_code varchar(20),
Region varchar(50),
Product_ID varchar(50),
Category varchar(50),
Sub_category varchar(50),
Product_name varchar(255),
Sales decimal (12,2),
Qunatity int,
Discount decimal(5,2),
Profit decimal (12,2)
);
show tables;
select count(*) from superstore;
select count(*) as total_rows from superstore;
select * from superstore limit 9994;
describe superstore;
select sum(Sales) as Total_sales from superstore;
select sum(Profit) as Total_profit from superstore; -- sales & profit by category--
select 
Category, 
sum(Sales) as Total_Sales, 
sum(Profit) as Total_Profit
From superstore
group by Category
order by Total_Sales desc;
-- sales& profit by regions
select 
Region,
sum(Sales) as Total_sales,
sum(Profit) as Total_Profit
from superstore
group by Region
order by Total_Sales desc;
-- sales& profit by customer segments--
select 
Segment,
sum(Sales) as Total_sales,
sum(Profit) as Total_Profit
from superstore
group by Segment
order by Total_Sales Desc;   
--top10 products by sales--
select 
Product_Name,
sum(Sales) as Total_sales,
sum(Profit) as Total_Profit
from superstore
group by Product_Name
order by Total_Sales desc
limit 10;
-- top 10 product by profit--
select 
Product_Name,
sum(Sales) as Total_sales,
sum(Profit) as Total_Profit
from superstore
group by Product_Name
order by Total_Profit desc
limit 10;
-- most loss-making products--
select 
Product_Name,
sum(Sales) as Total_sales,
sum(Profit) as Total_Profit
from superstore
group by Product_Name
order by Total_Sales asc
limit 10; 
-- yearly sales & profit--
select
year(Order_Date) as Year,
sum(Sales) as Total_Sales,
sum(Profit) as Total_Profit
from superstore
group by Year (Order_Date)
order by Year;
-- monthly sales & profit
select 
year(Order_Date) as Year,
month(Order_Date) as month,
sum(Sales) as Total_Sales,
sum(Profit) as Total_Profit
from superstore 
group by year (Order_Date),
month(Order_Date)
order by Year, month; 
-- average discount by category--
select
Category,
round(avg(Discount),2) as Average_Discount,
sum(Sales) as Total_Sales,
sum(Profit) as Total_Profit
from superstore 
group by Category
order by Average_Discount desc;

