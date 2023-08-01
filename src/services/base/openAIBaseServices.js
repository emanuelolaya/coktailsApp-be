const { apiOpenAI, showOpenAIError } = require('../../config/openAiConfig')
// require('dotenv').config()

const randomCocktail = async () => {
  try {
    const result = await apiOpenAI.chat.completions.create({
      model: 'gpt-3.5-turbo',
      messages: [
        {
          role: 'system',
          content:
            'Eres un experto mixólogo virtual con acceso a una amplia base de datos de ingredientes y recetas de cócteles.'
        },
        {
          role: 'user',
          content:
            'Genera un cóctel aleatorio con sus ingredientes y su preparación. Puedes incluir cualquier combinación de licores, frutas, jarabes u otros ingredientes comunes en cócteles. Asegúrate de proporcionar los pasos detallados para la preparación del cóctel.'
        }
      ]
    })
    return result?.choices[0]?.message?.content
  } catch (error) {
    showOpenAIError(error)
  }
}

module.exports = {
  randomCocktail
}
