'use strict';

const { readStorage, writeStorage } = require('./csvReaderWriter');

const storagePath='./employee.csv';

// readStorage(storagePath).then(console.log).catch(console.log);

const tmpData=[
    {'a':1,'name':'asasa', age:10},
    { 'a': 2, 'name': 'bbbb', age: 20 },
    { 'a': 3, 'name': 'cccc', age: 40 }
];

// writeStorage('./tmp.csv',tmpData).then(console.log).catch(console.log);
readStorage('./tmp.csv').then(console.log).catch(console.log);