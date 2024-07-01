// Importa el módulo 'express' y crea una nueva instancia del enrutador
const express = require('express');
const router = express.Router();

const movieController = require('../controllers/moviesController');

// Array que simula una base de datos de películas con algunos registros iniciales
const peliculasLista = [
    { id: 1, titulo: "Pelicula1", director: "Director1", año: 2020 },
    { id: 2, titulo: "Pelicula2", director: "Director2", año: 2019 },
    { id: 3, titulo: "Pelicula3", director: "Director3", año: 2018 },
    { id: 4, titulo: "Pelicula4", director: "Director4", año: 2017 },
    { id: 5, titulo: "Pelicula5", director: "Director5", año: 2016 }
];

// Ruta para listar todas las películas
router.get('/', movieController.index);

// Ruta para obtener una película por su ID
router.get('/:id', movieController.show);

// Ruta para crear una nueva película
router.post('/', (req, res) => {
    // Crea un nuevo objeto de película con los datos del cuerpo de la solicitud
    const peliculaNueva = {
        id: peliculasLista.length + 1,  // Asigna un nuevo ID incrementando el tamaño del array
        titulo: req.body.titulo,
        director: req.body.director,
        año: req.body.año
    };

    // Añade la nueva película a la lista de películas
    peliculasLista.push(peliculaNueva);

    // Devuelve la nueva película creada con un código de estado 201 (creado)
    res.status(201).send(peliculaNueva);
});

// Ruta para actualizar una película existente por su ID
router.put('/:id', (req, res) => {
    // Busca la película con el ID proporcionado
    const pelicula = peliculasLista.find(pelicula => pelicula.id == req.params.id);
    if (!pelicula) {
        // Si no se encuentra la película, devuelve un error 404
        return res.status(404).json({ error: "No existe la película." });
    }

    // Actualiza las propiedades de la película con los datos del cuerpo de la solicitud o conserva las existentes
    pelicula.titulo = req.body.titulo || pelicula.titulo;
    pelicula.director = req.body.director || pelicula.director;
    pelicula.año = req.body.año || pelicula.año;

    // Devuelve la película actualizada
    res.send(pelicula);
});

// Ruta para eliminar una película por su ID
router.delete('/:id', (req, res) => {
    // Busca la película con el ID proporcionado
    const pelicula = peliculasLista.find(pelicula => pelicula.id == req.params.id);
    if (!pelicula) {
        // Si no se encuentra la película, devuelve un error 404
        return res.status(404).json({ error: "No existe la película." });
    }

    // Encuentra el índice de la película en la lista
    const peliculaIndex = peliculasLista.findIndex(pelicula => pelicula.id == req.params.id);

    // Elimina la película de la lista usando su índice
    peliculasLista.splice(peliculaIndex, 1);

    // Devuelve la película eliminada
    res.json(pelicula);
});

// Exporta el enrutador para que pueda ser utilizado en otros archivos del proyecto
module.exports = router;
