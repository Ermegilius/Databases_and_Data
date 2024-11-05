'use strict';

const { readStorage, writeStorage } = require('./readerWriter');

const storageFilePath = './employee.json' //where to store data

async function getAllFromStorage() {
    return await readStorage(storageFilePath);
}

// async function getFromStorage(value, key = 'id') {
//     const found = [];
//     const persons = await readStorage(storageFilePath);

//     for (const person of persons) {
//         if (person[key] == value) {
//             found.push(person);
//         }
//     }

//     return found;
// }

//shorter function
async function getFromStorage(value, key = 'id') {
    return (await readStorage(storageFilePath))
        .filter(person => person[key] == value);
}

async function addToStorage(newObject) {
    const storage = await readStorage(storageFilePath);
    //console.log(storage);
    storage.push(newObject);
    return await writeStorage(storageFilePath, storage);
}


module.exports = {
    getAllFromStorage,
    getFromStorage,
    addToStorage
}

//we can't delete or update for now
//what if want:
//  to get all persons earning more than 5000?
//  or persons whose first name is Matt or Marry?
//  or persons whose salary is between 3000 and 7000?
//  etc.