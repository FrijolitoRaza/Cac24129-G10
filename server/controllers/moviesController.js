const db = require('../config/db');

const index = (req, res) => {
    const sql = "SELECT * FROM Peliculas";

    db.query(sql, (error, rows) => {
        if (error) {
            return res.status(500).json({error: "Intente más tarde."});
        }

        res.json(rows);
    });
};

const show = (req, res) => {
    const { id } = req.params;

    //Comprobación para asegurarse de que el id es un número
    const numericId = parseInt(id, 10);
    if (Number.isNaN(numericId)) {
        return res.status(400).json({ error: "El ID debe ser un número." });
    };

    const sql = "SELECT * FROM Peliculas WHERE ID_Pelicula = ?";

    db.query(sql, [id], (error,rows) =>{
        if (error) {
            return res.status(500).json({error: "Intente más tarde. -- Consulta"});
        }

        if (rows.length === 0) {
            return res.status(404).json({error: "No existe la pelicula."})
        }
        
        res.json(rows[0]);
    });
};

//"ID_Pelicula": 14; "Titulo": "Jurassic Park"; "Fecha_Lanzamiento": "1993-06-11T03:00:00.000Z"; "Duracion": 127; "Sinopsis": "Un parque temático lleno de dinosaurios clonados se convierte en un desastre cuando las criaturas escapan y causan el caos."; "Imagen": "jurassic_park.jpg"; "Genero": "Ciencia ficción"; "Restriccion_Edad": 13; 

const store = (req, res) => {
    const { Titulo, Fecha_Lanzamiento, Duracion, Sinopsis, Imagen, Genero, Restriccion_Edad } = req.body;
    
//    const sql = "INSERT INTO Peliculas (Actor, Fecha_Lanzamiento, Duracion, Fecha_Lanzamiento, ID_Genero, Restriccion, Sinopsis, Titulo ) VALUES (?, ?, ?, ?, ?, ?, ?, ? )";
    const sql = "INSERT INTO Peliculas (Titulo, Fecha_Lanzamiento, Duracion, Sinopsis, Imagen, Genero, Restriccion_Edad) VALUES (?, ?, ?, ?, ?, ?, ?)";
    db.query(sql, [Titulo, Fecha_Lanzamiento, Duracion, Sinopsis, Imagen, Genero, Restriccion_Edad], (error, result) => {        //req.file.filename
        if (error) {
            return res.status(500).json({error: "Intente más tarde._STORE_"});
        };

        const pelicula = {
            ID_Pelicula: result.insertId,
            Titulo,
            Fecha_Lanzamiento,
            Duracion,
            Sinopsis,
            Imagen,
            Genero,
            Restriccion_Edad
            //Imagen: req.file.filename
            //...req.body, id: result.insertId
        };

        res.json(pelicula);
    });
};

const update = (req, res)=> {
    const { id } = req.params;
    const { Titulo, Fecha_Lanzamiento, Duracion, Sinopsis, Imagen, Genero, Restriccion_Edad} = req.body;

    const sql = "UPDATE Peliculas SET Titulo = ?, Fecha_Lanzamiento = ?, Duracion = ?, Sinopsis = ?, Imagen = ?, Genero = ?, Restriccion_Edad = ? WHERE ID_Pelicula = ?";
    
    // Titulo, Fecha_Lanzamiento, Duracion, Sinopsis, Imagen, Genero, Restriccion_Edad
    db.query(sql, [Titulo, Fecha_Lanzamiento, Duracion, Sinopsis, Imagen, Genero, Restriccion_Edad, id], (error, result) => {
    
        if (error) {
            return res.status(500).json({error: "Intente más tarde."});
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({error: "No existe la pelicula."})
        }

        const pelicula = { ID_Pelicula: id, Titulo, Fecha_Lanzamiento, Duracion, Sinopsis, Imagen, Genero, Restriccion_Edad };     //...req.body, ...req.params}
        res.json(pelicula);

    });
};

const destroy = (req, res) => {
    const { id } = req.params;

    const sql = 'DELETE FROM Peliculas WHERE ID_Pelicula = ?'
    db.query(sql, [id], (error, result) => {
        if (error) {
            return res.status(500).json({error: "Intente más tarde."});
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({error: "No existe la pelicula."})
        }
        
        res.json({mensaje: `Pelicula ${id} borrado`})

    });
};

module.exports= {
    index,
    show,
    store,
    update,
    destroy,
};