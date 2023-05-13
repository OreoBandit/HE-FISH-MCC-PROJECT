var express = require('express');
var router = express.Router();
var database = require('./connect');

/* GET users listing. */
router.get('/', function (req, res, next) {
  const q = "select * from users"
  database.query(q, (error, result) => {
    if (error) {
      error = "an Error occured";
      throw (error);
      // res.send("an error occured")
    }
    res.send(result);
  })

});

//USER DETAIL
router.post('/GetUser/:id', (req, res) => {
  const p=req.body;
  const id = req.params.id
  q = `select * from users where id = ${p.id}`
  database.query(q, (error, result) => {
    if (error) {
      throw error
    }
    res.send(result[0]);
  })
})


// register user
router.post('/registerUser', (req, res) => {
  const data = req.body
  const q = `insert into users (email, username, pass, token)
              values ('${data.email}', '${data.username}', '${data.pass}', 12345)`

  database.query(q, (error, result) => {
    if (error) {
      throw error
    }
    res.send(result)
  }) 
})


//CEK DUPLI
router.post('/RegisterCheckUsername', (req, res) => {
  const data = req.body
  const q = `SELECT * FROM users u WHERE u.username LIKE '${data.username}'`

  db.query(q, (error, result) => {
    if(error) {
      throw error
    }
    if(result.length <= 0){
      res.sendStatus(404)
    }
    res.sendStatus(200)
  })
})

router.post('/RegisterCheckEmail', (req, res) => {
  const data = req.body
  const q = `SELECT * FROM users WHERE email = '${data.email}'`

  db.query(q, (error, result) => {
    if(error) {
      throw error
    }
    if(result.length <= 0){
      res.sendStatus(404)
    }
    res.sendStatus(200)
  })
})


//LOGIN
router.post('/login', (req, res) => {
  data = req.body
  q = `select * from users where username = '${data.username}' and pass = '${data.pass}'`
  database.query(q, (error, result) => {
    if (error) {
      throw error
    }
    res.send(result)
  })
})


module.exports = router;
