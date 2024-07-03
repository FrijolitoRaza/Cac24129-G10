const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

// Ruta para listar todos los usuarios
router.get('/', userController.index);

// Ruta para obtener un usuario por su ID
router.get('/:id', userController.show);

// Ruta para crear un nuevo usuario
router.post('/', userController.store);


router.post('/register', userController.register);


router.post('/login', userController.login);

// Ruta para actualizar un usuario existente por su ID
router.put('/:id', userController.update);

// Ruta para eliminar un usuario por su ID
router.delete('/:id', userController.destroy);



module.exports = router;
