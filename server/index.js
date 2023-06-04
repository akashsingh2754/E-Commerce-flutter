// import from packages
const express = require("express");
const mongoose = require("mongoose");

// import from other files
const authRouter = require("../server/routes/models/auth");
// import from
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://akash:akash123@cluster0.bxbhodd.mongodb.net/?retryWrites=true&w=majority";
// middleeware
app.use(express.json());
app.use(authRouter);
//
// connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("connection is successful");
  })
  .catch((e) => {
    console.log(e);
  });

// creste api
// app.get("/hello-world",(req,res) =>
// {
//     res.json("hello akash");
// });

// app.get("/",(req,res) =>
// {
//   res.json({'name':"akash"})
// });

app.listen(PORT,'0.0.0.0',() => {
  console.log(`server is running on port ${PORT}`);
});
