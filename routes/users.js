const express = require("express");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const getConnection = require("../config/database");
const router = express.Router();

router.post("/registro", async (req, res) => {
  const { nombre, email, fecha_registro, password } = req.body;

  if (!nombre || !email || !fecha_registro || !password) {
    return res.status(400).json({ error: "Todos los campos son obligatorios" });
  }

  try {
    const passwordHash = await bcrypt.hash(password, 10);
    const conn = await getConnection();
    const sql = "INSERT INTO usuarias (nombre, email, fecha_registro, password) VALUES (?, ?, ?, ?)";

    await conn.query(sql, [nombre, email, fecha_registro, passwordHash]);
    await conn.end();

    res.status(201).json({ message: "Usuaria registrada correctamente" });
  } catch (error) {
    console.error("Error:", error);
    if (error.code === "ER_DUP_ENTRY") {
      return res.status(400).json({ error: "El email ya está registrado" });
    }
    res.status(500).json({ error: "Error del servidor" });
  }
});

module.exports = router;
