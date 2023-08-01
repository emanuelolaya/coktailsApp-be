const { getOracleConnection } = require('./oracleServices')
const { OraDbConfig } = require('../config/oraDbConfig')

const sworm = require('sworm')

function testConnection () {
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

function getConnection () {
  const db = sworm.db()
  const connectConfig = {
    driver: 'oracle',
    config: OraDbConfig
  }
  return db.connect(connectConfig)
}

module.exports = {
  testConnection,
  getConnection
}
