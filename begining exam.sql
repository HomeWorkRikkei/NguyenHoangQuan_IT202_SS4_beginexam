create database ShopManager;
use ShopManager;

create table Categories (
	category_id varchar(10) primary key,
    category_name varchar (255) not null unique
);

create table Products (
	product_id varchar(10) primary key,
    product_name varchar(255) not null unique,
    price decimal(18,2),
    stock int check(stock>=0),
    category_id varchar(10), foreign key (category_id) references Categories(category_id)
);

insert into Categories
value (1,'Điện tử'),(2,'Thời trang');

insert into Products
value (1,'iPhone 15',25000000,10,1),(2,'Samsung S23',20000000,5,1),(3,'Áo sơ mi nam',500000,50,2),(4,'Giày thể thao',1200000,20,2);

update Products
set price = 26000000
where product_name = 'iPhone 15';

SET SQL_SAFE_UPDATES = 0;
update Products
set stock = 10
where category_id = 1;
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
delete from Products
where product_id = 4;

delete from Products
where price < 1000000;
SET SQL_SAFE_UPDATES = 1;

select * from Products;
select * from Products where stock>15;