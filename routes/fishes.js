

var express = require('express');
var router = express.Router();
var database = require('./connect');
var roam = require('multer')
var storage =  roam.diskStorage({
    destination: function(req,file,contents){
        contents(null,'./assets')
    }, filename: function(req,file,contents){
        contents(null,file.oriName)
    }
})
var upload = roam({storage: storage})


//GET ALL FISH LIST
router.get('/',function(req,res,next){
    const q='select * from fishes'
    database.query(q,(error,result)=>{
        if(error){
            throw error
          }
        res.send(result)
    })
})


//GET FISH TYPE 
router.get('/fish-type', (req, res) => {
    const p = req.body;
    const type_name = req.params.type_name
    const q = `SELECT * FROM fishes f JOIN fish_types ft on f.fish_type_id = ft.fish_type_id JOIN users u on f.user_id = u.id where ft.type_name = '${type_name}'`
    database.query(q, (error, result) => {
        if(error){
            throw error
          }
          console.log(result)
        res.send(result)
    })
})

//FISH DETAIL QUERY
router.get('/get-fish', (req, res) => {
    const f=req.body;
    const id = req.query.id
    const q = `select * from fishes f where id = ${id}`
    a.query(q, (error, result) => {
        if(error){
            throw error
          }
        res.send(result[0])
    })
})


//FISH DETAIL PARAMETER
router.get('/get-fish/:id', (req, res) => {
    const id = req.params.id
    const q = `select * from fishes f where f.fishes_id = ${id}`
    database.query(q, (error, result) => {
        if(error){
            throw error
          }
        res.send(result[0])
    })
})


//INSERT FISH
// router.post('/insertFish', upload.single('image'), (req, res) => {
//     const data = req.body
//     const file = req.file
//     const path = `http://10.0.2.2:3000/${file.path.replace('\\', '/')}`
//     const q = `insert into fishes (user_id, fish_type_id, fish_name, fish_desc, fish_price, fish_image_path) 
//                 values (${data.user_id}, ${data.fish_type_id}, '${data.fish_name}', '${data.fish_desc}', ${data.fish_price}, '${path}')`
    
//     database.query(q, (error, result) => {
//         if(error){
//             throw error
//           }
//         res.send(result)
//     })
// })

router.post('/insertFish', upload.single('_image'), (req, res) => {
    const data = req.body
    // const file = req.file
    // const path = `http://10.0.2.2:3000/${file.path.replace('\\', '/')}`
    const q = `insert into fishes (user_id, fish_type_id, fish_name, fish_desc, fish_price, fish_image_path) 
                values (${data.user_id}, ${data.fish_type_id}, '${data.fish_name}', '${data.fish_desc}', ${data.fish_price}, '${data.fish_image_path}')`
    // console.log(path)
    database.query(q, (error, result) => {
        if(error){
            throw error
          }
        res.send(result)
    })
})


//UPDATE FISH (GANTI IMAGE)
router.put('/updateFishWithImage', upload.single('image'), (req, res) => {
    const data = req.body
    const file = req.file
    const path = `http://10.0.2.2:3000/${file.path.replace('\\', '/')}`
    const q = `update fishes set fish_type_id = ${data.fishType}, fish_name = '${data.name}', description = '${data.desc}', price = ${data.price}, image_path = '${filePath}' where fish_id = ${data.id}`
    database.query(q, (error, result) => {
        if(error){
            throw error
          }
        res.send(result)
    })
    res.json(file.path)
})

//UPDATE FISH TANPA GANTI IMAGE
router.post('/updateFish', upload.single('image'), (req, res) => {
    const data = req.body
    const file = req.file
    const path = `http://10.0.2.2:3000/${file.path.replace('\\', '/')}`
    const q = `update fishes set fish_type_id = ${data.fishType}, fish_name = '${data.name}', description = '${data.desc}', price = ${data.price} where fish_id = ${data.id}`
    database.query(q, (error, result) => {
        if(error){
            throw error
          }
        res.send(result)
    })
    res.json(file.path)
})

//DELETE FISH
router.delete('/deleteFish', (req, res) => {
    const data = req.body
    const q = `DELETE FROM fishes WHERE fish_id = ${data.id}`
    database.query(q, (error, result) => {
        if(error){
            throw error
          }
        res.send(result)
    })
})

module.exports = router;