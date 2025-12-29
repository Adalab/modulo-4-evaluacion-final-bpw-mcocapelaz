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
