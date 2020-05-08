var animals = require('animals');

const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send(generateLuckyAnimals()))

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))

function generateLuckyAnimals() {
    console.log("Recieved a request for lucky animals");
    var luckyAnimals = [];

    for(var i = 0; i < 3; i++)
        luckyAnimals.push({
            luckyAnimalID : i,
            animal : animals()
        });

    console.log(luckyAnimals);
    return luckyAnimals;
}