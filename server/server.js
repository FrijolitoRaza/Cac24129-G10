const express = require('express');
const bodyParser = require('body-parser');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const app = express();
const PORT = process.env.PORT || 3000;
const secretKey = 'your_secret_key'; // Asegúrate de usar una clave secreta segura

app.use(bodyParser.json());

// Almacenamiento en memoria para usuarios
let users = [];

// Middleware de Autenticación
const auth = (req, res, next) => {
  const token = req.header('Authorization')?.replace('Bearer ', '');

  if (!token) {
    return res.status(401).json({ message: 'No hay token, autorización denegada' });
  }

  try {
    const decoded = jwt.verify(token, secretKey);
    req.user = decoded;
    next();
  } catch (error) {
    res.status(401).json({ message: 'Token no es válido' });
  }
};

// Endpoint para registrar un nuevo usuario
app.post('/api/register', async (req, res) => {
  const { username, email, password } = req.body;

  try {
    const existingUser = users.find(user => user.email === email);
    if (existingUser) {
      return res.status(400).json({ message: 'El usuario ya existe' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = { id: users.length + 1, username, email, password: hashedPassword };
    users.push(newUser);

    res.status(201).json({ message: 'Usuario creado exitosamente' });
  } catch (error) {
    res.status(500).json({ message: 'Error del servidor' });
  }
});

// Endpoint para iniciar sesión
app.post('/api/login', async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = users.find(user => user.email === email);
    if (!user) {
      return res.status(400).json({ message: 'Credenciales inválidas' });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ message: 'Credenciales inválidas' });
    }

    const token = jwt.sign({ userId: user.id }, secretKey, { expiresIn: '1h' });

    res.json({ token });
  } catch (error) {
    res.status(500).json({ message: 'Error del servidor' });
  }
});

// Endpoint para obtener el perfil del usuario autenticado
app.get('/api/users/profile', auth, (req, res) => {
  try {
    const user = users.find(user => user.id === req.user.userId);
    if (!user) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    const { password, ...userProfile } = user; // Excluir la contraseña
    res.json(userProfile);
  } catch (error) {
    res.status(500).json({ message: 'Error del servidor' });
  }
});

// Endpoint para actualizar el perfil del usuario
app.put('/api/users/profile', auth, async (req, res) => {
  const { username, email, password } = req.body;

  try {
    const user = users.find(user => user.id === req.user.userId);

    if (!user) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    if (username) user.username = username;
    if (email) user.email = email;
    if (password) user.password = await bcrypt.hash(password, 10);

    res.json({ message: 'Perfil actualizado exitosamente' });
  } catch (error) {
    res.status(500).json({ message: 'Error del servidor' });
  }
});

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
