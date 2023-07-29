const express = require("express");
const oracledb = require("oracledb");
const { OpenAI } = require("openai");

const apiOpenAI = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY
});

function sleep(ms) {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}

function showOpenAIError(error) {
  console.error(`OpenAi Error: 
    status=${error.status}, 
    message=${error.message}, 
    code=${error.code}, 
    type=${error.type} `);
}

const randomCocktail = async () => {
  try {
    const result = await apiOpenAI.chat.completions.create({
      model: 'gpt-3.5-turbo',
      messages: [{
        role: 'system',
        content: 'Eres un experto mixólogo virtual con acceso a una amplia base de datos de ingredientes y recetas de cócteles.'
      }, {
        role: 'user',
        content: 'Genera un cóctel aleatorio con sus ingredientes y su preparación. Puedes incluir cualquier combinación de licores, frutas, jarabes u otros ingredientes comunes en cócteles. Asegúrate de proporcionar los pasos detallados para la preparación del cóctel.'
      }]
    });
    return result?.choices[0]?.message?.content;
  } catch (error) {  
    if (error instanceof OpenAI.APIError) {
      showOpenAIError(error)
    } else {
      console.log(error);
    }
  }
}

const dbConfig = {
  user: "ADMIN",
  password: "fBj32T6tzxmbt5x",
  connectString:
    "(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.us-ashburn-1.oraclecloud.com))(connect_data=(service_name=g34127bafa0e1a3_e2jzcbmwmjjk2fiz_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))",
  externalAuth: false,
};

const PORT = process.env.PORT || 3001;

const app = express();

oracledb.getConnection(dbConfig).then((connection) => {
  //console.log("connection", connection);
});

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});

app.get("/api", (req, res) => {
  res.json({ message: "Hola desde el servidor!" });
});

app.get("/api/cocktail/random", async (req, res) => {
  const cocktail = await randomCocktail();
  res.json({ cocktail });
});