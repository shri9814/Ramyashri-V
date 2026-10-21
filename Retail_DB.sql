create database Retail_Analysis;
use Retail_Analysis;
create table Customers (Customer_ID int primary key,Customer_Name varchar(100) not null,
Gender varchar(20),Age int,City varchar(50),Join_Date date);
create table Products (Product_ID int primary key,Product_Name varchar(100) not null,Category varchar(50),
Price decimal(10,2),Cost decimal(10,2));
create table Stores (Store_ID int primary key,Store_Name varchar(100) not null,
City varchar(50),Region varchar(50));
create table Orders (Order_ID int primary key,Customer_ID int not null,Store_ID int not null,
Order_Date date,Status_Bar varchar(20),foreign key (Customer_ID)
references Customers(Customer_ID),foreign key(Store_ID) references Stores(Store_ID));
create table Order_Items (Order_Item_ID int primary key,Order_ID int not null,Product_ID int not null,
Quantity int not null,Unit_Price decimal(10,2) not null,Discount_Pct decimal(5,2) default 0,
foreign key(Order_ID)references Orders(Order_ID),foreign key (Product_ID)references Products(Product_ID));
use Retail_Analysis;
Show tables;
use Retail_Analytics;
insert into Customers(Customer_ID, Customer_Name, Gender, Age, City, Join_Date)
values(1, 'Arun', 'Male', 28, 'Chennai', '2025-01-10'),
(2, 'Priya', 'Female', 32, 'Coimbatore', '2025-02-15'),
(3, 'Karthik', 'Male', 25, 'Madurai', '2025-03-20'),
(4, 'Divya', 'Female', 29, 'Theni', '2025-04-05'),
(5, 'Suresh', 'Male', 40, 'Chennai', '2025-05-12'),
(6, 'Meena', 'Female', 35, 'Salem', '2025-06-18'),
(7, 'Vijay', 'Male', 22, 'Madurai', '2025-07-25'),
(8, 'Anitha', 'Female', 31, 'Coimbatore', '2025-08-11'),
(9, 'Rahul', 'Male', 27, 'Theni', '2025-09-09'),
(10, 'Lakshmi', 'Female', 38, 'Salem', '2025-10-14');
select * from Customers;
insert into Products(Product_ID, Product_Name, Category, Price, Cost)
values(101, 'Laptop', 'Electronics', 50000, 40000),
(102, 'Mobile Phone', 'Electronics', 20000, 15000),
(103, 'Headphones', 'Electronics', 2000, 1200),
(104, 'Office Chair', 'Furniture', 5000, 3500),
(105, 'Office Table', 'Furniture', 8000, 5500),
(106, 'Notebook', 'Stationery', 100, 50),
(107, 'Pen Pack', 'Stationery', 150, 80),
(108, 'Backpack', 'Accessories', 1500, 900),
(109, 'Smart Watch', 'Electronics', 7000, 5000),
(110, 'Water Bottle', 'Accessories', 500, 250);
select * from Products;
select Product_Name,Price,Cost,
Price - Cost as Unit_Profit
from Products;
insert into Stores(Store_ID, Store_Name, City, Region)
values(1, 'Chennai Central Store', 'Chennai', 'North'),
(2, 'Coimbatore Mall Store', 'Coimbatore', 'West'),
(3, 'Madurai Main Store', 'Madurai', 'South'),
(4, 'Salem City Store', 'Salem', 'West'),
(5, 'Theni Retail Store', 'Theni', 'South');
select * from Stores;
insert into Orders(Order_ID, Customer_ID, Store_ID, Order_Date, Status_Bar)
values(1001, 1, 1, '2026-01-05', 'Completed'),
(1002, 2, 2, '2026-01-08', 'Completed'),
(1003, 3, 3, '2026-01-12', 'Completed'),
(1004, 4, 5, '2026-01-15', 'Cancelled'),
(1005, 5, 1, '2026-02-02', 'Completed'),
(1006, 6, 4, '2026-02-10', 'Completed'),
(1007, 7, 3, '2026-02-14', 'Pending'),
(1008, 8, 2, '2026-02-20', 'Completed'),
(1009, 9, 5, '2026-03-01', 'Completed'),
(1010, 10, 4, '2026-03-05', 'Completed'),
(1011, 1, 2, '2026-03-11', 'Completed'),
(1012, 3, 1, '2026-03-15', 'Cancelled'),
(1013, 5, 3, '2026-03-20', 'Completed'),
(1014, 7, 5, '2026-04-02', 'Completed'),
(1015, 9, 4, '2026-04-10', 'Pending');
select * from Orders;
select Status_Bar, count(*) as Total_Orders
from Orders group by Status_Bar;
insert into Order_Items(Order_Item_ID, Order_ID, Product_ID, Quantity, Unit_Price, Discount_Pct)
values(1, 1001, 101, 1, 50000, 5),
(2, 1001, 103, 2, 2000, 0),
(3, 1002, 102, 1, 20000, 10),
(4, 1002, 108, 2, 1500, 0),
(5, 1003, 104, 2, 5000, 5),
(6, 1004, 106, 5, 100, 0),
(7, 1005, 101, 1, 50000, 0),
(8, 1005, 109, 1, 7000, 10),
(9, 1006, 105, 1, 8000, 5),
(10, 1006, 107, 4, 150, 0),
(11, 1007, 102, 1, 20000, 0),
(12, 1008, 103, 3, 2000, 5),
(13, 1008, 110, 2, 500, 0),
(14, 1009, 108, 1, 1500, 0),
(15, 1009, 106, 10, 100, 0),
(16, 1010, 104, 1, 5000, 0),
(17, 1011, 102, 2, 20000, 5),
(18, 1011, 109, 1, 7000, 0),
(19, 1012, 101, 1, 50000, 0),
(20, 1013, 105, 2, 8000, 10),
(21, 1013, 107, 5, 150, 0),
(22, 1014, 110, 3, 500, 0),
(23, 1014, 103, 1, 2000, 0),
(24, 1015, 102, 1, 20000, 5),
(25, 1015, 108, 2, 1500, 0);
select * from Order_Items;
select count(*) as Total_Order_Items,
sum(Quantity) as Total_Quantity from Order_Items;
select c.Customer_ID,c.Customer_Name, count(o.Order_ID) as Total_Orders
from Customers c join Orders o on c.Customer_ID = o.Customer_ID
group by c.Customer_ID, c.Customer_Name
having count (o.Order_ID) > 1
order by Total_Orders desc;
select c.Customer_ID,c.Customer_Name,
cast(sum(oi.Quantity * oi.Unit_Price *(1 - oi.Discount_Pct / 100)) as decimal(12,2)) as Total_Spending
from Customers c join Orders o on c.Customer_ID = o.Customer_ID
join Order_Items oi on o.Order_ID = oi.Order_ID
where o.Status_Bar = 'Completed'
group by c.Customer_ID, c.Customer_Name
order by Total_Spending desc;
select p.Product_ID,p.Product_Name,sum(oi.Quantity) AS Total_Quantity_Sold,
round(sum(oi.Quantity * oi.Unit_Price *(1 - oi.Discount_Pct / 100)), 2) as Total_Revenue
from Products p join Order_Items oi on p.Product_ID = oi.Product_ID
join Orders o on oi.Order_ID = o.Order_ID
where o.Status_Bar = 'Completed'
group by p.Product_ID, p.Product_Name
order by Total_Revenue desc;
select date_format(o.Order_Date, '%Y-%m') as Sales_Month,
round(sum(oi.Quantity * oi.Unit_Price *(1 - oi.Discount_Pct / 100)), 2) as Monthly_Revenue
from Orders o join Order_Items oi on o.Order_ID = oi.Order_ID where o.Status_Bar = 'Completed'
group by  date_format(o.Order_Date, '%Y-%m')
order by Sales_Month;
select s.Store_Name,s.City,
round(sum(oi.Quantity * oi.Unit_Price *(1 - oi.Discount_Pct / 100)), 2) as Total_Revenue
from Stores s join Orders o on s.Store_ID = o.Store_ID
join Order_Items oi on o.Order_ID = oi.Order_ID where o.Status_Bar = 'Completed'
group by s.Store_ID, s.Store_Name, s.City
order by Total_Revenue desc;
select Status_Bar,count(Order_ID) as Total_Orders
from Orders group by Status_Bar
order by Total_Orders desc;
select
round(sum(oi.Quantity *(oi.Unit_Price * (1 - oi.Discount_Pct / 100)- p.Cost)), 2) as Total_Profit
from Orders o
join Order_Items oi on o.Order_ID = oi.Order_ID
join Products p on oi.Product_ID = p.Product_ID where o.Status_Bar = 'Completed';
select p.Product_ID,p.Product_Name,
round(sum(oi.Quantity *(oi.Unit_Price * (1 - oi.Discount_Pct / 100)- p.Cost)), 2) as Total_Profit
from Products p
join Order_Items oi on p.Product_ID = oi.Product_ID
join Orders o on oi.Order_ID = o.Order_ID where o.Status_Bar = 'Completed'
group by p.Product_ID, p.Product_Name
order by Total_Profit desc;
select s.Store_Name,s.City,
round(sum(oi.Quantity *(oi.Unit_Price * (1 - oi.Discount_Pct / 100)- p.Cost)), 2) as Total_Profit
from Stores s
join Orders o on s.Store_ID = o.Store_ID
join Order_Items oi on o.Order_ID = oi.Order_ID 
join Products p on oi.Product_ID = p.Product_ID where o.Status_Bar = 'Completed'
group by s.Store_ID, s.Store_Name, s.City
order by Total_Profit desc;
select s.City,
round(sum(oi.Quantity * oi.Unit_Price *(1 - oi.Discount_Pct / 100)), 2) as Total_Revenue
from Stores s
join Orders on s.Store_ID = o.Store_ID
join Order_Items oi on o.Order_ID = oi.Order_ID
where o.Status_Bar = 'Completed'
group by s.City
order by Total_Revenue desc;
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Order_Month,
    COUNT(Order_ID) AS Total_Orders
FROM Orders
WHERE Status_Bar = 'Completed'
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Total_Orders DESC;
SELECT
    ROUND(
        SUM(
            oi.Quantity * oi.Unit_Price *
            (1 - oi.Discount_Pct / 100)
        ) / COUNT(DISTINCT o.Order_ID),
        2
    ) AS Average_Order_Value
FROM Orders o
JOIN Order_Items oi
    ON o.Order_ID = oi.Order_ID
WHERE o.Status_Bar = 'Completed';
SELECT
    Product_ID,
    Product_Name,
    Price,
    Cost,
    ROUND(
        ((Price - Cost) / Price) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM Products
ORDER BY Profit_Margin_Percentage DESC;
