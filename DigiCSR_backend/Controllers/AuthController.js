require("dotenv").config({ path: "../.env" });
const Company = require("../Models/Company");
const speakeasy = require("speakeasy");
const CRN = require("../Models/CRN");
const jwt = require("jsonwebtoken");
const sendMail = require("../Services/mailService");

exports.CompanySignup = async (req, res) => {
  try {
    const { cin, email } = req.body;

    const checkCIN = await CRN.findOne({ cin: cin });
    const checkEmail = await CRN.findOne({ email: email });
    if (
      (checkCIN && checkCIN.email != email) ||
      (checkEmail && checkEmail.cin != cin)
    ) {
      return res.status(400).send({
        success: false,
        message: "CIN and email doesnt match.",
      });
    }

    const exist = await Company.findOne({
      $or: [{ cin: cin }, { email: email }],
    });

    if (exist) {
      return res.status(400).send({
        success: false,
        message: "Company with this CRN, name or email already exists.",
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
    console.log(error);
    res.status(500).send({
      success: false,
      message: "Error creating company.",
    });
  }
};

exports.VerifyCompany = async (req, res) => {
  try {
    const { cin, email, otp } = req.body;

    const is_verified = speakeasy.totp.verify({
      secret: email + process.env.OTPSEC,
      token: otp,
      window: 2,
      encoding: "ascii",
    });

    if (is_verified) {
      const exist = await Company.findOne({
        $or: [{ cin: cin }, { email: email }],
      });

      if (exist) {
        return res.status(400).send({
          success: false,
          message: "Company with this CRN, name or email already exists.",
        });
      }
      const newCompany = await new Company({ cin, email });
      await newCompany.save();
      const authToken = jwt.sign(
        { _id: newCompany._id, email: newCompany.email },
        process.env.JWT_SEC
      );
      res.status(200).send({ success: true, result: authToken });
    } else res.status(400).send({ success: false, message: "Wrong OTP" });
  } catch (error) {
    console.warn(error);
    res.status(400).send({
      success: false,
      message: "Error creating company.",
    });
  }
};

exports.CompanyLogin = async (req, res) => {
  try {
    const { email } = req.body;

    const checkEmail = await Company.findOne({ email: email });

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

exports.CompanyLoginVerify = async (req, res) => {
  try {
    const { email, otp } = req.body;

    const is_verified = speakeasy.totp.verify({
      secret: email + process.env.OTPSEC,
      token: otp,
      window: 2,
      encoding: "ascii",
    });

    if (is_verified) {
      const exist = await Company.findOne({
        $or: [{ email: email }],
      });

      if (!exist) {
        return res.status(400).send({
          success: false,
          message: "Company with this email not exists.",
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
      message: "Error in login company.",
    });
  }
};
