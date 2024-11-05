// persontest.js
'use strict';

const persons=require('./persons.json');

console.log(persons);
console.log(JSON.stringify(persons,null,2));

const jr='Jr';
const newPerson={
    //this is a comment
    firstname:'Mark',
    "lastname":`Lake ${jr}`,
    age:45
};

console.log('new:',newPerson);
persons.push(newPerson);

console.log(persons);
console.log(JSON.stringify(persons, null, 2));

function searchByAge(age){
    const found=[];
    for(const person of persons){
        if(person.age===age){
            found.push(person);
        }
    }
    return found;
}
console.log('#####################');
console.log(searchByAge(25));
console.log('#####################');
console.log(searchByAge(30));
console.log('#####################');
console.log(searchByAge(50));

function search(key,value){
    const found=[];

    for(const person of persons){
        if(person[key]===value){
            found.push(person);
        }
    }
    return found;
}

console.log('######## search #############');
console.log(search('lastname', 'River'));

console.log('######## search #############');
console.log(search('age', 45));