require("dotenv").config({ path: "../.env" });
const Beneficiary = require('../Models/Beneficiary');
const jwt = require("jsonwebtoken");
const { sendOTP, verifyOTP } = require("../Services/otpService");
const genToken = require("../Services/jwtTokenService")

exports.BeneficiarySignup = async (req, res) => {
  try {
    const { name, email, mobile_no, aadhar_no } = req.body;

    const exist = await Beneficiary.findOne({
      $or: [{ email: email }, { mobile_no: mobile_no }],
    });

    if (exist) {
      return res.status(400).send({
        success: false,
        message: "Beneficiary With this email or mobile no already exist.",
      });
    }

    try {
      await sendOTP(email);
      res.status(200).send({ success: true, message: 'OTP sent' });
    } catch (error) {
      console.log(error);
      res.status(500).json({ success: false, message: 'Error sending OTP !!!' });
    }

  } catch (err) {
    res.status(400).send({
      success: false,
      message: "Error creating Beneficiary.",
    });
  }
};

exports.VerifyBeneficiary = async (req, res) => {
  try {
    const { name, email, mobile_no, aadhar_no, otp } = req.body;

    const is_verified = verifyOTP(email, otp);

    if (is_verified) {
      const exist = await Beneficiary.findOne({
        $or: [{ email: email }, { mobile_no: mobile_no }],
      });

      if (exist) {
        return res.status(400).send({
          success: false,
          message: "User with this mobile no or email already exists.",
        });
      }

      const newBeneficiary = await new Beneficiary({ name, email, mobile_no, aadhar_no });
      await newBeneficiary.save();

      const payload = {
        _id: newBeneficiary._id,
        email: newBeneficiary.email,
        type: "Beneficiary"
      }

      const authToken = genToken(payload);

      res.status(200).send({ success: true, result: authToken });
    } else {
      res.status(400).send({ success: false, message: "Wrong OTP" });
    }
  } catch (err) {
    console.warn(err);
    res.status(400).send({
      success: false,
      message: "Error creating Beneficiary.",
    });
  }
};

exports.BeneficiaryLogin = async (req, res) => {
  try {
    const { email } = req.body;

    const checkEmail = await Beneficiary.findOne({ email: email });

    if (!checkEmail) {
      return res.status(400).send({
        success: false,
        message: "Email address is not registered",
      });
    }


    try {
      await sendOTP(email);
      res.status(200).send({ success: true, message: 'OTP sent' });
    } catch (error) {
      console.log(error);
      res.status(500).json({ success: false, message: 'Error sending OTP !!!' });
    }

  } catch (error) {
    res.status(400).send({
      success: false,
      message: "Error in Sending OTP to your Mail.",
    });
  }
};

exports.BeneficiaryLoginVerify = async (req, res) => {
  try {
    const { email, otp } = req.body;

    const is_verified = verifyOTP(email, otp);

    if (is_verified) {
      const Beneficiary = await Beneficiary.findOne({
        $or: [{ email: email }],
      });

      if (!Beneficiary) {
        return res.status(400).send({
          success: false,
          message: "Beneficiary with this email not exists.",
        });
      }

      const payload = {
        _id: Beneficiary._id,
        email: Beneficiary.email,
        type: "Beneficiary"
      }

      const authToken = genToken(payload);

      res.status(200).send({ success: true, result: authToken });
    } else res.status(400).send({ success: false, message: "Wrong OTP" });
  } catch (err) {
    console.warn(err);
    res.status(400).send({
      success: false,
      message: "Error in login Beneficiary.",
    });
  }
};