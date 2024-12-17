'use strict';


let fn;
let ln;
let addr;

document.addEventListener('DOMContentLoaded', init);

function init(){
    fn=document.getElementById('firstname');
    ln=document.getElementById('lastname');
    addr=document.getElementById('address');

    document.getElementById('submit').addEventListener('click',send);
}

async function send(){
    const cust={
        firstname:fn.value,
        lastname:ln.value,
        customerAddress:addr.value
    };

    const options={
        method:'post',
        body:JSON.stringify(cust),
        headers:{
            'Content-Type':'application/json'
        }
    };

    try{
        const data = await fetch('/customer',options);
        const jsonresp=await data.json();
        console.log(jsonresp);
    }
    catch(err){
        console.log(err)
    }
}