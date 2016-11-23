var express = require('express');
var app = express();
var path = require('path');

app.use(express.static('./'));
app.use(express.static('./c/'));
app.use(express.static('./cpp/'));

app.listen(4444);
