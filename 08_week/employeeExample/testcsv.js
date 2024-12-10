'use strict';

const {readStorage,writeStorage} = require('./csvReaderWriter');

const storagePath = './employee.csv';

readStorage(storagePath).then().catch(console.log);

const tempData=[
    {'a':1,'name':'asasas', age:10},
    {'a':2,'name':'bbb', age:20},
    {'a':3,'name':'ccc', age:40}
];

//writeStorage('./tmp.csv',tempData).then(console.log).catch(console.log);
readStorage('./tmp.csv').then(console.log).catch(console.log);