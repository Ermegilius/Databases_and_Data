'use strict';

const mariadb=require('mariadb');

//call the test function
testA();

//test function connecting the database
async function testA(){
    const options={
        host:'localhost', //127.0.0.1
        port: 3306,
        user:'ceo',
        password:'9999',
        database:'companydb4'
    };

    const connection=await mariadb.createConnection(options);

    let result = await connection.query('select * from employee');
    console.log(result);
    for(const emp of result){
        console.log(emp.firstname);
    }

    result = await connection.query('select firstname from employee');
    console.log(result);
    console.log(result.map(emp=>emp.firstname).join(', '));

    result=await connection.query({
        sql:'select * from employee', rowsAsArray:true
    });
    console.log(result);

    const sql =`insert into workerPosition
                    (positionId,positionName,positionRank)
                    values(?,?,?)`

    try{
        result = await connection.query(sql, [5, 'programmer', 15]);
        console.log(result);
    }
    catch(err){
        // console.log(err.message); //for debug
        console.log('sorry error occured');
    }

    result = await connection.query('select * from workerPosition');
    console.log(result);

    const deleteSql = 'delete from workerPosition where positionId=?';
    result = await connection.query(deleteSql,[5]);

    result = await connection.query('select * from workerPosition');
    console.log(result);


    const sql2 =`select firstname,lastname,
                        departmentName,positionName from employee
                 natural join department
                 natural join workerPosition`
    result = await connection.query(sql2);
    console.log(result);

    const averageSql =`select avg(salary) as average from employee
                        where positionId in (?,?)`;

                        
    result=await connection.query(averageSql,[1,2]);
    console.log(result);

    connection.end();
}

