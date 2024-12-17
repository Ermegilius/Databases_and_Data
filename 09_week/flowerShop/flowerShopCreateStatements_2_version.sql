drop database if exists flowerShopDB;
create database flowerShopDB;

use flowerShopDB;

create table farmer (
    farmerId int not null primary key,
    farmerName varchar(50) not null,
    farmerLocation varchar(40) not null
);

create table growingSite (
    siteId int not null primary key,
    siteType varchar(50) not null,
    siteDescription varchar(200)
);

create table flower (
    flowerId int not null primary key,
    flowerName varchar(20) not null,
    flowerPrice int not null,
    siteId int not null,
    foreign key (siteId) references growingSite(siteId)
);

create table farmer_grows_flower (
    flowerId int not null,
    farmerId int not null,
    primary key (flowerId, farmerId),
    foreign key (flowerId) references flower(flowerId),
    foreign key (farmerId) references farmer(farmerId)
);

create table customer (
    customerId int not null primary key,
    customerfirstname varchar(50) not null,
    customerlastname varchar(50) not null,
    customerAddress varchar(100) not null
);

create table customerOrder (
    customerOrderId int not null primary key,
    customerId int not null,
    customerOrderDate date not null,
    foreign key (customerId) references customer(customerId)
);

create table customerOrder_has_flower (
    customerOrderId int not null,
    flowerId int not null,
    flowerAmount int not null, 
    primary key (customerOrderId, flowerId),
    foreign key (customerOrderId) references customerOrder(customerOrderId),
    foreign key (flowerId) references flower(flowerId)
);

create user if not exists 'farmer'@'localhost';
set password for 'farmer'@'localhost' = password('secret');
grant all privileges on flowerShopDB.* to 'farmer'@'localhost';

insert into farmer values (1, 'Rosamunda', 'Vaanta');
insert into farmer values (2, 'Roses of Helsinki', 'Helsinki');
insert into farmer values (3, 'Violets and Hyasinth', 'Espoo');

insert into growingSite values (1, 'sunny', null);
insert into growingSite values (2, 'shady', null);
insert into growingSite values (3, 'half shadow', null);
insert into growingSite values (4, 'shadow', null);
insert into growingSite values (5, 'dry', 'almost desert like conditions');

insert into flower values (1, 'Violet', 80, 1);
insert into flower values (2, 'Rose', 100, 1);
insert into flower values (3, 'Tulip', 50, 2);
insert into flower values (4, 'Cactus', 60, 5);

insert into farmer_grows_flower values (1, 1);
insert into farmer_grows_flower values (1, 2);
insert into farmer_grows_flower values (2, 2);
insert into farmer_grows_flower values (3, 1);
insert into farmer_grows_flower values (3, 3);

insert into customer values (1, 'John', 'Doe', 'Helsinki 123');
insert into customer values (2, 'Jane', 'Doe', 'Espoo 456');
insert into customer values (3, 'Jack', 'River', 'Vantaa 789');

insert into customerOrder values (1, 1, '2021-05-01');
insert into customerOrder values (2, 1, '2023-07-02');
insert into customerOrder values (3, 2, '2024-12-10');

insert into customerOrder_has_flower values (1, 2, 10);
insert into customerOrder_has_flower values (2, 2, 4);
insert into customerOrder_has_flower values (3, 1, 20);
insert into customerOrder_has_flower values (3, 2, 10);


--select section
/* select farmerName from farmer
natural join farmer_grows_flower
natural join flower
where flowerName = 'Violet'
order by farmerName asc;

select farmerName from farmer
inner join farmer_grows_flower on farmer_grows_flower.farmerId=farmer.farmerId
inner join flower on farmer_grows_flower.flowerId=flower.flowerId
where flowerName = 'Violet'
order by farmerName asc;

select farmerName from farmer as f
inner join farmer_grows_flower as fgf on fgf.farmerId=f.farmerId
inner join flower as fl on fgf.flowerId=fl.flowerId
where flowerName = 'Violet'
order by farmerName asc;

select flowername from flower
natural join growingSite
where siteType = 'sunny';

select flowerName, flowerPrice from flower
natural join growingSite
where siteType = 'sunny'
order by flowerPrice desc;

select * from farmer
natural join farmer_grows_flower
natural join flower
natural join growingSite;

select farmerName, flowerName from farmer
natural join farmer_grows_flower
natural join flower
order by farmerName asc;
*/

-- select all flowers
select flowerId, flowerName, flowerPrice, siteId from flower;

-- select all flowers with their growing site
select flowerId, flowerName, flowerPrice, siteType from flower
natural join growingSite;

-- select all flowers with site type
select farmerName, flowerName, flowerPrice, siteType from flower
natural join growingSite
natural join farmer_grows_flower
natural join farmer;

-- select all flowers with price
select farmerName, flowerName, flowerPrice from flower
natural join farmer_grows_flower
natural join farmer;

-- add new customer
insert into customer(customerId, customerfirstname, customerlastname, customerAddress)
values (4, 'Jill', 'Valentine', 'Helsinki 321');

select customerId, customerfirstname, customerlastname, customerAddress from customer;

start transaction;
-- create new customer order inside transaction
insert into customerOrder (customerOrderId, customerId, customerOrderDate)
values (4, 4, '2024-12-15');
-- add some flowers to the order
insert into customerOrder_has_flower (customerOrderId, flowerId, flowerAmount)
values (4, 1, 5);
insert into customerOrder_has_flower (customerOrderId, flowerId, flowerAmount)
values (4, 2, 10);
insert into customerOrder_has_flower (customerOrderId, flowerId, flowerAmount)
values (4, 3, 25);
-- commit transaction
commit;

--select orders of Jill
select customerOrderId, customerOrderDate from customerOrder
where customerId = 4;

-- all orders
select customerId, customerOrderId, customerOrderDate from customerOrder
natural join customer
order by customerlastname asc;

-- select orders of Jill Valentine
select customerOrderId, customerOrderDate from customerOrder
natural join customer
where customerfirstname = 'Jill' and customerlastname = 'Valentine';

--flowers in Jills orders
select flowerName, flowerPrice, flowerAmount from flower
natural join customerOrder_has_flower
natural join customerOrder
where customerId = 4;

-- same as above but with total price
select flowerName, flowerPrice, flowerAmount, flowerPrice*flowerAmount as total from flower
natural join customerOrder_has_flower
natural join customerOrder
where customerId = 4;

select customerOrder.customerOrderId, flowerName, flowerPrice, flowerAmount, flowerPrice*flowerAmount as total
from flower
natural join customerOrder_has_flower
natural join customerOrder
where customerId = 1;

select customerOrderDate, flowerName, flowerPrice, flowerAmount, flowerPrice*flowerAmount as total
from flower
natural join customerOrder_has_flower
natural join customerOrder
where customerId = 1;

select customerOrderDate, flowerName, flowerPrice, flowerAmount, flowerPrice*flowerAmount as total
from flower
natural join customerOrder_has_flower
natural join customerOrder
where customerId = 1 and customerOrderId = 1;

-- grouped totals
select customerOrder.customerOrderId, sum(flowerAmount*flowerPrice) as total from customerOrder
natural join customerOrder_has_flower
natural join flower
group by customerOrder.customerOrderId;

--the total of an order
select flowerName, flowerPrice, flowerAmount, flowerPrice*flowerAmount as total from flower
natural join customerOrder_has_flower
natural join customerOrder
where customerOrderId = 1;

--total of all orders
select sum(flowerPrice*flowerAmount) as total from customerOrder_has_flower
natural join flower;

--total of specific order
select sum(flowerPrice*flowerAmount) as total from customerOrder_has_flower
natural join flower
where customerOrderId = 1;
