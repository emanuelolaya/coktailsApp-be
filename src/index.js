const express = require('express')
const { randomCocktail } = require('./services/openAIServices')
const { testConnection } = require('./services/oracleServices')

const PORT = process.env.PORT || 3001

const app = express()
app.disable('x-powered-by')
// app.use(express.json())

app.get('/ping', (req, res) => {
  res.send('pong')
})

app.get('/api', (req, res) => {
  res.json({ message: 'Hola desde el servidor!' })
})

app.get('/api/cocktail/random', async (req, res) => {
  const cocktail = await randomCocktail()
  res.json({ cocktail })
})

app.get('/api/oracle/test', async (req, res) => {
  const connection = await testConnection()
  res.json({ connection })
})

app.use((req, res) => {
  res.status(404).json({ message: 'Not found' })
})

app.listen(PORT, () => {
  console.log(`Server listening on port http://localhost:${PORT}`)
})
