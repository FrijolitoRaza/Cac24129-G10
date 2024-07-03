const express = require('express');

const router = express.Router();
const path = require('path');

const multer = require("multer");

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, "public/uploads")
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + path.extname(file.originalname));
    },
});

const upload = multer({
    storage, 
    fileFilter: (req, file, cb) => {
        const fileTypes = /jpg|jpeg|png/;
        const mimetype = fileTypes.test(file.mimetype);

        const extname = fileTypes.test(
            path.extname(file.originalname).toLowerCase()
        );

        if (mimetype & extname) {
            return cb(null, true);
        }
        cb("Tipo de archivo no soportado.");
    },
    limits: {fileSize: 1024 * 1024 * 1},  
});

const movieController = require('../controllers/moviesController');

// Ruta para listar todas las películas
router.get('/', movieController.index);

// Ruta para obtener una película por su ID
router.get('/:id', movieController.show);

// Ruta para crear una nueva película
router.post('/', upload.single("imagen"), movieController.store);

// // Ruta para actualizar una película existente por su ID
router.put('/:id', movieController.update);

// Ruta para eliminar una película por su ID
router.delete('/:id', movieController.destroy)

module.exports = router;
