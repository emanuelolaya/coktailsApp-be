var sworm = require("sworm");
const { OraDbConfig } = require("../config/oraDbConfig");

function testConnection() {
  return new Promise((res) => {
    var db = sworm.db();
    let connectConfig = {
      driver: "oracle",
      config: OraDbConfig,
    };
    db.connect(connectConfig)
      .then((conn) => {
        console.log("Oracle connection successful!");
        res(true);
      })
      .catch((error) => {
        console.log("Oracle connection fail", error);
        res(false);
      });
  });
}

function getConnection() {
  var db = sworm.db();
  let connectConfig = {
    driver: "oracle",
    config: OraDbConfig,
  };
  return db.connect(connectConfig);
}

module.exports = {
  testConnection,
  getConnection,
};
