require('dotenv').config()
const ORA_CONFIG = {
  PAGE_SIZE: 200
}

const OraDbConfig = {
  user: process.env.NODE_ORACLEDB_USER,
  password: process.env.NODE_ORACLEDB_PASSWORD,
  connectString: process.env.NODE_ORACLEDB_CONNECTIONSTRING,
  externalAuth: false,
  pool: true
}

const swormDbConfig = {
  driver: 'oracle',
  config: OraDbConfig
}

module.exports = {
  OraDbConfig,
  swormDbConfig,
  ORA_CONFIG
}
