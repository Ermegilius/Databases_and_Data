'use strict';

function insertParameters (car){
    return [
        car.carId,
        car.model,
        car.price,
    ];
}

function updateParameters(car){
    return [
        car.model,
        car.price,
        car.carId,
    ];
}

async function removeParameters (car){
    return [
        car.carId
    ];
}
module.exports = {insertParameters, updateParameters, removeParameters};