require("dotenv").config({ path: "../.env" });
const NGO = require("../Models/NGO");
const speakeasy = require("speakeasy");
const CRN = require("../Models/CRN");
const jwt = require("jsonwebtoken");

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

    const otp = speakeasy.totp({
      secret: email + process.env.OTPSEC,
      digits: 6,
    });

    // const mailOptions = {
    //   from: process.env.MAILER,
    //   to: email,
    //   subject: "OTP VERIFICATION",
    //   text: "Your One time password is : " + otp,
    // };

    // transporter.sendMail(mailOptions, (err, info) => {
    //   if (err) {
    //     res.status(400).send({
    //       success: false,
    //       message: "Error Sending mail.",
    //     });
    //   } else {
    //     res.status(200).send({ success: true, message: "OTP has sent to your mail" });
    //   }
    // });

    try {
      const mailRes = await sendMail(email, 'OTP verification', 'Your One-time password is: ' + otp);
      console.log('Email response:', mailRes);
      res.status(200).send({ success: true, message: 'OTP sent' });
    } catch (error) {
      console.error('Error sending email:', error);
      res.status(500).json({ success: false, message: 'Error sending Mail' });
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

    const is_verified = speakeasy.totp.verify({
      secret: email + process.env.OTPSEC,
      token: otp,
      window: 2,
      encoding: "ascii",
    });

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
      const newNGO = await new NGO({ csr, email });
      await newNGO.save();
      const authToken = jwt.sign(
        { _id: newNGO._id, csr: newNGO.csr },
        process.env.JWT_SEC
      );
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

    const otp = speakeasy.totp({
      secret: email + process.env.OTPSEC,
      digits: 6,
    });

    // const mailOptions = {
    //   from: process.env.MAILER,
    //   to: email,
    //   subject: "OTP VERIFICATION",
    //   text: "Your One time password is : " + otp,
    // };

    // transporter.sendMail(mailOptions, (e, info) => {
    //   if (e) {
    //     res.status(400).send({
    //       success: false,
    //       message: "Error Sending mail.",
    //     });
    //   } else {
    //     res.status(200).send({ success: true, message: "OTP sent" });
    //   }
    // });


    try {
      const mailRes = await sendMail(email, 'OTP verification', 'Your One-time password is: ' + otp);
      console.log('Email response:', mailRes);
      res.status(200).send({ success: true, message: 'OTP sent' });
    } catch (error) {
      console.error('Error sending email:', error);
      res.status(500).json({ success: false, message: 'Error sending Mail' });
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

    const is_verified = speakeasy.totp.verify({
      secret: email + process.env.OTPSEC,
      token: otp,
      window: 2,
      encoding: "ascii",
    });

    if (is_verified) {
      const exist = await NGO.findOne({
        $or: [{ email: email }],
      });

      if (!exist) {
        return res.status(400).send({
          success: false,
          message: "NGO with this email not exists.",
        });
      }

      const authToken = jwt.sign(
        { _id: exist._id, email: exist.email },
        process.env.JWT_SEC
      );
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