require("dotenv").config({ path: "../.env" });
const Company = require("../Models/Company");
const CRN = require("../Models/CRN");
const { sendOTP, verifyOTP } = require("../Services/otpService");
const genToken = require("../Services/jwtTokenService");
const {
  CompanySignupValidator,
  CompanyLoginValidator,
} = require("../Services/Validators/companyValidator");

exports.CompanySignup = async (req, res) => {
  try {
    const { cin, email } = req.body;
    const { error } = CompanySignupValidator.validate(req.body);
    if (error) {
      return res
        .status(400)
        .json({ success: false, message: error.details[0].message });
    }

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
    const { error } = CompanySignupValidator.validate({ email, cin });
    if (error) {
      return res
        .status(400)
        .json({ success: false, message: error.details[0].message });
    }
    const is_verified = verifyOTP(email, otp);

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

      const payload = {
        _id: newCompany._id,
        email: newCompany.email,
        type: "company",
      };

      const authToken = genToken(payload);

      res.status(200).send({
        success: true,
        result: authToken,
        _id: newCompany._id,
        email: newCompany.email,
        type: "company",
      });
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
    const { error } = CompanyLoginValidator.validate({ email });
    if (error) {
      console.warn(error);
      return res
        .status(400)
        .json({ success: false, message: error.details[0].message });
    }
    const checkEmail = await Company.findOne({ email: email });

    if (!checkEmail) {
      console.warn("insdie");
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

exports.CompanyLoginVerify = async (req, res) => {
  try {
    const { email, otp } = req.body;
    const { error } = CompanyLoginValidator.validate({ email });
    if (error) {
      return res
        .status(400)
        .json({ success: false, message: error.details[0].message });
    }
    const is_verified = verifyOTP(email, otp);

    if (is_verified) {
      const company = await Company.findOne({
        $or: [{ email: email }],
      });

      if (!company) {
        return res.status(400).send({
          success: false,
          message: "Company with this email not exists.",
        });
      }

      const payload = {
        _id: company._id,
        email: company.email,
        type: "company",
      };

      const authToken = genToken(payload);

      res.status(200).send({
        success: true,
        result: authToken,
        _id: company._id,
        email: company.email,
        type: "company",
      });
    } else res.status(400).send({ success: false, message: "Wrong OTP" });
  } catch (error) {
    console.warn(error);
    res.status(400).send({
      success: false,
      message: "Error in login company.",
    });
  }
};
