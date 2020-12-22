const express = require('express');
const router = express.Router();
const pool = require('../connection');
const fileupload = require('express-fileupload');

router.use(fileupload());

router.post('/fileupload', async (req, res, next) => {
    console.log(req.files);
    console.log("req.files ", req.files)
    const file = req.files.tma;
    file.mv('fileUpload/'+ file.name, function(err,result){
        if(err){
            throw err;
        }
        res.send({
            success: true,
            message: 'File Uploaded'
        })
    })
});
module.exports = router;
