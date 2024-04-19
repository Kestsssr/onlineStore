CREATE SCHEMA OnlineStore;

create table onlinestore.staff(
id serial primary key,
staff_name varchar(100) not null unique,
staff_post varchar(50) not null);

create table onlinestore.productType(
id serial primary key,
productType_type varchar(50) not null unique);

create table onlinestore.warehouse(
id serial primary key,
warehouse_address text not null,
warehouse_IDstaff int references staff(id),
warehouse_IDproductType int references productType(id));

create table onlinestore.provider(
id serial primary key,
provider_name varchar(100) not null,
provider_address text not null,
provider_IDproductType int references productType(id),
provider_phone int);

create table onlinestore.product(
id serial primary key,
product_name varchar(100) not null unique,
product_IDwarehouse int references warehouse(id),
product_price decimal not null,
product_remains int,
product_comment text);

create table onlinestore.client(
id serial primary key,
client_name varchar(100) not null unique,
client_address text not null,
client_phone int not null unique,
client_email varchar(50) not null unique);

create table onlinestore.order(
id serial primary key,
order_data timestamp,
order_IDclient int references client(id),
order_IDproduct int references product(id),
order_productQuantity int,
order_amount decimal not null,
order_IDstatus int references status(id),
order_IDpaymentMethod int references paymentMethod(id),
order_comment text);

create table onlinestore.status(
id serial primary key,
status_name varchar(50) not null unique);

create table onlinestore.paymentMethod(
id serial primary key,
paymentMethod_name varchar(100) not null unique);