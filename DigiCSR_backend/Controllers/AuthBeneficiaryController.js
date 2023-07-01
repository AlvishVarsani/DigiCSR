require("dotenv").config({ path: "../.env" });
const Beneficiary = require("../Models/Beneficiary");
const { sendOTP, verifyOTP } = require("../Services/otpService");
const genToken = require("../Services/jwtTokenService");
const {
  CompanyLoginValidator,
} = require("../Services/Validators/companyValidator");
const { BenfValidators } = require("../Services/Validators/BenfValidators");

exports.BeneficiarySignup = async (req, res) => {
  try {
    const { name, email, mobile_no, aadhar_no } = req.body;
    const { error } = BenfValidators.validate(req.body);
    if (error) {
      return res
        .status(400)
        .json({ success: false, message: error.details[0].message });
    }
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
      res.status(200).send({ success: true, message: "OTP sent" });
    } catch (error) {
      console.log(error);
      res
        .status(500)
        .json({ success: false, message: "Error sending OTP !!!" });
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
    const { error } = BenfValidators.validate({
      name,
      email,
      aadhar_no,
      mobile_no,
    });
    if (error) {
      return res
        .status(400)
        .json({ success: false, message: error.details[0].message });
    }
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

      const newBeneficiary = await new Beneficiary({
        name,
        email,
        mobile_no,
        aadhar_no,
      });
      await newBeneficiary.save();

      const payload = {
        _id: newBeneficiary._id,
        email: newBeneficiary.email,
        type: "Beneficiary",
      };

      const authToken = genToken(payload);

      res.status(200).send({
        success: true,
        result: authToken,
        _id: newBeneficiary._id,
        email: newBeneficiary.email,
        type: "Beneficiary",
      });
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
    const { error } = CompanyLoginValidator.validate(req.body); // it has only email validator
    if (error) {
      return res
        .status(400)
        .json({ success: false, message: error.details[0].message });
    }
    const checkEmail = await Beneficiary.findOne({ email: email });

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
      message: "Error in Sending OTP to your Mail.",
    });
  }
};

exports.BeneficiaryLoginVerify = async (req, res) => {
  try {
    const { email, otp } = req.body;
    const { error } = CompanyLoginValidator.validate({ email }); // it has only email validator
    if (error) {
      return res
        .status(400)
        .json({ success: false, message: error.details[0].message });
    }
    const is_verified = verifyOTP(email, otp);

    if (is_verified) {
      const beneficiary = await Beneficiary.findOne({
        $or: [{ email: email }],
      });

      if (!beneficiary) {
        return res.status(400).send({
          success: false,
          message: "Beneficiary with this email not exists.",
        });
      }

      const payload = {
        _id: beneficiary._id,
        email: beneficiary.email,
        type: "Beneficiary",
      };

      const authToken = genToken(payload);

      res
        .status(200)
        .send({
          success: true,
          result: authToken,
          _id: beneficiary._id,
          email: beneficiary.email,
          type: "Beneficiary",
        });
    } else res.status(400).send({ success: false, message: "Wrong OTP" });
  } catch (err) {
    console.warn(err);
    res.status(400).send({
      success: false,
      message: "Error in login Beneficiary.",
    });
  }
};

exports.getAllBeneficiaries = async (req, res) => {
  try {
    const userType = req.userType;
    if (userType !== "Admin") {
      return res
        .status(403)
        .send({ success: false, message: "Not Authorized." });
    }
    const beneficiary = await Beneficiary.find({});
    return res.status(200).send({ success: true, beneficiary });
  } catch (error) {
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};

exports.deleteBeneficiary = async (req, res) => {
  try {
    const userType = req.userType;
    if (userType !== "Admin") {
      return res
        .status(403)
        .send({ success: false, message: "Not Authorized." });
    }
    const _id = req.body._id;
    const beneficiary = await Beneficiary.findOne({ _id });
    if (!beneficiary) {
      return res
        .status(404)
        .json({ success: false, message: "beneficiary not found." });
    }
    const result = await Beneficiary.findByIdAndDelete(_id);
    if (!result) {
      return res
        .status(500)
        .json({ success: false, message: "Failed to delete beneficiary." });
    }
    return res
      .status(200)
      .send({ success: true, message: "beneficiary Deleted." });
  } catch (error) {
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};
