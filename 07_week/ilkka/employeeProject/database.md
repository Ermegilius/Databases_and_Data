# Database class API

This Database class is a general purpose class for creating and using
mariadb/mysql queries. The constructor takes as parameter all necessary information to open a database connection.

This layer will be used in between the database engine and rest of our application.

Here is the example of constructor parameter:

```json
{
    "host":"localhost",
    "port":3306,
    "user":"zeke",
    "password":"secret",
    "database":"employeedb"
}
```

## **doQuery(sqlStatement, parameterArray)**
Executes the given sqlStatement with given parameters. Returns a promise.

### Usage
```js
const result=await db.doQuery('select * from employee');
```

```js
const result=await db.doQuery(
    `insert into employee(employeeId, firstname,lastname,department,salary)
    values(?,?,?,?,?)`,[5,'Mary','Adams','ict',5000]
);
```

Returns either resultset as an array (select)
```js
{
    queryResult:[
        {
            "id": 1,
            "firstname": "Matt",
            "lastname": "River",
            "department": "ict",
            "salary": 4000
        },
        {
            "id": 2,
            "firstname": "Vera",
            "lastname": "River",
            "department": "ict",
            "salary": 5000
        }
    ],
    resultSet:true
}
```

or status object (insert, update, delete)
```js
{
    queryResult:{rowsChanged:1, insertId:0, status:0},
    resultSet:false
}
```