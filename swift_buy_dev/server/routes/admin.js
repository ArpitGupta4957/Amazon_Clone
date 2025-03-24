const express = require('express')
const adminRouter = express.Router();

const jwt = require('jsonwebtoken');
const admin = require('../middlewares/admin');
const Product = require('../models/product');
//Creating an Admin Middleware

adminRouter.post("/admin/add-product", admin, async (req, res) => {
    try {
        const { name, description, images, quantity, price, category } = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category
        });
        product = await product.save();
        res.json({error:false,message:"Product Added Successfully" , data: product});
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});


//Get all Products
//admin/get-products
adminRouter.get('/admin/get-products', admin, async (req, res) => {
    try {
        const products = await Product.find({ });
        res.json({error:false, data: products});

    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Delete Product
//admin/delete-product
adminRouter.post('/admin/delete-product',admin,async(req,res)=>{
    try{
        const {id}=req.body;
        await Product.findByIdAndDelete(id); 
        res.json({error:false,
        message:"Product Deleted Successfully!!"})
    }catch(e){
        res.status(500).json({error:e.message});
    }
});

module.exports = adminRouter;
