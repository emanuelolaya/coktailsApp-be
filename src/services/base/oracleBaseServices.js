const oracledb = require('oracledb')
const { OraDbConfig } = require('../../config/oraDbConfig')

const sworm = require('sworm')

function getOracleConnection () {
  const db = sworm.db()
  const connectConfig = {
    driver: 'oracle',
    config: OraDbConfig
  }
  // return oracledb.getConnection(OraDbConfig)
  return db.connect(connectConfig)
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
  try {
    console.log('OraDbConfig', OraDbConfig)
    const conn = await oracledb.getConnection(OraDbConfig)
    const result = await conn.execute('SELECT * FROM V$VERSION')
    console.log(result.rows)
    return result.rows
  } catch (error) {
    console.error(error)
  }
}

module.exports = {
  getOracleConnection,
  testConnection,
  getVersion
}
