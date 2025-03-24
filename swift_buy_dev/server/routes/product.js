const express = require('express')
const productRouter = express.Router();
const auth = require("../middlewares/auth")
const Product = require('../models/product');
//Get all Products based on category

// /api/products?category=Essentials
productRouter.get('/api/products', auth, async (req, res) => {
    try {
        const products = await Product.find({ category: req.query.category });
        res.json({ error: false, data: products });

    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});
//getSearchedProduct
productRouter.get('/api/products/search/:name', auth, async (req, res) => {
    try {
        const products = await Product.find({ name: { $regex: req.params.name, $options: "i" } });
        res.json({ error: false, data: products });

    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = productRouter;