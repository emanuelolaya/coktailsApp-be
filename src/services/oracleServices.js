const oracledb = require('oracledb')

const dbConfig = {
  user: 'APP_USER',
  password: 'Cocktail2023*',
  connectString:
    '(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.us-ashburn-1.oraclecloud.com))(connect_data=(service_name=g34127bafa0e1a3_e2jzcbmwmjjk2fiz_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))',
  externalAuth: false
}

async function testConnection () {
  try {
    const conn = await oracledb.getConnection(dbConfig)
    console.log('Oracle connection successful!', conn)
    return true
  } catch (error) {
    console.error(error)
  }
}

module.exports = {
  testConnection
}
