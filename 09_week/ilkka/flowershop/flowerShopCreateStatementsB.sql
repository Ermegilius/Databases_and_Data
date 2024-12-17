drop database if exists flowerShopDb;
create database flowerShopDb;

use flowerShopDb;

create table farmer(
    farmerId integer not null primary key,
    farmerName varchar(50) not null,
    farmLocation varchar(40) not null
);

create table growingSite(
    siteId integer not null primary key,
    siteType varchar(30) not null,
    siteDescription varchar(200)
);

create table flower(
    flowerId integer not null primary key,
    flowerName varchar(20) not null,
    unitPrice integer not null,
    siteId integer not null,
    foreign key (siteId) references growingSite(siteId)
);

create table farmer_grows_flower(
    farmerId integer not null,
    flowerId integer not null,
    primary key(farmerId,flowerId),
    foreign key (farmerId) references farmer(farmerId),
    foreign key (flowerId) references flower(flowerId)
);

create table customer(
    customerId integer not null primary key,
    firstname varchar(30) not null,
    lastname varchar(40) not null,
    customerAddress varchar(100) not null
);

create table customerOrder(
    orderId integer not null primary key,
    customerId integer not null,
    orderDate date not null,
    foreign key (customerId) references customer(customerId)
);


create table order_has_flower(
    orderId integer not null,
    flowerId integer not null,
    amount integer not null,
    primary key(orderId,flowerId),
    foreign key (orderId) references customerOrder(orderId),
    foreign key (flowerId) references flower(flowerId)
);

create user if not exists 'farmer'@'localhost';
set password for 'farmer'@'localhost' = password('secret');

grant all privileges on flowerShopDb.* to 'farmer'@'localhost';

insert into farmer values(1,'Rosamunda','Vantaa');
insert into farmer values(2, 'Roses of Rovaniemi','Rovaniemi');
insert into farmer values(3, 'Violets and Hyasinth','Helsinki');

insert into growingSite values(1,'sunny',null);
insert into growingSite values(2,'shady',null);
insert into growingSite values(3,'half shadow',null);
insert into growingSite values(4,'shadow', null);
insert into growingSite values(5,'dry','almost desert like conditions');

insert into flower values(1,'Violet',80, 1);
insert into flower values(2,'Rose',100, 1);
insert into flower values(3,'Tulip',50, 2);
insert into flower values(4,'Cactus',60, 5);

insert into farmer_grows_flower values(1,1);
insert into farmer_grows_flower values(1,2);
insert into farmer_grows_flower values(2,2);
insert into farmer_grows_flower values(3,1);
insert into farmer_grows_flower values(3,3);

insert into customer values(1,'Matt','River','Seapath 3');
insert into customer values(2,'Mary','Jones','Dataway 20');

insert into customerOrder values(1,1,'2024-12-10');
insert into customerOrder values(2,1,'2024-11-10');
insert into customerOrder values(3,2,'2024-12-10');

insert into order_has_flower values(1,2,10);
insert into order_has_flower values(2,2,4);
insert into order_has_flower values(3,1,20);
insert into order_has_flower values(3,2,10);

-- which farmers are growing roses?
-- select farmerName from farmer
-- natural join farmer_grows_flower
-- natural join flower
-- where flowerName='Rose'
-- order by farmerName asc;


-- select farmerName from farmer
-- inner join farmer_grows_flower on farmer_grows_flower.farmerId=farmer.farmerId
-- inner join flower on farmer_grows_flower.flowerId=flower.flowerId
-- where flowerName='Rose'
-- order by farmerName asc;

-- select farmerName from farmer as f
-- inner join farmer_grows_flower as fgf on fgf.farmerId=f.farmerId
-- inner join flower as flo on fgf.flowerId=flo.flowerId
-- where flowerName='Rose';

-- flower that need sunny site
-- select flowerName from flower
-- natural join growingSite
-- where siteType='sunny'
-- order by unitPrice desc;

-- select flowerName,unitPrice from flower
-- natural join growingSite
-- where siteType='sunny'
-- order by unitPrice desc;

-- select * from farmer
-- natural join farmer_grows_flower
-- natural join flower
-- natural join growingSite;

-- select farmerName,flowerName from farmer
-- natural join farmer_grows_flower
-- natural join flower
-- order by farmerName;

--select all flowers
select flowerId,flowerName,unitPrice,siteId from flower;

--select all flowers with siteType
select flowerId,flowerName,unitPrice,siteType from flower
natural join growingSite;

--select all flowers with siteType
select farmerName,flowerName,unitPrice from flower
natural join farmer_grows_flower
natural join farmer;

-- add new customer
insert into customer(customerId,firstname,lastname,customerAddress)
values(3,'Amanda','Brown','Mainstreet 1');

select customerId,firstname,lastname,customerAddress from customer;

start transaction;
-- create new customer order for Amanda
insert into customerOrder(orderId,customerId,orderDate)
values(4,3,'2024-12-17');

-- add flowers to the order
insert into order_has_flower(orderId,flowerId,amount)
values(4,2,10);
insert into order_has_flower(orderId,flowerId,amount)
values(4,3,5);
insert into order_has_flower(orderId,flowerId,amount)
values(4,1,20);

commit;

--select orders of Amanda
select orderId, orderDate from customerOrder
where customerId=3;

-- all orders
select customerId, orderId, orderDate from customerOrder
order by customerId asc;

select lastname,firstname, orderId, orderDate from customerOrder
natural join customer
order by lastname asc;

--select orders of Amanda Brown
select orderId, orderDate from customerOrder
natural join customer
where firstname='Amanda' and lastname='Brown';

-- flowers in Amandas order
select flowerName, unitPrice,amount from flower
natural join order_has_flower
natural join customerOrder
where customerId=3;

select flowerName, unitPrice,amount,unitPrice*amount as total from flower
natural join order_has_flower
natural join customerOrder
where customerId=3;

select customerOrder.orderId,flowerName, unitPrice,amount,unitPrice*amount as total 
from flower
natural join order_has_flower
natural join customerOrder
where customerId=1;

select flowerId,flowerName, unitPrice,amount,unitPrice*amount as total 
from flower
natural join order_has_flower
natural join customerOrder
where customerOrder.orderId=3;

select orderDate,flowerName, unitPrice,amount,unitPrice*amount as total 
from flower
natural join order_has_flower
natural join customerOrder
where customerId=1;

select orderDate,flowerName, unitPrice,amount,unitPrice*amount as total 
from flower
natural join order_has_flower
natural join customerOrder
where customerId=1 and orderId=1;

-- grouped totals
select customerOrder.orderId, sum(amount*unitPrice) as total from customerOrder
natural join order_has_flower
natural join flower
group by customerOrder.orderId;

-- the total of an order
select flowerName, unitPrice,amount,unitPrice*amount as total from flower
natural join order_has_flower
natural join customerOrder
where orderId=3;

-- total of all orders
select sum(amount*unitPrice) as total from order_has_flower
natural join flower;

-- total of specific order
select sum(amount*unitPrice) as total from order_has_flower
natural join flower
where orderId=4;
