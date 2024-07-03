require("dotenv").config();

const express = require('express');
const cors = require('cors');

const app = express();
const db = require('./server/config/db');

const moviesUsers = require('./server/routes/usersRouter');
const moviesRouter = require('./server/routes/moviesRouter');

app.use(cors());
app.use(express.json());
app.use(express.static('front'));

// Middleware
app.use('/api/users', moviesUsers);
app.use('/api/movies', moviesRouter);

app.get("/", (req, res) => {
    res.send(`Servidor escuchando en puerto ${PORT}`);
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Servidor escuchando en puerto ${PORT}`);
});