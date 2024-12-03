# Employee project (database class API)

This Database Class is a general purpose class for creating and using MariaDB/mysql queries.
The constructor takes as parameter all necessary information to open a database connection.

This layer will be used in between database engine and rest of our application.

## Init the project

```shell
npm init -y;
npm install mariadb;
```

## Constructor

Here is the example of constructor parameter:

```json
{
  "host": "localhost",
  "port": 3306,
  "user": "zeke",
  "password": "secret",
  "database": "employeebd"
}
```

## Methods

### **doQuery (sqlStatement, parameterArray)**

Executes the given sqlStatement with the given parameterArray. Returns a promise that resolves to the result of the query.

### Usage

```js
const result = await db.doQuery("select * from employee");
```

```js
const result = await db.doQuery(
  `insert into employee(employeeID, firstname, lastname, department, salary)
    values(?, ?, ?, ?, ?)`,
  [5, "Mary", "Adams", "ict", 5000]
);
```

Returns either resultset as an array

```js
    queryResult: [
        {
            id:1,
            firstname: "John",
            lastname: "Doe",
            department: "ict",
            salary: 5000
        },
        {
            id:2,
            firstname: "Jane",
            lastname: "Doe",
            department: "ict",
            salary: 5000
        }
    ],
    resultSet:true
```

or status object (insert, update, delete)

```js
    queryResult:{rowsChanged:1, insertId:0, status:0},
    resultSet:false
```
