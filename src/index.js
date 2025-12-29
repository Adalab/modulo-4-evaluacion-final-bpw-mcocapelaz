require("dotenv").config();
const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");
const app = express();

app.use(cors());
app.use(express.json({ limit: "25Mb" }));

const port = 3000;
app.listen(port, () => {
  console.log(`Uh! El servidor ya está arrancado: <http://localhost:${port}/>`);
});

const getConnection = async () => {
  try {
    const datosConexion = {
      host: process.env.MYSQL_HOST,
      user: process.env.MYSQL_USER,
      password: process.env.MYSQL_PASSWORD,
      database: process.env.MYSQL_DATABASE,
    };
    const conn = await mysql.createConnection(datosConexion);
    await conn.connect();
    return conn;
  } catch (error) {
    console.error("Error de conexión a la base de datos:", error);
    throw error;
  }
};

app.get("/libros", async (req, res) => {
  try {
    const conn = await getConnection();
    const querySeleccLibros = "SELECT * FROM libros ";
    const [resultados] = await conn.query(querySeleccLibros);

    await conn.end();

    res.json(resultados);
  } catch (err) {
    console.error("Error al obtener los libros:", err);
    res.status(500).json({ error: "Error al obtener los libros" });
  }
});

app.post("/libros", async (req, res) => {
  try {
    const conn = await getConnection();
    const { titulo, autora, estado, genero } = req.body;
    const queryInsertarLibro =
      "INSERT INTO libros (titulo, autora, estado, genero) VALUES (?, ?, ?, ?)";

    const [resultados] = await conn.query(queryInsertarLibro, [
      titulo,
      autora,
      estado,
      genero,
    ]);

    await conn.end();

    res.status(201).json({
      message: "Libro creado",
      id: resultados.insertId,
    });
  } catch (err) {
    console.error("Error al insertar el libro:", err);
    res.status(500).json({ error: "Error al crear el libro" });
  }
});

app.put("/libros/:id_libros", async (req, res) => {
  try {
    const conn = await getConnection();
    const libroId = req.params.id_libros;
    const { titulo, autora, estado, genero } = req.body;
    const queryActualizarLibro =
      "UPDATE libros SET titulo=?, autora=?, estado=?, genero=? WHERE id_libros=?";

    const [resultados] = await conn.query(queryActualizarLibro, [
      titulo,
      autora,
      estado,
      genero,
      libroId,
    ]);

    await conn.end();

    if (resultados.affectedRows === 0) {
      res.status(404).json({ error: "Libro no encontrado" });
      return;
    }

    res.status(200).json({
      message: "Libro actualizado",
    });
  } catch (err) {
    console.error("Error al actualizar el libro:", err);
    res.status(500).json({ error: "Error al actualizar el libro" });
  }
});

app.delete("/libros/:id_libros", async (req, res) => {
  try {
    const conn = await getConnection();
    const libroId = req.params.id_libros;
    const queryEliminarLibro = "DELETE FROM libros WHERE id_libros=?;";
    const [resultados] = await conn.query(queryEliminarLibro, [libroId]);
    await conn.end();

    if (resultados.affectedRows === 0) {
      res.status(400).json({ error: "Libro no encontrado" });
      return;
    }
    res.json({
      message: "Libro eliminado",
    });
  } catch (err) {
    console.error("Error al eliminar el libro:", err);
    res.status(500).json({ error: "Error al eliminar el libro" });
  }
});
