'use strict';

const sql = require('./employeeSqlStatements.json');

const getAllSql=sql.getAll.join(' ');
const getOneSql=sql.getOne.join(' ');

console.log(getAllSql);
console.log(getOneSql);