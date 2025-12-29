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
    const querySelectLibros = "SELECT * FROM libros ";
    const [resultados] = await conn.query(querySelectLibros);

    await conn.end();

    res.json(resultados);
  } catch (err) {
    console.error("Error al obtener los libros:", err);
    res.status(500).json({ error: "Error al obtener los libros" });
  }
});
