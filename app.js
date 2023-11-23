require("dotenv").config()
const http = require('http');
const express = require('express');
const cors = require("cors")
const app = express()
const postRouter = require("./routes/posts.routes")

app.use(express.json())
app.use(cors())
app.use('/api', postRouter)

const PORT = 3001

http.createServer(app).listen(PORT, () => {
  console.log(`Servidor listo en el http://localhost:${PORT}`);
});
