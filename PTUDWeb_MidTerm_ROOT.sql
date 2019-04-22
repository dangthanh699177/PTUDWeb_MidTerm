
if DB_ID('PTUDWeb_MidTerm') is not null
begin
	-- Delete database backup and restore history from MSDB System Database
	exec msdb.dbo.sp_delete_database_backuphistory @database_name = 'PTUDWeb_MidTerm'
	-- query to get exclusive access of SQL Server Database before Dropping the Database
	use [master]
	alter database [PTUDWeb_MidTerm] set SINGLE_USER with rollback immediate
	-- query to drop database in SQL Server
	drop database PTUDWeb_MidTerm
end
else
begin
	create database PTUDWeb_MidTerm
end
go

use PTUDWeb_MidTerm
go

if OBJECT_ID ('Person', 'U') is not null
	drop table Person
else
begin
	create table Person
	(
		personId int identity primary key,
		firstName nvarchar(255),
		lastName nvarchar(255),
		dateOfBirth datetime,
		gender bit,
		phone varchar(20),
		email varchar(255),
		address nvarchar(255),
		username varchar(255),
		password varchar(1000),
		isAddmin bit
	)
end
go

if OBJECT_ID('ProductGroup', 'U') is not null
	drop table ProductGroup
else
begin
	create table ProductGroup
	(
		productGroupId int identity primary key,
		name nvarchar(255),
	)
end
go

if OBJECT_ID('Shop', 'U') is not null
	drop table Shop
else
begin
	create table Shop
	(
		shopId int not null identity primary key,
		name nvarchar(255)
	)
end
go

if OBJECT_ID('Product', 'U') is not null
	drop table Product
else
begin
	create table Product
	(
		productId int identity not null primary key,
		name nvarchar(50),
		price int,
		status bit,
		amount int,
		description nvarchar(1000),

		-- Mỗi sản phẩm thuộc về một nhóm nào đó
		productGroupRefId int not null,	
		foreign key (productGroupRefId) references ProductGroup(productGroupId),

		-- Mỗi sản phẩm thuộc một shop nào đó
		shopRefId int not null,
		foreign key (shopRefId) references Shop(shopId),
	)
end
go

if OBJECT_ID('OrderBillDetail', 'U') is not null
	drop table OrderBillDetail
else
begin
	create table OrderBillDetail
	(
		orderDetailId int not null identity primary key,
		
		productRefId int not null,
		foreign key (productRefId) references Product(productId),

		amount int
	)
end
go

if OBJECT_ID('OrderBill', 'U') is not null
	drop table OrderBill
else
begin
	create table OrderBill
	(
		orderId int not null identity primary key,

		-- Mối hóa đơn tương ứng với 1 người
		personRefId int not null,
		foreign key (personRefId) references Person(personId),

		-- Mỗi hóa đơn tương ứng 1 chi tiết hóa đơn
		orderDetailRefId int not null,
		foreign key (orderDetailRefId) references OrderBillDetail(orderDetailId),
	)
end
go
