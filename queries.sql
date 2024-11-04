select * from customers_table;
select * from product_table;
select * from sales_table;
select * from store_table;
# 1. Find total quantity sold for each product
select p."Product Name", SUM(s.Quantity) as Total_Quantity
from sales_table as s
join product_table as p on s.ProductKey = p.ProductKey
group by p."Product Name";
# 2. the most sold product in each store
select st.Country, st.State, p."Product Name", MAX(s.Quantity) as Most_Sold
from sales_table as s
join store_table as st on s.StoreKey = st.StoreKey
join product_table as p ON s.ProductKey = p.ProductKey
group by st.Country, st.State, p."Product Name"
order by Most_Sold desc;
# 3. the stores with the highest number of products sold
select st.Country, st.State, SUM(s.Quantity) AS Total_Products_Sold
from sales_table as s
join store_table as st on s.StoreKey = st.StoreKey
group by st.Country, st.State
order by Total_Products_Sold desc;
# 4. Total Quantity Sold for Each Product by Country
SELECT p."Product Name", st.Country, SUM(s.Quantity) AS total_quantity_sold
FROM sales_table as s
JOIN product_table as p ON s.ProductKey = p.ProductKey
JOIN store_table as st ON s.StoreKey = st.StoreKey
GROUP BY p."Product Name", st.Country;
#  5. All Products Sold by a Specific Store (e.g., StoreKey = 1)
SELECT p."Product Name", s.Quantity
FROM sales_table as s
JOIN product_table as p ON s.ProductKey = p.ProductKey
WHERE s.StoreKey = 1;
#  6. All Orders Made by Customers in a Specific Country (e.g., Australia)
SELECT s.*, c.Name, st.Country
FROM sales_table as s
JOIN customers_table as c ON s.CustomerKey = c.CustomerKey
JOIN store_table as st ON s.StoreKey = st.StoreKey
WHERE st.Country = 'Australia';
# 7. Average Order Quantity by Category
SELECT p.Category, AVG(s.Quantity) AS AverageQuantity
FROM sales_table s
JOIN product_table p ON s.ProductKey = p.ProductKey
GROUP BY p.Category;
# 8. Maximum Quantity Sold for Products in Each Category
SELECT p.Category, MAX(s.Quantity) AS MaxQuantitySold
FROM sales_table s
JOIN product_table p ON s.ProductKey = p.ProductKey
GROUP BY p.Category;
# 9. Number of Distinct Products Sold per Category
SELECT p.Category, COUNT(DISTINCT s.ProductKey) AS DistinctProductsSold
FROM sales_table s
JOIN product_table p ON s.ProductKey = p.ProductKey
GROUP BY p.Category;
# 10. Total Quantity Sold per Product Category
SELECT p.Category, SUM(s.Quantity) AS TotalQuantitySold
FROM sales_table s
JOIN product_table p ON s.ProductKey = p.ProductKey
GROUP BY p.Category;
















