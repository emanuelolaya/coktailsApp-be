const express = require('express')
// const { findAvailablePort } = require('./utils/utils')
const { randomCocktail } = require('./services/openAIServices')
const { testConnection, getVersion } = require('./services/oracleServices')
const {
  getAllCocktails,
  createCocktail,
  getCocktailById,
  getMyBar,
  getMyShoppingList,
  addResourceToMyBar,
  addResourceToShoppingList,
  removeResourceFromMyBar,
  removeResourceFromShoppingList
} = require('./services/oracleServices')
const { createPresignedUrlWithoutClient } = require('./services/awsServices')

require('dotenv').config()

const PORT = process.env.PORT || 3001

const app = express()
app.disable('x-powered-by')
app.use(express.json())

app.get('/ping', (req, res) => {
  res.send('pong')
})

app.get('/api/oracle/test', async (req, res) => {
  const connection = await testConnection()
  res.json({ connection })
})

app.get('/api/oracle/version', async (req, res) => {
  const version = await getVersion()
  res.json({ version })
})

app.get('/api/cocktails', async (req, res) => {
  const cocktails = await getAllCocktails()
  res.json({ cocktails })
})

app.get('/api/cocktails/:id', async (req, res) => {
  const { id } = req.params
  if (isNaN(id)) {
    return res.status(400).json({ error: 'Invalid ID' })
  }
  const cocktail = await getCocktailById(id)
  res.json({ cocktail })
})

app.post('/api/cocktails', async (req, res) => {
  const {
    cocktail_name,
    cocktail_description,
    cocktail_glass_id,
    cocktail_img_url,
    cocktail_taste,
    cocktail_color,
    cocktail_alcohol_percentage,
    cocktail_author_id,
    cocktail_preparacion,
    cocktail_resources_json
  } = req.body
  const cocktail = {
    name: cocktail_name,
    description: cocktail_description,
    glassId: cocktail_glass_id,
    imgUrl: cocktail_img_url,
    taste: cocktail_taste,
    color: cocktail_color,
    alcoholPercentage: cocktail_alcohol_percentage,
    authorId: cocktail_author_id,
    preparacion: cocktail_preparacion,
    resourcesJson: cocktail_resources_json
  }
  const result = await createCocktail(cocktail)
  if (result) {
    res.status(201).json({ result })
  } else {
    res.status(500).json({ message: 'Failed to create cocktail' })
  }
})

app.get('/api/mybar/user/:userid', async (req, res) => {
  const { userid } = req.params
  if (isNaN(userid)) {
    return res.status(400).json({ error: 'Invalid ID' })
  }
  const myBarList = await getMyBar(userid)
  res.json({ myBarList })
})

app.post('/api/mybar/add', async (req, res) => {
  const { userId, resourceId } = req.body
  if (isNaN(userId) || isNaN(resourceId)) {
    return res.status(400).json({ error: 'Invalid IDs' })
  }
  const ress = await addResourceToMyBar(userId, resourceId)
  res.json({ ress })
})

app.post('/api/mybar/remove', async (req, res) => {
  const { userId, resourceId } = req.body
  if (isNaN(userId) || isNaN(resourceId)) {
    return res.status(400).json({ error: 'Invalid IDs' })
  }
  const ress = await removeResourceFromMyBar(userId, resourceId)
  res.json({ ress })
})

app.get('/api/shoppinglist/user/:userid', async (req, res) => {
  const { userid } = req.params
  if (isNaN(userid)) {
    return res.status(400).json({ error: 'Invalid ID' })
  }
  const shoppingList = await getMyShoppingList(userid)
  res.json({ shoppingList })
})

app.post('/api/shoppinglist/add', async (req, res) => {
  const { userId, resourceId } = req.body
  if (isNaN(userId) || isNaN(resourceId)) {
    return res.status(400).json({ error: 'Invalid IDs' })
  }
  const result = await addResourceToShoppingList(userId, resourceId)
  res.json({ result })
})

app.post('/api/shoppinglist/remove', async (req, res) => {
  const { userId, resourceId } = req.body
  if (isNaN(userId) || isNaN(resourceId)) {
    return res.status(400).json({ error: 'Invalid IDs' })
  }
  const result = await removeResourceFromShoppingList(userId, resourceId)
  res.json({ result })
})

app.get('/api/cocktail/random', async (req, res) => {
  const cocktail = await randomCocktail()
  res.json({ cocktail })
})

app.get('/api/test', async (req, res) => {
  const url = await createPresignedUrlWithoutClient({
    region: 'us-east-2',
    bucket: 'cocktail-app-files',
    key: 'imgs/no-image.png'
  })
  res.json({ url })
})

app.use((req, res) => {
  res.status(404).json({ message: 'Not found' })
})

app.listen(PORT, () => {
  console.log(`Server listening on port http://localhost:${PORT}`)
})
