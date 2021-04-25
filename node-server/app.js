// server/index.js
require('dotenv').config()

const express = require("express");

const PORT = process.env.PORT || 3001;

const app = express();

app.get("/api", (req, res) => {
    res.json({ message: "Hello from server!" });
});

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});

// ------ DATABASE ------

const { Pool } = require("pg")

const config  = {
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    host: process.env.DATABASE_HOST,
    database: process.env.DATABASE_NAME,
    port: process.env.DATABASE_PORT,
    ssl: {
        rejectUnauthorized: false
    },
}

const pool = new Pool(config)

// function callback(err, res) {
//     return res;
// }

var client

(async () => {
    client = await pool.connect();
    console.log("i got into this async function")
    // await client.query("SELECT * FROM events", callback);
    console.log(await sql("SELECT * FROM events"))
})()

async function sql(dbQuery) {
  var result
  await client.query(dbQuery, (err, res) => {
    result = res.rows
  })
  return result
}