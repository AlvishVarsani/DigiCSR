// usage : to sign the JWT tokens
const jwt = require("jsonwebtoken");

const JWT_SEC = process.env.JWT_SEC;

const genToken = (payload) => {

    const token = jwt.sign(
        payload,
        JWT_SEC, {
        expiresIn: '30d'
    });

    return token;

}

module.exports = genToken;