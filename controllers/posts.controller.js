const { conexion } = require("../config/database");

class postController {
  getPosts = async (req, res) => {
    try {
      const [rows] = await conexion.query(
        "SELECT id, titulo, autor, descripcion, DATE_FORMAT(fecha_publicacion, '%d-%m-%Y') as fecha_publicacion FROM posts WHERE active = true"
      );
      res.json(rows);
    } catch (error) {
      return res.status(500).json({ message: "Error al Obtener Posts" });
    }
  };

  createPost = async (req, res) => {
    const { titulo, autor, descripcion, fecha_publicacion } = req.body;

    try {
      const [rows] = await conexion.query("CALL crear_post(?, ?, ?, ?)", [
        titulo,
        autor,
        descripcion,
        fecha_publicacion,
      ]);
      res.json(rows[0]);
    } catch (error) {
      return res.status(500).json({ message: "Error al Crear Post" });
    }
  };

  deletePost = async (req, res) => {
    const { id } = req.params;

    try {
      const [rows] = await conexion.query("CALL eliminar_post(?)", [id]);
      res.json(rows[0]);
    } catch (error) {
      return res.status(500).json({ message: "Error al Eliminar Post" });
    }
  };
}

module.exports = new postController();
