'use strict';

const Database = require('./database');
const options=require('./employeeDbOptions.json');
const statement=require('./employeeSqlStatements.json');
const { insertParameters, updateParameters, removeParameters} = require('./employeeParameters');

const db=new Database(options);

async function getAll(){
    try{
        const result=await db.doQuery(statement.getAll.join(' '));
        console.log(result);
    }
    catch(err){
        console.log(err);
    }
}//end of getAll

async function getOne(value){
    try{
        const result = await db.doQuery(statement.getOne.join(' '),[value]);
        console.log(result);
    }
    catch(err){
        console.log(err);
    }
}//end of getOne

async function add(newObject){
    try{
        const parameters=insertParameters(newObject);
        const status=await db.doQuery(statement.insert.join(' '), parameters);
        console.log(status);
    }
    catch(err){
        console.log(err);
    }
}

async function update(modifiedObject) {
    try {
        const parameters = updateParameters(modifiedObject);
        const status = await db.doQuery(statement.update.join(' '), parameters);
        console.log(status);
    }
    catch (err) {
        console.log(err);
    }
}

async function remove(removedObject) {
    try {
        const parameters = removeParameters(removedObject);
        const result = await db.doQuery(statement.remove.join(' '), [value]);
        console.log(result);
    }
    catch (err) {
        console.log(err);
    }
}//end of getOne

getAll();
// getOne(1);
// add({
//     employeeId: 114,
//     firstname: 'Mary-Lou Ann',
//     lastname: 'Smith',
//     department: 'admin',
//     salary: 8500.00
// });

// update({
//     employeeId: 114,
//     firstname: 'Mary-Lou Ann',
//     lastname: 'Smithx',
//     department: 'admin',
//     salary: 8500.00
// });

// remove(114);