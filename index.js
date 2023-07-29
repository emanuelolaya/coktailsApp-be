const express = require("express");
const oracledb = require("oracledb");

const dbConfig = {
  user: "ADMIN",
  password: "fBj32T6tzxmbt5x",
  connectString:
    "(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.us-ashburn-1.oraclecloud.com))(connect_data=(service_name=g34127bafa0e1a3_e2jzcbmwmjjk2fiz_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))",
  externalAuth: false,
};

const PORT = process.env.PORT || 3001;

const app = express();

oracledb.getConnection(dbConfig).then((connection) => {
  console.log("connection", connection);
});

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});

app.get("/api", (req, res) => {
  res.json({ message: "Hola desde el servidor!" });
});
