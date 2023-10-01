create database ShopManagement;
use ShopManagement;
create table Categories(
	CatalogId int primary key auto_increment,
    CatalogName varchar(100) not null unique,
    Priority int,
    CatalogStatus bit default 1
);
create table Product(
	ProductId varchar(5) primary key,
    ProductName varchar(100) not null unique,
    Price float check(price > 0),
    CreateDate date default(curdate()),
    Quantity int default 0,
    View int default 0,
    CatalogId int,
    ProductStatus bit default 1,
    foreign key(CatalogId) references Categories(CatalogId)
);
-- 
delimiter //
create procedure get_all_data_catalog()
begin
	select * from Categories ;
end //
delimiter ;
-- 
delimiter //
create procedure sort_priority()
begin
	select * 
    from Categories
    order by Priority asc ;
end //
delimiter ;
-- 
delimiter //
-- drop procedure if exists insert_new_catalog;
create procedure insert_new_catalog(
	catalog_name varchar(100),
    catalog_priority int,
    catalog_status bit
)
begin
	insert into Categories(CatalogName,Priority,CatalogStatus)
    values(catalog_name,catalog_priority,catalog_status);
end //
delimiter ;
-- 
delimiter //
create procedure update_catalog(
	catalog_id int,
    catalog_name varchar(100),
    catalog_priority int,
    catalog_status bit
)
begin
	update Categories
    set CatalogName = Catalog_Name,
		Priority = catalog_priority,
        CatalogStatus = catalog_status
	where CatalogId = catalog_id ;
end //
delimiter ;
-- 
delimiter //
create procedure delete_catalog(
	catalog_id int
)
begin
	delete from Categories
	where CatalogId = catalog_id ;
end //
delimiter ;
-- 
delimiter //
create procedure get_catalog_id(
	catalog_id int
)
begin
	select * from Categories
	where CatalogId = catalog_id ;
end //
delimiter ;
-- 
delimiter //
create procedure get_catalog_name(
	catalog_name varchar(100)
)
begin
	declare name_search varchar(102);
    set name_search = concat("%",catalog_name,"%");
    select *
    from Categories
    where CatalogName like name_search ;
end //
delimiter ;
-- 
delimiter //
-- drop procedure if exists search_catalog_from_name;
create procedure search_catalog_from_name(
	catalog_name varchar(100)
)
begin
	declare name_search varchar(102);
    set name_search = concat("%",catalog_name,"%");
    select *
    from Categories
    where CatalogName like name_search ;
end //
delimiter ;
-- 
delimiter //
create procedure update_status_catalog(
	catalog_id int,
    catalog_status bit
)
begin
	update Categories
    set CatalogStatus = catalog_status
	where CatalogId = catalog_id ;
end //
delimiter ;
-- end categories

-- 
delimiter //
create procedure get_all_data_product()
begin
	select * from Product ;
end //
delimiter ;
-- 
delimiter //
create procedure sort_product_from_price_desc()
begin
	select * from Product 
    order by price desc;
end //
delimiter ;
-- 
delimiter //
create procedure insert_new_product(
	product_id varchar(5),
	product_name varchar(100),
    product_price float,
    product_create date,
    product_quantity int,
    product_view int,
    catalog_id int,
    product_status bit
)
begin
	insert into product
    values(product_id,product_name,product_price,product_create,
    product_quantity,product_view,catalog_id,product_status);
end //
delimiter ;
-- 
delimiter //
create procedure update_product(
	product_id varchar(5),
	product_name varchar(100),
    product_price float,
    product_create date,
    product_quantity int,
    product_view int,
    catalog_id int,
    product_status bit
)
begin
	update Product
    set ProductName = product_name,
		Price = product_price,
        CreateDate = product_create,
        Quantity = product_quantity,
        View = product_view,
        CatalogId = catalog_id,
		ProductStatus = product_status
	where ProductId = product_id ;
end //
delimiter ;
-- 
delimiter //
create procedure update_status_product(
	product_id varchar(5),
    product_status bit
)
begin
	update Product
    set ProductStatus = product_status
	where ProductId = product_id ;
end //
delimiter ;
-- 
delimiter //
create procedure delete_product(
	product_id int
)
begin
	delete from Product
	where ProductId = product_id ;
end //
delimiter ;
-- 
delimiter //
create procedure search_product_from_name(
	product_name varchar(100)
)
begin
	declare name_search varchar(102);
    set name_search = concat("%",product_name,"%");
    select *
    from Product
    where ProductName like name_search ;
end //
delimiter ;