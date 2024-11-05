# Databases - intro

Database system (engine) includes database handling programs such as manipulating data and manipulating database structure and users etc.

-   relational databases (for example MariaDb, Mysql)
    -   SQL language
-   non-relational
    -   noSql (for example MongoDb)

## links
-   https://en.wikipedia.org/wiki/Relational_database
-   https://en.wikipedia.org/wiki/SQL
-   https://en.wikipedia.org/wiki/NoSQL
-   https://mariadb.com/kb/en/
-   https://mariadb.org/documentation/

### install mariadb

-   https://mariadb.com/kb/en/installing-mariadb-on-macos-using-homebrew/

## Datastorage usage (here database)
`client application`  
| (API, for example fetch)
__________ backend
`datastorage layer`  
| (API, for example SQL)  
`database engine`  
(API, read/write disk etc.)  
`disk storage` (permanent storage)

## SQL - Structured Query Language

### create table

```sql
create table person(
    id integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    age integer
);
```

### insert data

```sql
insert into person (id,firstname,lastname,age)
values(1,'Matt','River',25);
```

### select data from table

```sql
select firstname,age from person;
```