const express = require("express");
const neo4j = require('neo4j-driver')

const PORT = process.env.PORT || 3001;

const app = express();

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});

app.get("/api", (req, res) => {
    res.json({ message: "Hola desde el servidor!" });
});