'use strict';

function insertParameters (employee){
    return [
        employee.employeeId,
        employee.firstName,
        employee.lastName,
        employee.department,
        employee.salary
    ];
}

function updateParameters(employee){
    return [
        employee.firstName,
        employee.lastName,
        employee.department,
        employee.salary,
        employee.employeeId
    ];
}

async function removeParameters (employee){
    return [
        employee.employeeId
    ];
}
module.exports = {insertParameters, updateParameters, removeParameters};