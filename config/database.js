const mysql = require("mysql2/promise");
require("dotenv").config();

const getConnection = async () => {
  const conn = await mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
  });
  return conn;
};

module.exports = getConnection;
