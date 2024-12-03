'use strict';

const Database = require('./database');
const options = require('./employeeDbOptions.json');

const db = new Database(options);

(async function() {
    const result = await db.doQuery('select * from employee');
    console.log(result);
    try {
        if (result.resultSet) {
            for (const emp of result.queryResult){
                console.log(`${emp.firstname} ${emp.lastname}`);     
            } 
        }
        const insertStatus = await db.doQuery(`insert into employee values (?,?,?,?,?)`,
        [123, "Mary", "Smith", "ict", 4000]
        );
        console.log(insertStatus);

        const removeStatus = await db.doQuery(`delete from employee where empId=?`, [123]);
        console.log(removeStatus);
    } catch (err) {
        console.log(err);
    }
})();