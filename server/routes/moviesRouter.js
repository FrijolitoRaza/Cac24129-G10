// Importa el módulo 'express' y crea una nueva instancia del enrutador
const express = require('express');
const router = express.Router();

const movieController = require('../controllers/moviesController');

// Ruta para listar todas las películas
router.get('/', movieController.index);

// Ruta para obtener una película por su ID
router.get('/:id', movieController.show);

// Ruta para crear una nueva película
router.post('/', movieController.store);

// // Ruta para actualizar una película existente por su ID
router.put('/:id', movieController.update);

// Ruta para eliminar una película por su ID
router.delete('/:id', movieController.destroy)

module.exports = router;
