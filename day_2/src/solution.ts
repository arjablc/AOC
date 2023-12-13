import fs from "fs" ;
import path from "path";

const filePath : string  = path.resolve("./in.txt");


const stream = fs.createReadStream(filePath, "utf-8");

stream.on("data",(data)=>{
console.log(data);

})