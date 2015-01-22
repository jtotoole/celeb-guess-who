var express = require('express');
var app = express();


app.get('/GINGERSPICE', function(req, res) {
	res.json({"correct": "NICE JOB! NOW GO OUT AND SPICE UP YOUR LIFE!"});
});

app.get('/:other', function(req, res) {
	res.json({"incorrect": "try again, bro"});
});

app.get('/', function(req, res){
  	var personJSON = { "results": {
  	"profession": "She's a pop singer.",
  	"known_for": "She's known for spicing up your life.",
  	"gender": "She's female.",
  	"first letter": "The first letter of her name is G.",
  	"extra hint": "Her name is also a great real spice."
		}
	};
    res.json(personJSON);
});

app.listen(3000);

console.log('listening on port 3000!');