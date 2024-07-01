const db = require('../config/db');

const index = (req, res) => {
    const sql = "SELECT * FROM Peliculas";

    db.query(sql, (error, rows) => {
        if (error) {
            res.status(500).json({error: "Intente más tarde."});
        }

        res.json(rows);
    });
};
const show = (req, res) => {

    const { id } = req.params;

    const sql = 'SELECT * FROM Peliculas WHERE id = ?';

    db.query(sql, [id], (error,rows) =>{
        if (error) {
            res.status(500).json({error: "Intente más tarde."});
        }

        if (rows.length == 0) {
            return res.status(404).json({error: "No existe el producto"})
        }
        
        res.json(rows[0]);
    });

    // Busca la película con el ID proporcionado en los parámetros de la ruta
    const pelicula = peliculasLista.find(pelicula => pelicula.id == req.params.id);
    if (!pelicula) {
        // Si no se encuentra la película, devuelve un error 404
        return res.status(404).json({ error: "No existe la película." });
    }
    // Si se encuentra la película, la devuelve en la respuesta
    res.send(pelicula);
}
module.exports= {
    index,
    show,
};