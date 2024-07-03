const mysql = require("mysql2");
require("dotenv").config();


const connection = mysql.createConnection({
    host:       process.env.DB_HOST,
    user:       process.env.DB_USER,
    password:   process.env.DB_PASS,
    database:   process.env.DB_NAME,
    port:       process.env.DB_PORT

});

connection.connect((error) =>{
    if (error) {
        return console.error('Error connecting to the database:', error);
        process.exit(1);
    }

    console.log("Conectado.")

});


module.exports = connection;