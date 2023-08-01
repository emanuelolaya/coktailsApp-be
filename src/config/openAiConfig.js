const { OpenAI } = require('openai')
require('dotenv').config()

const apiOpenAI = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY
})

function showOpenAIError (error) {
  if (error instanceof OpenAI.APIError) {
    console.error(`OpenAi Error: 
    status=${error.status}, 
    message=${error.message}, 
    code=${error.code}, 
    type=${error.type} `)
  } else {
    console.log(error)
  }
}

module.exports = {
  apiOpenAI, showOpenAIError
}
