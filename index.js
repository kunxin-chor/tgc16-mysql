const express = require('express');
const hbs = require('hbs');
const wax = require('wax-on');
require('dotenv').config();

// make sure to use the version of mysql2 that supports promises
const mysql = require('mysql2/promise');

const helpers = require('handlebars-helpers')({
    'handlebars': hbs.handlebars
})

const app = express();

// setup express
app.set('view engine', 'hbs');
app.use(express.urlencoded({
    'extended': false
}))

wax.on(hbs.handlebars);
wax.setLayoutPath('./views/layouts');

async function main() {
    const connection = await mysql.createConnection({
        'host': process.env.DB_HOST, // localhost means the db server is on the IP address as the express server
        'user': process.env.DB_USER,
        'database': process.env.DB_DATABASE,
        'password': process.env.DB_PASSWORD
    })

    let query = "select * from actor";
    // results will be an array, the first element
    // (i.e index 0) will contain all the rows from the query
    let results = await connection.execute(query);
    console.log(results[0]);
}

main();

app.listen(3000, function(){
    console.log("Server has started")
})