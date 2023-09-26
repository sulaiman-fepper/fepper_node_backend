const prisma = require('../prisma/index')
// const bcrypt = require('bcrypt');
var passwordHash = require('password-hash');
const bcrypt = require('bcryptjs');

const saltRounds = 0;

exports.registerUser = async(req, res) => {


    const {email, phone, name, user_ip, avatar} = req.body;





    let checkPhone = await prisma.users.count(
        {
          where: {
            phone: phone
          }
        }
    )


    if(checkPhone == 1) {
        res.send({status: false, message: "Phone Number Already Exist"})
    }
    else{
        try {
          var minm = 100000;
          var maxm = 999999;
          var is_active = 1;
          var delivery_pin = Math.floor(Math
            .random() * (maxm - minm + 1)) + minm;
          //validation on you
          const result = await prisma.users.create({
              data: {
                  name,
                  email,
                  phone,
                  delivery_pin: delivery_pin.toString(),
                  avatar,
                  is_active,
                  user_ip,
              },
              
          })
          res.json({status: true, data: result})
        }
        catch (e){
          res.json({status: false, message: e.message})
        }
    }










    // // bcrypt.hash("hello", saltRounds, (err, hash) => {
    // //     res.json({hash: hash})
    // //     // Now we can store the password hash in db.
    // // });
    // const verified = bcrypt.compareSync("fepper@123", "$2y$10$XyiFl0ACk1CquwUTHaGlz.y9RWu52Lhux1fktq9iC.TEzpjgYV0xy");

    // // var hashedPassword = passwordHash.verify("fepper@123", "$2y$10$EYX1lS3edRhBxPsJlMRixOc/g3.SoGTxfUwUMoBy2eZ/0CixAIkNG");
    // res.json({hashedPassword: verified})
    // // bcrypt.compare("fepper@123", "$2y$10$EYX1lS3edRhBxPsJlMRixOc/g3.SoGTxfUwUMoBy2eZ/0CixAIkNG", function(err, hash) {
    // //     res.json({hash: hash})
    // //     // if res == true, password matched
    // //     // else wrong password
    // // });

}



exports.getAddresses = async(req, res) => {
  
}









// exports.registerUser = async(req, res) => {

//     bcrypt.hash("hello", saltRounds, (err, hash) => {
//         res.json({hash: hash})
//         // Now we can store the password hash in db.
//     });

// }