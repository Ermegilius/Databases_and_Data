'use strict';

const fs = require('fs');
const readline = require('readline');

async function readStorage(storageFile){
    try{
        const linereader=readline.createInterface({
            input: fs.createReadStream(storageFile)
        });
        const lines=[];
        for await (const line of linereader){
            lines.push(line);
        }
        // console.log(lines);
        const data=[];
        for(const line of lines){
            data.push(line.split('","').map(d=>d.replace(/["]/g, '')));
        }
        // console.log(data);
        return csvToJson(data);

    }
    catch(err){
        console.log(err.message);
        return [];
    }
}

async function writeStorage(storageFile, data){
    try{
        await fs.promises.writeFile(storageFile, createCsv(data),{
                encoding:'utf8',
                flag:'w'
            }
        );
        return true;
    }
    catch(err){
        return false;
    }
}


//helperfunctions
function csvToJson(data){
    const [headers, ...datalines]=data;
    // console.log(headers);
    // console.log(datalines);
    const jsonData=[];
    for(const line of datalines){
        if(line.length===headers.length){
            const item={};
            for(let i=0;i<headers.length;i++){
                item[headers[i]]=line[i]
            }
            jsonData.push(item);
        }
    }
    return jsonData;
}

function createCsv(jsondata){
    let csvString='';
    if(jsondata.length>0){
        csvString+='"'+Object.keys(jsondata[0]).join('","')+'"\n';
        for(let item of jsondata){
            csvString+='"'+Object.values(item).join('","')+'"\n';
        }
    }
    return csvString;
}


module.exports={readStorage,writeStorage};