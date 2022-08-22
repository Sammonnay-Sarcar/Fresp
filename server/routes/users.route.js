const {loginCredential} = require('../models/loginCredential.model');
const {Address}= require("../models/address.model");
const {User} = require("../models/users.model")
const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');


router.post('/signUp', async(req, res)=>{
    let login = new loginCredential({
        email : req.body.email,
        passwordHash: bcrypt.hashSync(req.body.password, 10) 
    })
    login = await login.save()
    // if(!login)
    // return res.status(400).send('the user cannot be created!')
    // res.send(login);
    let user = new User({
        name: req.body.name,
        phone: req.body.phone,
        email: req.body.email
    });
    user =await  user.save();
    if(!user)
    return res.status(400).send('the user cannot be posted!')
    res.send(user);
})
router.post('/login', async (req,res) => {
    const user = await loginCredential.findOne({email: req.body.email})
    const secret = process.env.SECRET;
    if(!user) {
        return res.status(400).send('The user not found');
    }

    if(user && bcrypt.compareSync(req.body.password, user.passwordHash)) {
        const token = jwt.sign(
            {
                email: user.email,
                userId: user.id,
                isAdmin: user.isAdmin
            },
            secret,
            {expiresIn : '1d'}
        )
       
        res.status(200).send({user: user.email , token: token}) 
    } else {
       res.status(400).send('password is wrong!');
    }

    
})
router.post("/address", async(req, res)=>{
    let address = new Address({
        street: req.body.street,
        apartment: req.body.apt,
        zip: req.body.zip,
        city: req.body.city,
        country: req.body.country
    });
    address = await address.save();
    const user = req.headers.authorization;
    const token = user.split(' ');
    const id = jwt.verify(token[1], process.env.SECRET);
    let addressUpdate = await User.findOne({email: id.email});
    
    addressUpdate.address.push(address);
    addressUpdate = await addressUpdate.save()
    .then((addressRes)=>{return res.send(addressRes)})
    .catch((err)=>{return res.status(400).send('the user address cannot be updated')});
    

})


module.exports = router;



