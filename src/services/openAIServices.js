const { OpenAI } = require("openai");

const apiOpenAI = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

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
      model: "gpt-3.5-turbo",
      messages: [
        {
          role: "system",
          content:
            "Eres un experto mixólogo virtual con acceso a una amplia base de datos de ingredientes y recetas de cócteles.",
        },
        {
          role: "user",
          content:
            "Genera un cóctel aleatorio con sus ingredientes y su preparación. Puedes incluir cualquier combinación de licores, frutas, jarabes u otros ingredientes comunes en cócteles. Asegúrate de proporcionar los pasos detallados para la preparación del cóctel.",
        },
      ],
    });
    return result?.choices[0]?.message?.content;
  } catch (error) {
    if (error instanceof OpenAI.APIError) {
      showOpenAIError(error);
    } else {
      console.log(error);
    }
  }
};

module.exports = {
  randomCocktail,
};
