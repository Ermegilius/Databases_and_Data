'use strict';

const Database = require('./database');
const options=require('./flowershopOptions.json');

const db=new Database(options);

const sql=require('./sqlStatements.json');

// db.doQuery('select * from farmer').then(console.log).catch(console.log);

async function getAll(allSql){
    try{
        return db.doQuery(allSql.join(' '));
    }
    catch(error){
        return error;
    }
}

// getAll(sql.allFarmers).then(console.log).catch(console.log);
// getAll(sql.allFlowers).then(console.log).catch(console.log);

async function getOrder(orderId){
    return new Promise(async (resolve,reject)=>{
        try{
            const order=await db.doQuery(sql.getOrderById.join(' '),[orderId]);
            if(order.queryResult.length===0){
                return reject('no order info');
            }
            const result=await db.doQuery(sql.getFlowersInOrder.join(' '),[orderId]);
            const temp = result.queryResult;
            const rows=temp.map(item=>
                Object.assign(item,{total:Number(item.total)}))
            return resolve({ order: order.queryResult[0], rows });
        }
        catch(error){
            reject(error);
        }
    });
}

// getOrder().then(console.log).catch(console.log);

async function nextCustomerId(){
    try{
        const result=await db.doQuery(sql.nextCustomerId.join(' '));
        const id=Number(result.queryResult[0].id);
        return id;
    }
    catch(error){
        return error;
    }
}

async function addCustomer(customer){
    try{
        const data = [
            customer.firstname, customer.lastname, customer.customerAddress
        ];
        const nextId = await nextCustomerId();
        const result = await db.doQuery(sql.insertCustomer.join(' '), [nextId, ...data]);
        return result;
    }
    catch(error){
        return error;
    }
}

// addCustomer({ firstname: 'a', lastname: 'b', customerAddress: 'c' })
    // .then(console.log).catch(console.log);

// nextCustomerId().then(console.log).catch(console.log);

module.exports = { getOrder, addCustomer }