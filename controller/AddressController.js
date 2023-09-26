const prisma = require('../prisma/index')


exports.getAddresses = async(req, res) => {
    const {user_id, restaurant_id, longitude, address, house, tag} = req.body;   
    if(user_id != null) {
        let restaurant = await prisma.restaurants.findFirst({
            where: {
                id: restaurant_id
            }
        });
        res.send(restaurant)
    }
}


exports.saveAddress = async(req, res) => {
    const {user_id, latitude, longitude, address, house, tag} = req.body;
    if(user_id != null) {
        let saveAddress = await prisma.address.create({
            data: {
                user_id,
                latitude,
                longitude,
                address,
                house,
                tag
            }
        })
        let updateUser = await prisma.users.update(
            {
              where: {
                id: user_id
              },
              data: {
                default_address_id: saveAddress['id']
              }
            }
        )
        res.json({status: true, data: updateUser})
    }

}

exports.deleteAddress = async(req, res) => {
    const {user_id, address_id} = req.body;
    if(user_id != null) {
        let deleteAddress = await prisma.address.delete({
            where: {
                id: address_id
            }
        })
        let address = await prisma.address.findMany(
            {
              where: {
                user_id: user_id
              },
            }
        )
        res.json({status: true, data: address})
    }
}

exports.setDefaultAddress = async(req, res) => {
    const {user_id, address_id} = req.body;
    if(user_id != null) {
        let user = await prisma.users.update(
            {
              where: {
                id: user_id
              },
              data: {
                default_address_id: address_id
              }
            }
        )
        let address = await prisma.address.findMany(
            {
              where: {
                user_id: user_id
              },
            }
        )

        res.json({status: true, data: address})
    }
}