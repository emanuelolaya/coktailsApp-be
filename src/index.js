// load .env file
require("dotenv").config();

const express = require("express");
const { randomCocktail } = require("./services/openAIServices");
const { testConnection } = require("./services/oracleServices");
const { createPresignedUrlWithClient } = require("./services/awsServices");

const PORT = process.env.PORT || 3001;

const app = express();
app.disable("x-powered-by");
// app.use(express.json())

app.get("/ping", (req, res) => {
  res.send("pong");
});

app.get("/api/cocktail/random", async (req, res) => {
  const cocktail = await randomCocktail();
  res.json({ cocktail });
});

app.get("/api/oracle/test", async (req, res) => {
  const connection = await testConnection();
  res.json({ connection });
});

// app.get("/api/ingredients", async (req, res) => {
//   var person = db.model({ table: "people" });
//   const connection = await testConnection();
//   res.json({ connection });
// });

app.use((req, res) => {
  res.status(404).json({ message: "Not found" });
});

app.get("/api/test", async (req, res) => {
  const url = await createPresignedUrlWithoutClient({
    region: "us-east-2",
    bucket: "cocktail-app-files",
    key: "/imgs/tequila-blanco.png",
  });
  res.json(url);
});

app.listen(PORT, () => {
  console.log(`Server listening on port http://localhost:${PORT}`);
});
