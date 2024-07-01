const express = require('express');

const app = express();
const moviesUsers = require('./routes/movies.users');
const moviesMovies = require('./routes/movies.movies');
app.use(express.json());


// Middleware to use moviesUsers routes
app.use('/api/users', moviesUsers);
app.use('/api/movies', moviesMovies);



app.get("/", (req, res) => {
    res.send("Hola desde Express");
});

const PORT = 3000;
app.listen(PORT, () => console.log(`Server running at http://localhost:${PORT}`));

