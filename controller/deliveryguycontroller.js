const prisma = require('../prisma/index')

//create a new post on fepper

exports.createPost = async(req, res, next) => {
    try {
    const {name,
        age,
        gender,
        photo,
        description,
        vehicle_number,
        commision_rate,
        is_notifiable,
        max_accept_delivery_limit,
        delivery_lat,
        delivery_long,
        heading,
        tip_commision_rate,
        status}  = req.body
    //validation on you
    const result = await prisma.fepper.create({
        data: {
            id,
            name,
            age,
            gender,
            photo,
            description,
            vehicle_number,
            commision_rate,
            is_notifiable,
            max_accept_delivery_limit,
            delivery_lat,
            delivery_long,
            heading,
            tip_commision_rate,
            status
        }
    })
    res.json(result)
    } catch (error) {
        throw new Error(error)   
    }
}

// get all post on fepper

exports.getPost = async(req, res, next) => {
    try {
    const result = await prisma.fepper.findMany()
    res.json(result)
    } catch (error) {
        res.json ({error: `post with ${id} does not exist`})   
    }
}

//update post

exports.updatePost = async(req, res, next) => {
    const {id} = req.body;
    const {name,
        age,
        gender,
        photo,
        description,
        vehicle_number,
        commision_rate,
        is_notifiable,
        max_accept_delivery_limit,
        delivery_lat,
        delivery_long,
        heading,
        tip_commision_rate,
        status} = req.body
    try {
    const {name,
        age,
        gender,
        photo,
        description,
        vehicle_number,
        commision_rate,
        is_notifiable,
        max_accept_delivery_limit,
        delivery_lat,
        delivery_long,
        heading,
        tip_commision_rate,
        status}  = req.body
    
    const result = await prisma.deliveryguydetails.update({
        where: {id: id},
        data: {
            name: name,
            age: age,
            gender:gender,
            photo: photo,
            description: description,
            vehicle_number:vehicle_number,
            commision_rate: commision_rate,
            is_notifiable:is_notifiable,
            max_accept_delivery_limit:max_accept_delivery_limit,
            delivery_lat: delivery_lat,
            delivery_long: delivery_long,
            heading:heading,
            tip_commision_rate: tip_commision_rate,
            status: status
        }    
    });
    res.json(result)
    
    } catch (error) {
        res.json ({error: `post with ${id} does not exist`})   
    }
}

//delete a post from fepper
exports.deletePost = async(req, res, next) => {
    const {id} = req.body;
    const {name,
        age,
        gender,
        photo,
        description,
        vehicle_number,
        commision_rate,
        is_notifiable,
        max_accept_delivery_limit,
        delivery_lat,
        delivery_long,
        heading,
        tip_commision_rate,
        status} = req.body
    try {
    const {name,
        age,
        gender,
        photo,
        description,
        vehicle_number,
        commision_rate,
        is_notifiable,
        max_accept_delivery_limit,
        delivery_lat,
        delivery_long,
        heading,
        tip_commision_rate,
        status}  = req.body
    
    const result = await prisma.deliveryguydetails.delete({
        where: {id: id}
    });
    res.json({status: true , message:`post with ${id} deleted successsfully`})
    
    } catch (error) {
        res.json ({error: `post with ${id} not exist`})   
    }
}

