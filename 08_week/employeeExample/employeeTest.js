'use strict';

const {
    getAllFromStorage,
    getFromStorage,
    addToStorage
} = require('./storageLayer');


// getAllFromStorage().then(console.log);
// getFromStorage(1).then(console.log);
// getFromStorage('River','lastname').then(console.log);

const newPerson = {
    "id": 5,
    "firstname": "Amanda",
    "lastname": "Brown",
    "department": "transportation",
    "salary": 3000
};

// addToStorage(newPerson).then(console.log);
getAllFromStorage().then(console.log);