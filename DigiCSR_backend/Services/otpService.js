// TODO: create a otp service
// 1. to sent otp
// 2. to verify otp

const speakeasy = require("speakeasy");
const sendMail = require("./mailService");

exports.sendOTP = (email) => {

    const otp = speakeasy.totp({
        secret: email + process.env.OTPSEC,
        digits: 6,
    });


    // send mail using sendMail service




}

exports.verifyOTP = (email) => {

    const is_verified = speakeasy.totp.verify({
        secret: email + process.env.OTPSEC,
        token: otp,
        window: 2,
        encoding: "ascii",
    });

    return is_verified;

}