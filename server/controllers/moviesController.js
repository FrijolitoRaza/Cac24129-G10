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

    // Comprobación para asegurarse de que el id es un número
    const numericId = parseInt(id, 10);
    if (Number.isNaN(numericId)) {
        return res.status(400).json({ error: "El ID debe ser un número." });
    };

    const sql = "SELECT * FROM Peliculas WHERE id = ?";

    db.query(sql, [id], (error,rows) =>{
        if (error) {
            return res.status(500).json({error: "Intente más tarde."});
        }

        if (rows.length = 0) {
            return res.status(404).json({error: "No existe la pelicula."})
        }
        
        res.json(rows[0]);
    });
}

const store = (req, res) => {
    const {nombre, precio, stock } = req.body;
    
    const sql = "INSERT INTO Peliculas (nombre, precio, stck) VALUES (?, ?, ?)";
    db.query(sql, [nombre, precio, stock], (error, result) => {
        if (error) {
            return res.status(500).json({error: "Intente más tarde."});
        };

        const producto = {
            ...req.body, id: result.insertId
        };

        res.json(producto);
    });
};

const update = (req, res)=> {
    const {id} = req.params;
    const {nombre, stock, precio} = req.body;

    const sql = "UPDATE peliculas SET nombre = ?, stock = ?, precio = ? WHERE id = ?";
    db.query(sql, [nombre, stock, precio, id], (error, result) => {
        if (error) {
            return res.status(500).json({error: "Intente más tarde."});
        }

        if (result.affectedRows == 0) {
            return res.status(404).json({error: "No existe la pelicula."})
        }

        const producto = {...req.body, ...req.params}

        res.json(producto);
    });
};

const destroy = (req, res) => {
    const {id} = req.params;

    const sql = 'DELETE FROM Peliculas WHERE id = ?'
    db.query(sql, [id], (error, result) => {
        if (error) {
            return res.status(500).json({error: "Intente más tarde."});
        }
        if (result.affectedRows == 0) {
            return res.status(404).json({error: "No existe la pelicula."})
        }
        
        res.json({mensaje: `Producto ${id} borrado`})

    });


};



module.exports= {
    index,
    show,
    store,
    update,
    destroy,
};