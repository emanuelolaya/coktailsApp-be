const oracledb = require('oracledb')
const OraDbConfig = require('../config/oraDbConfig')

async function testConnection () {
  try {
    const conn = await oracledb.getConnection(OraDbConfig)
    console.log('Oracle connection successful!', conn)
    return true
  } catch (error) {
    console.error(error)
  }
}

module.exports = {
  testConnection
}
