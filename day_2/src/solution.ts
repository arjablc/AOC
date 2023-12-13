import { CONNREFUSED } from "dns";
import fs from "fs";
import path from "path";
import readline from "readline";

const filePath: string = path.resolve("./in.txt");
type MyObject = {
  [key: string]: number;
};
//* the above code tells typescript that anything with the type of
//* MyObject will be an object that is indexed with string keys without this line
//* TS will scream if you want to do maxValues[color] later on the code.
const maxValues: MyObject = {
  red: 12,
  green: 13,
  blue: 14,
};

const stream = fs.createReadStream(filePath, "utf-8");

var lineReader = readline.createInterface({
  input: stream,
});
let count: number = 0;
let result: number = 0;
// async function delay(ms: number) {
//   return new Promise((resolve) => setTimeout(resolve, ms));
// }
async function partOne() {
  for await (const line of lineReader) {
    count = count + 1;
    let arr: Array<number> = [];
    // await delay(5000);
    let splitText = line.split(":");
    let pulls = splitText[1].trim().split(";");
    // console.log(pulls);
    pulls.map((element) => {
      const sets = element.trim().split(",");
      //   console.log(sets);
      sets.map((set) => {
        const [cubes, color] = set.trim().split(" ");

        if (Number(cubes) <= maxValues[color]) {
          arr.push(1);
          // console.log(count);
        } else {
          arr.push(0);
        }
        //   console.log(sets);
      });
    });
    if (!arr.includes(0)) {
      result = result + count;
    }
  }
  console.log(result);
}

// partOne();
partTwo();
async function partTwo() {
  for await (const line of lineReader) {
    let maxVals: MyObject = {
      red: 0,
      blue: 0,
      green: 0,
    };
    // await delay(5000);
    const splitText = line.split(":");
    const pulls = splitText[1].trim().split(";");
    // console.log(pulls);
    pulls.map((element) => {
      const sets = element.trim().split(",");
      sets.map((set) => {
        const [cubes, color] = set.trim().split(" ");
        if (Number(cubes) > maxVals[color]) {
          maxVals[color] = Number(cubes);
        }
      });
    });
    //multiplying to get the power
    let power: number = maxVals.red * maxVals.blue * maxVals.green;
    result += power;
  }
  console.log(result);
}
// console.log(count);
//* If we call the count here then the count will come before being changed in the async function
//* so we need to call the cound somewhere inside the something function
