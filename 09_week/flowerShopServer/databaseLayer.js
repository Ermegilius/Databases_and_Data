'use strict';

const Database = require('./database');
const options = require('./flowerShopOptions.json');

const db = new Database(options);

const sql = require('./sqlStatements.json');

//db.doQuery('SELECT * FROM flower').then(console.log).catch(console.log);
//db.doQuery('SELECT * FROM customer').then(console.log).catch(console.log);


async function getAll(allSql) {
    try {
        return db.doQuery(allSql.join(' '));
    } catch (err) {
        return err;
    }
}

//getAll (sql.allFarmers).then(console.log).catch(console.log);

async function getOrder(customerOrderId) {
    try {
        const order = await db.doQuery(sql.getCustomerOrderById.join(' '), [customerOrderId]);

        if (order.queryResult.length === 0) {
            return {error: 'No order found'};
        } else {
        const result = await db.doQuery(sql.getFlowersInOrder.join(' '), [customerOrderId]);
        const temp = result.queryResult;
        const rows = temp.map(item=>
            Object.assign(item, {total:Number(item.total)}))
        return {order: order.queryResult[0], rows};
        }
    } 
    catch (error) {
        console.error('Error fetching order:', error);
        throw error;
    }
}

// getOrder().then(console.log).catch(console.log);

async function nextCustomerId(){
    try {
        const result = await db.doQuery(sql.nextCustomerId.join(' '));
        const id = Number(result.queryResult[0].nextId);
        return id;
    } catch (error) {
        console.error('Error fetching next customer id:', error);
        throw error;
    }
}

//nextCustomerId().then(console.log).catch(console.log);
//getOrder(1).then(console.log).catch(console.log);

async function addCustomer(customer){
    try {
        const data =[
            customer.customerFirstname,
            customer.customerLastname,
            customer.customerAddress
        ];
        if (!data[0] || !data[1] || !data[2]) {
            throw new Error('Missing customer data');
        }
        const nextId = await nextCustomerId();
        const result = await db.doQuery(sql.insertCustomer.join(' '), [nextId, ...data]);
        return result;
    } 
    catch (error) {
        console.error('Error adding customer:', error);
        throw error;
    }
}

//addCustomer({firstname: 'John', lastname: 'Doe', address: '123 Main St'}).then(console.log).catch(console.log);
// nextCustomerId().then(console.log).catch(console.log);

module.exports = { getOrder, addCustomer};