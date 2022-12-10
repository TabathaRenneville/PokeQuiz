// on require dotenv afin d'avoir acces à la config d'environment
require ('dotenv').config();

//on require express
const express = require('express');

const router = require('./app/routers');
const port = process.env.PORT || 8080;
const app = express();


app.use(express.static('./public'));

app.use(router);

app.listen(port, () => {
    console.log(`http://localhost:${port}`)
});