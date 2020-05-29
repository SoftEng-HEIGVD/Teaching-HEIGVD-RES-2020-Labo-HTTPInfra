var Chance = require('chance');
var chance = new Chance();

var express = require('express');
var app = express();

app.get('/', function(req, res) {
	res.send(generateAnimals());
});

app.listen(3000, function() {
	console.log('Accepting HTTP requests on port 3000.');
});

function generateAnimals() {	
	const types = ["ocean", "desert", "grassland", "forest", "farm", "zoo"];
	const animals = types.map(t => "The " + chance.animal({type: t}) + " lives in " + t);

	console.log(animals);
	
	return animals;
}