require("dotenv").config({ path: "../.env" });
const NGO = require("../Models/NGO");
const CRN = require("../Models/CRN");
const genToken = require("../Services/jwtTokenService")
const { sendOTP, verifyOTP } = require("../Services/otpService");

exports.NGOSignup = async (req, res) => {
  try {
    const { csr, email } = req.body;

    const checkCSR = await CRN.findOne({ csr: csr });
    const checkEmail = await CRN.findOne({ email: email });
    if (
      (checkCSR && checkCSR.email != email) ||
      (checkEmail && checkEmail.csr != csr)
    ) {
      return res.status(400).send({
        success: false,
        message: "CSR or Email doesnt match.",
      });
    }

    const exist = await NGO.findOne({
      $or: [{ csr: csr }, { email: email }],
    });

    if (exist) {
      return res.status(400).send({
        success: false,
        message: "NGO with this CSR or Email has already exists.",
      });
    }

    try {
      await sendOTP(email);
      res.status(200).send({ success: true, message: "OTP sent" });
    } catch (error) {
      console.log(error);
      res
        .status(500)
        .json({ success: false, message: "Error sending OTP !!!" });
    }
  } catch (error) {
    res.status(400).send({
      success: false,
      message: "Error creating NGO.",
    });
  }
};

exports.VerifyNGO = async (req, res) => {
  try {
    const { csr, email, otp } = req.body;

    const is_verified = verifyOTP(email, otp);

    if (is_verified) {
      const exist = await NGO.findOne({
        $or: [{ csr: csr }, { email: email }],
      });

      if (exist) {
        return res.status(400).send({
          success: false,
          message: "NGO with this CSR, name or email already exists.",
        });
      }
      const newNGO = new NGO({ csr, email });
      await newNGO.save();

      const payload = {
        _id: newNGO._id,
        email: newNGO.email,
        type: "NGO",
      };

      const authToken = genTocken(payload);

      res.status(200).send({ success: true, result: authToken });
    } else res.status(400).send({ success: false, message: "Wrong OTP" });
  } catch (error) {
    console.warn(error);
    res.status(400).send({
      success: false,
      message: "Error creating NGO.",
    });
  }
};

exports.NGOLogin = async (req, res) => {
  try {
    const { email } = req.body;

    const checkEmail = await NGO.findOne({ email: email });

    if (!checkEmail) {
      return res.status(400).send({
        success: false,
        message: "Email address is not registered",
      });
    }

    try {
      await sendOTP(email);
      res.status(200).send({ success: true, message: "OTP sent" });
    } catch (error) {
      console.log(error);
      res
        .status(500)
        .json({ success: false, message: "Error sending OTP !!!" });
    }
  } catch (error) {
    res.status(400).send({
      success: false,
      message: "Error Sending OTP to your Mail.",
    });
  }
};

exports.NGOLoginVerify = async (req, res) => {
  try {
    const { email, otp } = req.body;

    const is_verified = verifyOTP(email, otp);

    if (is_verified) {
      const ngo = await NGO.findOne({
        $or: [{ email: email }],
      });

      if (!ngo) {
        return res.status(400).send({
          success: false,
          message: "NGO with this email not exists.",
        });
      }

      const payload = {
        _id: ngo._id,
        email: ngo.email,
        type: "NGO",
      };

      const authToken = genToken(payload);

      res.status(200).send({ success: true, result: authToken });
    } else res.status(400).send({ success: false, message: "Wrong OTP" });
  } catch (error) {
    console.warn(error);
    res.status(400).send({
      success: false,
      message: "Error in login NGO.",
    });
  }
};
