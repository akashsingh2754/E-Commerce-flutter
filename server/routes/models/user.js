const mongoose = require("mongoose");
// creating schema for usermodel using mongodb
const userSchema = mongoose.Schema({
  name: {
    type: String,
    require: true,
    trim: true,
  },
  email: {
    type: String,
    require: true,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please Enter a Valid email address",
    },
  },
  password: {
    type: String,
    require: true,
    validator: (value) =>{
        value.length>6;
    },
    message:"Please enter a valid password",
  },
  address: {
    type: String,
    default:''
  },
  type:
  {
    type: String,
    default:'user',
  }
}
);
// to create a model we store it in var and "User" is model name
const User = mongoose.model("User",userSchema);
module.exports  = User;
// to make public other classes can acces;