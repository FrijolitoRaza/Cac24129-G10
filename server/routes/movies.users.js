// Importa el módulo 'express' y crea una nueva instancia del enrutador
const express = require('express');
const router = express.Router();

// Array que simula una base de datos de usuarios con algunos registros iniciales
const usuariosLista = [
    {id: 1, username: "Usuario1", password: "newpassword123", email: "newemail@example.com" },
    {id: 2, username: "Usuario2", password: "newpassword456", email: "new_e_mail@example.com" },
    {id: 3, username: "Usuario3", password: "newpassword789", email: "new_mail@example.com" },
    {id: 4, username: "Usuario4", password: "newpassword012", email: "new@example.com" },
    {id: 5, username: "Usuario5", password: "newpassword345", email: "mail@example.com" }
];

// Ruta para listar todos los usuarios
router.get('/', (req, res) => {
    // Devuelve la lista completa de usuarios en formato JSON
    res.json(usuariosLista);
});

// Ruta para obtener un usuario por su ID
router.get('/:id', (req, res) => {
    console.log(req.params.id);

    // Busca el usuario con el ID proporcionado en los parámetros de la ruta
    const usuario = usuariosLista.find(elemento => elemento.id == req.params.id);
    if (!usuario) {
        // Si no se encuentra el usuario, devuelve un error 404
        return res.status(404).json({error: "No existe el usuario."})
    }
    // Si se encuentra el usuario, lo devuelve en la respuesta
    res.send(usuario);
});

// Ruta para crear un nuevo usuario
router.post('/', (req, res) => {
    // Crea un nuevo objeto de usuario con los datos del cuerpo de la solicitud
    const usuarioCarga = {
        id:         usuariosLista.length + 1,  // Asigna un nuevo ID incrementando el tamaño del array
        username:   req.body.username,
        password:   req.body.password,
        email:      req.body.email
    };

    // Añade el nuevo usuario a la lista de usuarios
    usuariosLista.push(usuarioCarga)

    // Devuelve el nuevo usuario creado con un código de estado 201 (creado)
    res.status(201).send(usuarioCarga);
});

// Ruta para actualizar un usuario existente por su ID
router.put('/:id', (req, res) => {
    // Busca el usuario con el ID proporcionado
    const usuario = usuariosLista.find(elemento => elemento.id == req.params.id);
    if (!usuario) {
        // Si no se encuentra el usuario, devuelve un error 404
        return res.status(404).json({error: "No existe el usuario."})
    }

    // Actualiza las propiedades del usuario con los datos del cuerpo de la solicitud o conserva las existentes
    usuario.username    = req.body.username || usuario.username;
    usuario.password    = req.body.password || usuario.password;
    usuario.email       = req.body.email    || usuario.email;

    // Devuelve el usuario actualizado
    res.send(usuario);
});

// Ruta para eliminar un usuario por su ID
router.delete('/:id', (req, res) => {
    // Busca el usuario con el ID proporcionado
    const usuario = usuariosLista.find(elemento => elemento.id == req.params.id);
    if (!usuario) {
        // Si no se encuentra el usuario, devuelve un error 404
        return res.status(404).json({error: "No existe el usuario."})
    }

    // Encuentra el índice del usuario en la lista
    const usuarioIndex = usuariosLista.findIndex(
        (elemento) => elemento.id == req.params.id
    );

    // Elimina el usuario de la lista usando su índice
    usuariosLista.splice(usuarioIndex, 1);

    // Devuelve el usuario eliminado
    res.json(usuario);
});

// Exporta el enrutador para que pueda ser utilizado en otros archivos del proyecto
module.exports = router;