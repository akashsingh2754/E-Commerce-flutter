const jwt = require("jsonwebtoken");
// we are creating here function not an route
const auth = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token)
      return req.status(401).json({ msg: "No auth token,access denied" });
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) {
      return req
        .status(401)
        .json({ msg: "Token verification failed , autherization denied. " });
    }
        /* now we are adding new object to this request which is user and we are saving somthing to it. which is equl to verified.id everytime we can't passs
        in the bodyso are adding this auth middleware so that here we can perform all the validations, if it's is valid or not And 
        we are storing usser in request.userwhene are we use middleware like auth we can use req.user like header that will featch users id
         */
        req.user = verified.id;
        req.token = token;
        next();

    }
  catch (err) {
    res.status(500).json({ error: err.message });
  }
};
module.exports = auth;