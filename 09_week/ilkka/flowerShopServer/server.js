'use strict';
const path=require('path');
const express = require('express');
const app=express();

const cors=require('cors');

const { getOrder, addCustomer } = require('./databaseLayer');

const port=3000;
const host='localhost';

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname,'public')));

app.get('/',(req,res)=>res.sendFile(path.join(__dirname,'home.html')));
app.get('/order/:orderId',(req,res)=>{
    const id=req.params.orderId;
    getOrder(id)
        .then(result=>res.json(result))
        .catch(error=>res.json(error));
});

app.post('/customer', (req,res)=>{
    addCustomer(req.body)
        .then(result => res.json(result))
        .catch(error => res.json(error));
});

app.listen(port,host, 
    ()=>console.log(`Serving ${host}:${port}`)
);