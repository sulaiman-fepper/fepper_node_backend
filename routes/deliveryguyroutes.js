const express = require('express')
const router = express.Router()

const { createPost, updatePost, deletePost, getPost } = require('../controller/deliveryguycontroller')


router.route('/deliveryguydetails/create').post(createPost)

router.route('/deliveryguydetails/update/:id').post(updatePost)

router.route('/deliveryguydetails/delete/:id').post(deletePost)

router.route('/deliveryguydetails/get').get(getPost)



module.exports = router