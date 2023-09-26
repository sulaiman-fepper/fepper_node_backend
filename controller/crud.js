const prisma = require('../prisma/index')

//create a new post on fepper

exports.createPost = async(req, res, next) => {
    try {
    const {name, email,
        password,
        remember_token,
        auth_token,
        phone,
        default_address_id,
        delivery_pin,
        delivery_guy_detail_id,
        avatar,
        is_active,
        tax_number,
        user_ip}  = req.body
    //validation on you
    const result = await prisma.users.create({
        data: {
            name,
            email,
            password,
            remember_token,
            auth_token,
            phone,
            default_address_id,
            delivery_pin,
            delivery_guy_detail_id,
            avatar,
            is_active,
            tax_number,
            user_ip
        }
    })
    res.json(result)
    } catch (error) {
        res.json ({error: error})   
        // throw new Error(error)   
    }
}



exports.createDelivery = async(req, res, next) => {
    try {
    const {name, age,
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
        tip_commision_rate,  status}  = req.body
    //validation on you
    const result = await prisma.delivery_guy_details.create({
        data: {
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
        res.json ({error: error})   
        // throw new Error(error)   
    }
}


// get all post on fepper

exports.getPost = async(req, res, next) => {
    try {
    const result = await prisma.user.findMany()
    res.json(result)
    } catch (error) {
        res.json ({error: `post with ${id} does not exist`})   
    }
}

//updating post on fepper

exports.updatePost = async(req, res, next) => {
    try {
    const {name,
        email,
        password,
        remember_token,
        auth_token,
        phone,
        default_address_id,
        delivery_pin,
        delivery_guy_detail_id,
        avatar,
        is_active,
        tax_number,
        user_ip}  = req.body
    
    const result = await prisma.user.create({
        // where: {id: id},
        data: {
            name: name,
            email: email,
            password: password,
            remember_token: remember_token,
            auth_token: auth_token,
            phone: phone,
            default_address_id: default_address_id,
            delivery_pin: delivery_pin,
            delivery_guy_detail_id: delivery_guy_detail_id,
            avatar: avatar,
            is_active: is_active,
            tax_number: tax_number,
            user_ip: user_ip
        }
        
    });
    res.json(result)
    
    } catch (error) {
        res.json ({error: `post with ${id} does not exist`})   
    }
}

//delete a post from fepper
exports.deletePost = async(req, res, next) => {
    const {id, name} = req.body;
   
    try {
   
    var result = await prisma.users.findMany({
        where: {
            delivery_guy_detail_id: {
                not: null
            }
        },
        select: {
            id: true,
            name: true,
            email: true,
            // delivery_guy_detail_id: true,
            Deliveryguydetails: {
                select: {
                    name: true
                }
            }
         },
        // include: {
        //     Deliveryguydetails: true
        // }
    });
    res.json({status: true , message:`post with ${id} deleted successsfully`, data: result})
    
    } catch (error) {
        res.json ({error: error})   
    }
}



