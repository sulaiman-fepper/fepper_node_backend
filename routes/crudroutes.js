const express = require('express')
const router = express.Router()

const { createPost, updatePost, deletePost, getPost , createDelivery} = require('../controller/crud')


router.route('/user/create').post(createPost)
router.route('/user/create_delivery').post(createDelivery)

router.route('/user/update/:id').post(updatePost)

router.route('/user/delete').post(deletePost)

router.route('/user/get').get(getPost)



module.exports = router