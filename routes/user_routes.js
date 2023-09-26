const express = require('express')
const router = express.Router()


const { registerUser, loginUser} = require('../controller/user_controller')


router.route('/user/register').post(registerUser)



module.exports = router