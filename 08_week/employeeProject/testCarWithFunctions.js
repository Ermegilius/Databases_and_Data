'use strict';

const Database = require('./database');
const options = require('./carDbOptions.json');
const statements = require('./carSqlStatements.json');
const {insertParameters, updateParameters, removeParameters} = require('./carParameters');

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
getOne(1);
add(
    {
        model: "newModel",
        price: 50000
    }
);

update(
    {
        carId: 3,
        model: "newModel",
        price: 50000,        
    }
);

getAll();

//remove(112);
