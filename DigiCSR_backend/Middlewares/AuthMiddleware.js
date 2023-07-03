const jwt = require("jsonwebtoken");
const jwt_sec = process.env.JWT_SEC;
const Company = require("../Models/Company");
const Beneficiary = require("../Models/Beneficiary");
const NGO = require("../Models/NGO");
const Admin = require("../Models/Admin");

module.exports = async (req, res, next) => {
  const token = req.header("authorization");

  if (!token) {
    return res
      .status(401)
      .json({ success: false, message: "Not Authorized. Token not found !!!" });
  }

  try {
    const { _id, type } = jwt.verify(token, jwt_sec);
    console.warn({ _id, type });
    console.log("_id: " + _id + " type: " + type);

    switch (type) {
      case "company":
        try {
          const company = await Company.find({ _id }, { _id: 1 });
          console.warn("cpny ", company);
          if (company) {
            req.user = company[0];
            req.userType = "company";
            break;
          }
          throw new Error("Unauthorized");
        } catch (error) {
          return res
            .status(401)
            .json({ success: false, message: "Not Authorized." });
        }

      case "NGO":
        try {
          const ngo = await NGO.find({ _id }, { _id: 1 });
          if (ngo) {
            req.user = ngo[0];
            req.userType = "ngo";
            break;
          }
          throw new Error("Unauthorized");
        } catch (error) {
          return res
            .status(401)
            .json({ success: false, message: "Not Authorized." });
        }

      case "Beneficiary":
        try {
          const beneficiary = await Beneficiary.find({ _id }, { _id: 1 });
          if (beneficiary) {
            req.user = beneficiary[0];
            req.userType = "Beneficiary";
            break;
          }
          throw new Error("Unauthorized");
        } catch (error) {
          return res
            .status(401)
            .json({ success: false, message: "Not Authorized." });
        }

      case "Admin":
        try {
          const admin = await Admin.find({ _id }, { _id: 1 });
          console.warn(admin);
          if (admin) {
            console.warn("inside if");
            req.user = admin[0];
            req.userType = "Admin";
            break;
          }
          throw new Error("Unauthorized");
        } catch (error) {
          return res
            .status(401)
            .json({ success: false, message: "Not Authorized." });
        }

      default:
        return res
          .status(401)
          .json({ success: false, message: "Not Authorized." });
    }

    next();
  } catch (error) {
    console.log(error);
    if (error.name === "JsonWebTokenError") {
      return res
        .status(401)
        .json({ success: false, message: "Invalid token. Not Authorized." });
    }
    return res
      .status(500)
      .json({ success: false, message: "Server internal error" });
  }
};
