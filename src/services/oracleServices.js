const oracledb = require('oracledb')
const sworm = require('sworm')
const { OraDbConfig, swormDbConfig, ORA_CONFIG } = require('../config/oraDbConfig')

async function getSwormInstance () {
  return sworm.db(swormDbConfig)
}

async function getOracleConnection (source = null) {
  if (source === 'sworm') {
    const db = sworm.db()
    return await db.connect(swormDbConfig)
  } else {
    return await oracledb.getConnection(OraDbConfig)
  }
}

function testConnection () {
  // const conn = await oracledb.getConnection(OraDbConfig)
  // console.log('Connection was successful!')
  // await conn.close()
  return new Promise((resolve, _reject) => {
    const db = sworm.db()
    const connectConfig = {
      driver: 'oracle',
      config: OraDbConfig
    }
    db.connect(connectConfig)
      .then((conn) => {
        console.log('Oracle connection successful!')
        resolve(true)
      })
      .catch((error) => {
        console.log('Oracle connection fail', error)
        resolve(false)
      })
  })
}

async function getVersion () {
  let conn
  try {
    conn = await getOracleConnection()
    const result = await conn.execute('SELECT BANNER, BANNER_FULL, BANNER_LEGACY FROM V$VERSION', [], {
      outFormat: oracledb.OUT_FORMAT_OBJECT
    })
    return result.rows
  } catch (error) {
    console.error('ERROR: ', error)
  } finally {
    if (conn) await conn.close()
  }
}

async function getAllCocktails () {
  let conn
  try {
    conn = await getOracleConnection()
    const params = {
      cocktail_cursor: { type: oracledb.DB_TYPE_CURSOR, dir: oracledb.BIND_OUT }
    }
    const result = await conn.execute('BEGIN GET_ALL_COCKTAILS_DATA(:cocktail_cursor); END;', params, {
      outFormat: oracledb.OUT_FORMAT_OBJECT,
      resultSet: true
    })
    const cocktailsCursor = result.outBinds.cocktail_cursor
    const cocktails = await cocktailsCursor.getRows(ORA_CONFIG.PAGE_SIZE)
    return cocktails
  } catch (error) {
    console.error('ERROR: ', error)
  } finally {
    if (conn) await conn.close()
  }
}

async function getCocktailById (cocktailId) {
  let conn
  try {
    conn = await getOracleConnection()
    const parsedCocktailId = parseInt(cocktailId)
    const params = {
      id_cocktail_num: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_IN, val: parsedCocktailId },
      cocktail_cursor: { type: oracledb.DB_TYPE_CURSOR, dir: oracledb.BIND_OUT }
    }
    const result = await conn.execute('BEGIN GET_COCKTAIL_BY_ID(:id_cocktail_num, :cocktail_cursor); END;', params, {
      outFormat: oracledb.OUT_FORMAT_OBJECT,
      resultSet: true
    })
    const cocktailsCursor = result.outBinds.cocktail_cursor
    if (!cocktailsCursor) return null

    const cocktails = await cocktailsCursor.getRows(ORA_CONFIG.PAGE_SIZE)
    if (cocktails.length === 0) return null

    return cocktails
  } catch (error) {
    console.error('ERROR: ', error)
  } finally {
    if (conn) await conn.close()
  }
}

async function createCocktail (cocktailData) {
  let conn
  try {
    conn = await getOracleConnection()
    const params = {
      cocktail_name: { type: oracledb.STRING, dir: oracledb.BIND_IN, val: cocktailData.name },
      cocktail_description: { type: oracledb.STRING, dir: oracledb.BIND_IN, val: cocktailData.description },
      cocktail_glass_id: { type: oracledb.NUMBER, dir: oracledb.BIND_IN, val: cocktailData.glassId },
      cocktail_img_url: { type: oracledb.STRING, dir: oracledb.BIND_IN, val: cocktailData.imgUrl },
      cocktail_taste: { type: oracledb.STRING, dir: oracledb.BIND_IN, val: cocktailData.taste },
      cocktail_color: { type: oracledb.STRING, dir: oracledb.BIND_IN, val: cocktailData.color },
      cocktail_alcohol_percentage: { type: oracledb.STRING, dir: oracledb.BIND_IN, val: cocktailData.alcoholPercentage },
      cocktail_author_id: { type: oracledb.NUMBER, dir: oracledb.BIND_IN, val: cocktailData.authorId },
      cocktail_preparacion: { type: oracledb.STRING, dir: oracledb.BIND_IN, val: cocktailData.preparacion },
      cocktail_resources_json: { type: oracledb.CLOB, dir: oracledb.BIND_IN, val: JSON.stringify(cocktailData.resourcesJson) },
      sp_result: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT }
    }
    const result = await conn.execute('BEGIN CREATE_COCKTAIL(:cocktail_name, :cocktail_description, :cocktail_glass_id, :cocktail_img_url, :cocktail_taste, :cocktail_color, :cocktail_alcohol_percentage, :cocktail_author_id, :cocktail_preparacion, :cocktail_resources_json, :sp_result); END;', params)
    const spResult = result.outBinds.sp_result
    if (spResult === 1) {
      return true
    }

    return false
  } catch (error) {
    console.error('ERROR: ', error)
    return false
  } finally {
    if (conn) await conn.close()
  }
}

async function getMyBar (userId) {
  let conn
  try {
    conn = await getOracleConnection()
    const parsedUserId = parseInt(userId)
    const params = {
      user_id: { type: oracledb.NUMBER, dir: oracledb.BIND_IN, val: parsedUserId },
      my_bar_cursor: { type: oracledb.DB_TYPE_CURSOR, dir: oracledb.BIND_OUT }
    }
    const result = await conn.execute('BEGIN GET_MY_BAR(:user_id, :my_bar_cursor); END;', params, {
      outFormat: oracledb.OUT_FORMAT_OBJECT,
      resultSet: true
    })
    const mybarCursor = result.outBinds.my_bar_cursor
    if (!mybarCursor) return []

    const mybarList = await mybarCursor.getRows(ORA_CONFIG.PAGE_SIZE)
    if (mybarList.length === 0) return []

    return mybarList
  } catch (error) {
    console.error('ERROR: ', error)
  } finally {
    if (conn) await conn.close()
  }
}

async function getMyShoppingList (userId) {
  let conn
  try {
    conn = await getOracleConnection()
    const parsedUserId = parseInt(userId)
    const params = {
      user_id: { type: oracledb.NUMBER, dir: oracledb.BIND_IN, val: parsedUserId },
      my_shopping_list_cursor: { type: oracledb.DB_TYPE_CURSOR, dir: oracledb.BIND_OUT }
    }
    const result = await conn.execute('BEGIN GET_MY_SHOPPING_LIST(:user_id, :my_shopping_list_cursor); END;', params, {
      outFormat: oracledb.OUT_FORMAT_OBJECT,
      resultSet: true
    })
    const myShoppingListCursor = result.outBinds.my_shopping_list_cursor
    if (!myShoppingListCursor) return []

    const myShoppingList = await myShoppingListCursor.getRows(ORA_CONFIG.PAGE_SIZE)
    if (myShoppingList.length === 0) return []

    return myShoppingList
  } catch (error) {
    console.error('ERROR: ', error)
  } finally {
    if (conn) await conn.close()
  }
}

async function addResourceToShoppingList (userId, resourceId) {
  let conn
  try {
    conn = await getOracleConnection()
    const params = {
      user_id: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_IN, val: userId },
      resource_id: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_IN, val: resourceId },
      sp_result: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_OUT }
    }
    const result = await conn.execute('BEGIN add_resource_shopping_list(:user_id, :resource_id, :sp_result); END;', params)
    const spResult = result.outBinds.sp_result
    if (spResult === 1) return true
    return false
  } catch (error) {
    console.error('ERROR: ', error)
  } finally {
    if (conn) await conn.close()
  }
}

async function addResourceToMyBar (userId, resourceId) {
  let conn
  try {
    conn = await getOracleConnection()
    const params = {
      user_id: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_IN, val: userId },
      resource_id: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_IN, val: resourceId },
      sp_result: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_OUT }
    }
    const result = await conn.execute('BEGIN add_resource_to_mybar(:user_id, :resource_id, :sp_result); END;', params)
    const spResult = result.outBinds.sp_result
    if (spResult === 1) return true
    return false
  } catch (error) {
    console.error('ERROR: ', error)
  } finally {
    if (conn) await conn.close()
  }
}

async function removeResourceFromShoppingList (userId, resourceId) {
  let conn
  try {
    conn = await getOracleConnection()
    const params = {
      user_id: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_IN, val: userId },
      resource_id: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_IN, val: resourceId },
      sp_result: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_OUT }
    }
    const result = await conn.execute('BEGIN remove_resource_shopping_list(:user_id, :resource_id, :sp_result); END;', params)
    const spResult = result.outBinds.sp_result
    if (spResult === 1) return true
    return false
  } catch (error) {
    console.error('ERROR: ', error)
  } finally {
    if (conn) await conn.close()
  }
}

async function removeResourceFromMyBar (userId, resourceId) {
  let conn
  try {
    conn = await getOracleConnection()
    const params = {
      user_id: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_IN, val: userId },
      resource_id: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_IN, val: resourceId },
      sp_result: { type: oracledb.DB_TYPE_NUMBER, dir: oracledb.BIND_OUT }
    }
    const result = await conn.execute('BEGIN remove_resource_my_bar(:user_id, :resource_id, :sp_result); END;', params)
    const spResult = result.outBinds.sp_result
    if (spResult === 1) return true
    return false
  } catch (error) {
    console.error('ERROR: ', error)
  } finally {
    if (conn) await conn.close()
  }
}

module.exports = {
  testConnection,
  getVersion,
  getOracleConnection,
  getSwormInstance,
  getAllCocktails,
  getCocktailById,
  // getAllCocktail,
  createCocktail,
  getMyBar,
  getMyShoppingList,
  addResourceToMyBar,
  addResourceToShoppingList,
  removeResourceFromMyBar,
  removeResourceFromShoppingList
}
