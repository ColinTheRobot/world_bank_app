require('dotenv').config();
var express        = require('express');
var port           = process.env.PORT;
var app            = express();


app.use(express.static('public'));

app.listen(port, function() {
    console.log('=======================');
    console.log('Running on port ' + port);
    console.log('=======================');
});
