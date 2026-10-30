use analytics_db;

#Display All Tables
show tables;

##---------------Data Exploration----------------------
# Check the data is present or not
select * from zepto_data_analysis;

#Check the rows
select count(Category) from zepto_data_analysis;

#Check the NULL Values
select * from zepto_data_analysis 
where name is null 
or 
 mrp is null 
or 
 discountPercent is null 
or 
availableQuantity is null 
or
weightInGms is null
or 
outOfStock is null
or 
quantity is null;

select count(*) as Total_Null_Values from zepto_data_analysis
where name is null

#Display different unique Categories
select distinct Category from zepto_data_analysis
order by Category desc;

#Display Instock and OutofsTock
select outOfStock, count(Category) as "Status" 
from zepto_data_analysis
group by outOfStock;

#Product Names which are present more than once in data
select name as "Product", count(quantity) as "Total_Quantity"
from zepto_data_analysis
group by Product
having Total_Quantity>1
order by Total_Quantity desc;

##-------------------Data Cleaning------------------------
#Display products with price=0
select * from zepto_data_analysis
where discountedSellingPrice=0;

delete from zepto_data_analysis
where discountedSellingPrice=0;

#Convert paise into Rupees
update zepto_data_analysis 
set mrp=mrp/100.0, discountedSellingPrice=discountedSellingPrice/100.0;


##-------------------Data Analysis-----------------------
#What are the Top 10 Best Products
select distinct name as "Product", mrp,sum(discountPercent) as "Highest_Discount_Price" from zepto_data_analysis 
group by Product, mrp
order by sum(discountPercent) desc limit 10;

#What are the products with High MRP but Out of Stock
select distinct name as "Product", mrp as "Highest_MRP"
from zepto_data_analysis
where outOfStock='TRUE' and mrp>300
order by mrp desc;

#Calculate Estimated Revenue for each Category
select Category, sum(discountedSellingPrice*availableQuantity) as "Total Revenue"
from zepto_data_analysis
group by Category;

#What are the Prodcuts which MRP is greater than 500 and discount is less than 10%
select distinct name as 'Products', mrp
from zepto_data_analysis
where mrp>500 and discountPercent<10
order by mrp desc;

#Identify top 5 Categories which gives higest average discount
select Category, round(avg(discountPercent),2) as 'Highest_Avg_Discount'
from zepto_data_analysis
group by Category
order by Highest_Avg_Discount desc limit 5;

#Find price per gram for products above 100g and sort by best value.
select distinct Category, round(discountedSellingPrice/weightInGms,2) as 'Price_Per_Gram'
from zepto_data_analysis
where weightInGms>100
order by Price_Per_Gram desc;

#Group the Products into Categories like Low, Medium, Bulk
select distinct name as 'Products', weightInGms, 
case when weightInGms<=1000 then 'Low'
	when weightInGms<=6000 then 'Medium'
    else 'Bulk' end as 'Categories'
from zepto_data_analysis;

#What is the Total Inventory Weight per Category
select distinct Category, sum(weightInGms*availableQuantity) as "Total_Weight"
from zepto_data_analysis
group by Category;




