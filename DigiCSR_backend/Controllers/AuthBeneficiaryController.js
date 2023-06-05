require("dotenv").config({ path: "../.env" });
const Beneficiary = require('../Models/Beneficiary');
const speakeasy = require("speakeasy");
const jwt = require("jsonwebtoken");

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

    const is_verified = speakeasy.totp.verify({
      secret: email + process.env.OTPSEC,
      token: otp,
      window: 2,
      encoding: "ascii",
    });

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

      newBeneficiary = await new Beneficiary({ name, email, mobile_no, aadhar_no });
      await newBeneficiary.save();
      const authToken = jwt.sign(
        { _id: newBeneficiary._id, email: newBeneficiary.email },
        process.env.JWT_SEC
      );
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
      message: "Error in Sending OTP to your Mail.",
    });
  }
};

exports.BeneficiaryLoginVerify = async (req, res) => {
  try {
    const { email, otp } = req.body;

    const is_verified = speakeasy.totp.verify({
      secret: email + process.env.OTPSEC,
      token: otp,
      window: 2,
      encoding: "ascii",
    });

    if (is_verified) {
      const exist = await Beneficiary.findOne({
        $or: [{ email: email }],
      });

      if (!exist) {
        return res.status(400).send({
          success: false,
          message: "Beneficiary with this email not exists.",
        });
      }

      const authToken = jwt.sign(
        { _id: exist._id, email: exist.email },
        process.env.JWT_SEC
      );
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