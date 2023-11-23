const { createPool } = require("mysql2/promise");

const conexion = createPool({
  host: "localhost",
  user: "root",
  password: "password",
  port: 3306,
  database: "blog"
})

module.exports = {
  conexion
}