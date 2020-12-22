const express = require('express');
const courseRepository = require('./.').repo;
const router = express.Router();
const pool = require('../connection');
const fileupload = require('express-fileupload');


router.use(fileupload());

router.get('/getPrograms', async (req, res) => {
  res.send (await courseRepository.getPrograms());
});

router.get('/getCoursesByProgram/:id', async (req, res) => {
  res.send(await courseRepository.getCoursesByProgram(req, res));
});

router.get('/getCourseDetails/:id', async (req, res) => {
  res.send(await courseRepository.getCourseDetails(req, res));
});

router.get('/getAnnouncementDetails/:id', async (req, res) => {
  res.send(await courseRepository.getAnnouncementDetails(req, res));
});

router.get('/getCourses/:uid', async (req, res) => {
  res.send(await courseRepository.getAllCoursesByUserId(req, res));
});

router.post('/createDayschool', async (req, res) => {
  console.log("aaaaaaaaaaaaaaaaaa", req.body);
  res.send(await courseRepository.postDayschool(req.body))
});

router.post('/postAnnouncement', async (req, res) => {
  console.log("req.data : " ,req.body)
  res.send(await courseRepository.postAnnouncement(req.body))
});

router.post('/updateUserCourseStatus', async (req, res) => {
  res.send(await courseRepository.updateUserCourseStatus(req.body))
});

router.post('/fileupload', async (req, res, next) => {
  console.log(req.files);
  const file = req.files.tma;
  file.mv('../fileUpload/file/'+ file.name, function(err,result){
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
