var Chance = require('chance');
var chance = new Chance();

var express = require('express');
var app = express();

app.get('/', function(req, res) {
	res.send("Hello, RES!");
});

app.get('/test', function(req, res) {
	res.send("Hello, RES! Your test worked!");
});

app.listen(3000, function() {
	console.log('Accepting HTTP requests on port 3000.');
});