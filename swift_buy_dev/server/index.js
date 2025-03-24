//import 'package
const express=require('express');
const mongoose =require("mongoose");
//import other file;
const authRouter=require('./routes/auth');
const adminRouter=require('./routes/admin');
const productRouter=require('./routes/product');
//init
const PORT =8080;
const app=express();
const DB="mongodb+srv://dreanit:Sahil3005@cluster0.6be2l2u.mongodb.net/?retryWrites=true&w=majority";
//middleware
//CLIENT -> SERVER-> CLIENT
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
//connections
mongoose.connect(DB).then(()=>{
    console.log("connection successful");
}).catch((e)=>{console.log(e);});

app.use((req, res, next) => {
  console.log(`[${new Date().toLocaleString()}] ${req.method} ${req.url}`);
  next();
});


app.listen(PORT,"0.0.0.0",()=>{
console.log(`connected at port ${PORT}`);});