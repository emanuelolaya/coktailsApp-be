require('dotenv').config()

const OraDbConfig = {
  user: process.env.NODE_ORACLEDB_USER,
  password: process.env.NODE_ORACLEDB_PASSWORD,
  connectString: process.env.NODE_ORACLEDB_CONNECTIONSTRING,
  externalAuth: false,
  pool: true
}

module.exports = {
  OraDbConfig
}
