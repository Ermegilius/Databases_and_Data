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

create table order (
    orderId int not null primary key,
    customerId int not null,
    orderDate date not null,
    foreign key (customerId) references customer(customerId)
);

create table order_has_flower (
    orderId int not null,
    flowerId int not null,
    flowerAmount int not null, 
    primary key (orderId, flowerId),
    foreign key (orderId) references order(orderId),
    foreign key (flowerId) references flower(flowerId)
);

create user if not exists 'farmer'@'localhost';
set password for 'farmer'@'localhost' = password('secret');
grant all priveleges on flowerShopDB.* to 'farmer'@'localhost';

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

insert into order values (1, 1, '2021-05-01');
insert into order values (2, 1, '2023-07-02');
insert into order values (3, 2, '2024-12-10');

insert into order_has_flower values (1, 2, 10);
insert into order_has_flower values (2, 2, 4);
insert into order_has_flower values (3, 1, 20);
insert into order_has_flower values (3, 2, 10);


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
 */