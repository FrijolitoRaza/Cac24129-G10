const db = require('../config/db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
require('dotenv').config();


const index = (req, res) => {
    const sql = "SELECT * FROM Usuarios";

    db.query(sql, (error, rows) => {
        if (error) {
            return res.status(500).json({error: "Intente más tarde."});
        }

        res.json(rows);
    });
};

const show = (req, res) => {
    const { id } = req.params;

    // Comprobación para asegurarse de que el id es un número     /////////////////////////////////
    const numericId = parseInt(id, 10);
    if (Number.isNaN(numericId)) {
        return res.status(400).json({ error: "El ID debe ser un número." });
    }

    const sql = "SELECT * FROM Usuarios WHERE ID_Usuario = ?";

    db.query(sql, [id], (error, rows) => {
        if (error) {
            return res.status(500).json({error: "Intente más tarde."});
        }

        if (rows.length === 0) {
            return res.status(404).json({error: "No existe el usuario."});
        }

        res.json(rows[0]);
    });
};

const register = (req, res) => {
    const { nombre, apellido, email, password, fechaNacimiento, pais } = req.body;

    const hash = bcrypt.hashSync(password, 10);

    // Consulta para verificar si el correo electrónico ya está registrado
    const checkEmailSql = 'SELECT COUNT(*) AS count FROM Usuarios WHERE Correo = ?';

    db.query(checkEmailSql, [email], (error, rows) => {
        if (error) {
            console.error('Error al verificar correo electrónico:', error);
            return res.status(500).json({ error: 'Error al registrar el usuario' });
        }

        const emailExists = rows[0].count > 0;

        if (emailExists) {
            return res.status(400).json({ error: 'El correo electrónico ya está registrado' });
        }

        // Consulta para obtener el ID del país por su nombre
        const getCountryIdSql = 'SELECT ID_Pais FROM Paises WHERE COD = ?';

        db.query(getCountryIdSql, [pais], (error, rows) => {
            if (error) {
                console.error('Error al obtener ID del país:', error);
                return res.status(500).json({ error: 'Error al registrar el usuario' });
            }

            if (rows.length === 0) {
                return res.status(400).json({ error: 'El país proporcionado no existe' });
            }

            const countryId = rows[0].ID_Pais;

            // Query para insertar el usuario con el ID del país obtenido
            const insertUserSql = 'INSERT INTO Usuarios (Nombre, Apellido, Correo, Pass, FDN, ID_Pais, Fecha_Creacion) VALUES (?, ?, ?, ?, ?, ?, NOW())';

            db.query(insertUserSql, [nombre, apellido, email, hash, fechaNacimiento, countryId], (error, result) => {
                if (error) {
                    console.error('Error al insertar usuario:', error);
                    return res.status(500).json({ error: 'Error al registrar el usuario' });
                }

                res.status(201).json({ message: 'Usuario registrado exitosamente' });
            });
        });
    });
};

const login = (req, res) => {
    const { email, password } = req.body;

    const sql = 'SELECT * FROM Usuarios WHERE Correo = ?';

    db.query(sql, [email], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Error al iniciar sesión' });
        }

        if (results.length === 0) {
            return res.status(401).json({ error: 'Correo o contraseña incorrectos' });
        }

        const user = results[0];

        const isPasswordValid = bcrypt.compareSync(password, user.Pass);

        if (!isPasswordValid) {
            return res.status(401).json({ error: 'Correo o contraseña incorrectos' });
        }

        const token = jwt.sign({ id: user.ID_Usuario }, process.env.JWT_SECRET, { expiresIn: '1h' });

        res.json({ message: 'Inicio de sesión exitoso', token });
    });
};

const store = async (req, res) => {
    const { Nombre, Apellido, Correo, Pass, FDN, ID_Pais, ID_Suscripcion } = req.body;
    
    try {
        const hashedPassword = await bcrypt.hash(Pass, 10);
        
        const sql = "INSERT INTO Usuarios (Nombre, Apellido, Correo, Pass, FDN, ID_Pais, Fecha_Creacion, ID_Suscripcion) VALUES (?, ?, ?, ?, ?, ?, NOW(), ?)";
        db.query(sql, [Nombre, Apellido, Correo, hashedPassword, FDN, ID_Pais, ID_Suscripcion], (error, result) => {
            if (error) {
                return res.status(500).json({error: "Intente más tarde."});
            }

            const usuario = {
                ID_Usuario: result.insertId,
                Nombre,
                Apellido,
                Correo,
                hashedPassword,
                FDN,
                ID_Pais,
                Fecha_Creacion: new Date(),
                ID_Suscripcion
            };

            res.json(usuario);
        });
    } catch (error) {
        res.status(500).json({error: "Error al procesar la contraseña."});
    }
};

const update = async (req, res) => {
    const { id } = req.params;
    const { Nombre, Apellido, Correo, Pass, FDN, ID_Pais, ID_Suscripcion } = req.body;

    try {
        const hashedPassword = await bcrypt.hash(Pass, 10);
        const sql = "UPDATE Usuarios SET Nombre = ?, Apellido = ?, Correo = ?, Pass = ?, FDN = ?, ID_Pais = ?, ID_Suscripcion = ? WHERE ID_Usuario = ?";

        db.query(sql, [Nombre, Apellido, Correo, hashedPassword, FDN, ID_Pais, ID_Suscripcion, id], (error, result) => {
            if (error) {
                return res.status(500).json({error: "Intente más tarde."});
            }

            if (result.affectedRows === 0) {
                return res.status(404).json({error: "No existe el usuario."});
            }

            const usuario = { ID_Usuario: id, Nombre, Apellido, Correo, hashedPassword, FDN, ID_Pais, ID_Suscripcion };
            res.json(usuario);
        });
    } catch (error) {
        res.status(500).json({error: "Error al procesar la contraseña."});
    }
};

const destroy = (req, res) => {
    const { id } = req.params;

    const sql = "DELETE FROM Usuarios WHERE ID_Usuario = ?";
    db.query(sql, [id], (error, result) => {
        if (error) {
            return res.status(500).json({error: "Intente más tarde."});
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({error: "No existe el usuario."});
        }

        res.json({mensaje: `Usuario ${id} borrado`});
    });
};

module.exports = {
    index,
    show,
    store,
    update,
    destroy,
    register,
    login,
};