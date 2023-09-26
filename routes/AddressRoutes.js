const express = require('express')
const router = express.Router()


const { getAddresses, deleteAddress, saveAddress, setDefaultAddress } = require('../controller/AddressController')


router.route('/get-addresses').post(getAddresses)
router.route('/delete-address').post(deleteAddress)
router.route('/save-address').post(saveAddress)
router.route('/set-default-address').post(setDefaultAddress)



module.exports = router