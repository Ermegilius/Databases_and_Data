'use strict';

const Database = require('./database');
const options = require('./employeeDbOptions.json');
const statements = require('./employeeSqlStatements.json');
const {insertParameters, updateParameters, removeParameters} = require('./employeeParameters');

const db = new Database(options);

async function getAll(){
    try {
        const result = await db.doQuery(statements.getAll.join(' '));
        console.log(result);    
        }
    catch (err){
        console.log(err);
    }
};

async function getOne(value){
    try{
        const result = await db.doQuery(statements.getOne.join(' '),[value]);
        console.log(result);    
    } catch (err){
        console.log(err);
    }
}//end of getOne

async function add(newObject){
    try {
        const parameters = insertParameters(newObject);
        const status = await db.doQuery(statements.insert.join(' '), parameters);
        console.log(status);
    } catch (err) {
        console.log(err);
    }
}

async function update(modifiedObject){
    try {
        const parameters = updateParameters(modifiedObject);
        const status = await db.doQuery(statements.update.join(' '), parameters);
        console.log(status);
    } catch (err) {
        console.log(err);
    }
}

async function remove(value) {
    try {
        const result = await db.doQuery(statements.remove.join(' '), [value]);
        console.log(result);
    } catch (err) {
        console.log(err);
    }
}


getAll();
//getOne(1);
/* add(
    {
        employeeId: 115,
        firstName: "Maryiii",
        lastName: "iiSmith",
        department: "ict",
        salary: 5000
    }
); */

/* update(
    {
        employeeId: 115,
        firstName: "Mary",
        lastName: "iiSmith",
        department: "ict",
        salary: 5000
    }
); */

//remove(112);
