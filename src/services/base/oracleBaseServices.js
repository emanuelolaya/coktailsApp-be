const oracledb = require('oracledb')
const { OraDbConfig } = require('../../config/oraDbConfig')

async function getOracleConnection () {
  try {
    return await oracledb.getConnection(OraDbConfig)
  } catch (error) {
    console.error(error)
  }
}

async function testConnection () {
  try {
    const conn = await oracledb.getConnection(OraDbConfig)
    console.log('Connection was successful!')
    await conn.close()
  } catch (error) {
    console.error(error)
  }
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
