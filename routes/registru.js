var express = require("express");
var router = express.Router();
var mysql = require("mysql");

/**
 * IMPORTANT: add content type headers to be able to use req.body.*
  headers: {"Content-Type": "application/json"},
 */

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  database: "animal_register"
});

/**
 * run this before first USAGE to create registru TABLE
 */
router.get("/install", function (req, res, next) {
  pool.getConnection(function (err, connection) {
    if (err) throw err;
    const sql = `
    CREATE TABLE IF NOT EXISTS registru (id INT NOT NULL AUTO_INCREMENT, members TEXT NOT NULL, name TEXT NOT NULL, url TEXT NOT NULL, PRIMARY KEY (id)) ENGINE = InnoDB;
    `;
    connection.query(sql, function (err, results) {
      if (err) throw err;
      connection.release();
      res.redirect("/");
    });
  });
});

/**
 *
 */
router.get("/", function (req, res, next) {
  pool.getConnection(function (err, connection) {
    if (err) throw err;
    const sql = `SELECT id, nrCrotal, sex,  DATE_FORMAT(birthday, "%Y-%m-%d") as birthday, registrationDate, exitDate, motherId FROM registru`;
    connection.query(sql, function (err, results) {
      if (err) throw err;
      connection.release();
      res.json(results);
    });
  });
});

router.get("/miei", function (req, res, next) {
  pool.getConnection(function (err, connection) {
    if (err) throw err;
    const sql = `SELECT id, nrCrotal, sex,  DATE_FORMAT(birthday, "%Y-%m-%d") as birthday, registrationDate, exitDate, motherId 
    FROM registru 
    WHERE birthday < DATE_SUB(now(), INTERVAL 12 MONTH) `;
    connection.query(sql, function (err, results) {
      if (err) throw err;
      connection.release();
      res.json(results);
    });
  });
});

router.get("/mame", function (req, res, next) {
  pool.getConnection(function (err, connection) {
    if (err) throw err;
    const sql = `SELECT id, nrCrotal, sex,  DATE_FORMAT(birthday, "%Y-%m-%d") as birthday, registrationDate, exitDate, motherId
    FROM registru 
    WHERE sex="F" `;
    
    connection.query(sql, function (err, results) {
      if (err) throw err;
      connection.release();
      res.json(results);
    });
  });
});

/**
 *
 */
router.post("/create", function (req, res, next) {
  const members = req.body.members;
  const name = req.body.name;
  const url = req.body.url;

  pool.getConnection(function (err, connection) {
    if (err) throw err;
    const sql = `INSERT INTO registru (id, members, name, url) VALUES (NULL, ?, ?, ?);`;
    connection.query(sql, [members, name, url], function (err, results) {
      if (err) throw err;
      const id = results.insertId;
      connection.release();
      res.json({
        success: true,
        id
      });
    });
  });
});

/**
 *
 */
router.delete("/delete", function (req, res, next) {
  const id = req.body.id;

  pool.getConnection(function (err, connection) {
    if (err) throw err;
    const sql = `DELETE FROM registru WHERE id=?`;
    connection.query(sql, [id], function (err, results) {
      if (err) throw err;
      connection.release();
      res.json({ success: true });
    });
  });
});

/**
 *
 */
router.put("/update", function (req, res, next) {
  const id = req.body.id;
  const members = req.body.members;
  const name = req.body.name;
  const url = req.body.url;

  pool.getConnection(function (err, connection) {
    if (err) throw err;
    const sql = `UPDATE animal_register SET members=?, name=?, url=? WHERE id=?`;
    connection.query(sql, [members, name, url, id], function (err, results) {
      if (err) throw err;
      connection.release();
      res.json({ success: true });
    });
  });
});

module.exports = router;