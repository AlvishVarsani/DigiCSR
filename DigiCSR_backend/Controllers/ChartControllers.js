const mongoose = require("mongoose");
const RFP = require("../Models/RFP");
const Company = require("../Models/Company");
const NGO = require("../Models/NGO");
// const Company = require("../Models/Company");

exports.SectorsData = async (req, res) => {
  try {
    if (req.userType !== "company" && req.userType !== "Beneficiary") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }

    const companyId = new mongoose.Types.ObjectId(req.user._id);
    let match = {};
    if (companyId && req.userType === "company") {
      match = {
        company: companyId,
        amount: { $exists: true },
        sectors: { $exists: true },
      };
    } else {
      match = {
        amount: { $exists: true },
        sectors: { $exists: true },
      };
    }

    const results = await RFP.aggregate([
      { $match: match },
      { $unwind: "$sectors" },
      {
        $group: {
          _id: "$sectors",
          totalAmount: { $sum: "$amount" },
        },
      },
    ]);
    if (results.length === 0) {
      return res
        .status(404)
        .send({ success: false, message: "No results found." });
    }

    return res.status(200).send({ success: true, result: results });
  } catch (error) {
    console.error("Error:", error);
    return res
      .status(500)
      .send({ success: false, message: "An error occurred." });
  }
};

exports.StatesData = async (req, res) => {
  try {
    if (req.userType !== "company" && req.userType !== "Beneficiary") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }
    const companyId = new mongoose.Types.ObjectId(req.user._id);
    let match = {};
    if (companyId && req.userType === "company") {
      match = {
        company: companyId,
        amount: { $exists: true },
        sectors: { $exists: true },
      };
    } else {
      match = {
        amount: { $exists: true },
        sectors: { $exists: true },
      };
    }

    const results = await RFP.aggregate([
      {
        $match: match,
      },
      {
        $unwind: "$states",
      },
      {
        $group: {
          _id: "$states",
          totalAmount: { $sum: "$amount" },
        },
      },
      {
        $sort: { totalAmount: -1 },
      },
    ]);
    if (results.length === 0) {
      return res
        .status(404)
        .send({ success: false, message: "No results found." });
    }

    return res.status(200).send({ success: true, result: results });
  } catch (error) {
    console.error("Error:", error);
    return res
      .status(500)
      .send({ success: false, message: "An error occurred." });
  }
};

exports.YearData = async (req, res) => {
  try {
    if (req.userType !== "company" && req.userType !== "Beneficiary") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }
    const companyId = new mongoose.Types.ObjectId(req.user._id);
    let match = {};
    if (companyId && req.userType === "company") {
      match = {
        company: companyId,
        amount: { $exists: true },
        date: { $exists: true },
      };
    } else {
      match = {
        amount: { $exists: true },
        date: { $exists: true },
      };
    }
    const results = await RFP.aggregate([
      {
        $match: match,
      },
      {
        $group: {
          _id: { $year: "$date" },
          totalAmount: { $sum: "$amount" },
        },
      },
    ]);
    if (results.length === 0) {
      return res
        .status(404)
        .send({ success: false, message: "No results found." });
    }

    return res.status(200).send({ success: true, result: results });
  } catch (error) {
    console.error("Error:", error);
    return res
      .status(500)
      .send({ success: false, message: "An error occurred." });
  }
};

exports.NgoSectorsData = async (req, res) => {
  try {
    if (req.userType !== "ngo" && req.userType !== "Beneficiary") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }

    const ngoId = new mongoose.Types.ObjectId(req.user._id);
    let match = {};
    if (ngoId && req.userType === "ngo") {
      match = {
        "donations.amount": { $exists: true },
        sectors: { $exists: true },
        "donations.ngo": new mongoose.Types.ObjectId(req.user._id),
        "donations.status": "approved",
      };
    } else {
      match = {
        "donations.amount": { $exists: true },
        sectors: { $exists: true },
        "donations.status": "approved",
      };
    }

    const results = await RFP.aggregate([
      { $unwind: "$donations" },
      { $match: match },
      { $unwind: "$sectors" },
      {
        $group: {
          _id: "$sectors",
          totalAmount: { $sum: "$donations.amount" },
        },
      },
    ]);
    if (results.length === 0) {
      return res
        .status(404)
        .send({ success: false, message: "No results found." });
    }

    return res.status(200).send({ success: true, result: results });
  } catch (error) {
    console.error("Error:", error);
    return res
      .status(500)
      .send({ success: false, message: "An error occurred." });
  }
};

exports.NgoStatesData = async (req, res) => {
  try {
    if (req.userType !== "ngo" && req.userType !== "Beneficiary") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }

    const ngoId = new mongoose.Types.ObjectId(req.user._id);
    let match = {};
    if (ngoId && req.userType === "ngo") {
      match = {
        "donations.amount": { $exists: true },
        states: { $exists: true },
        "donations.ngo": new mongoose.Types.ObjectId(req.user._id),
        "donations.status": "approved",
      };
    } else {
      match = {
        "donations.amount": { $exists: true },
        states: { $exists: true },
        "donations.status": "approved",
      };
    }

    const results = await RFP.aggregate([
      { $unwind: "$donations" },
      { $match: match },
      { $unwind: "$states" },
      {
        $group: {
          _id: "$states",
          totalAmount: { $sum: "$donations.amount" },
        },
      },
      {
        $sort: { totalAmount: -1 },
      },
    ]);
    if (results.length === 0) {
      return res
        .status(404)
        .send({ success: false, message: "No results found." });
    }

    return res.status(200).send({ success: true, result: results });
  } catch (error) {
    console.error("Error:", error);
    return res
      .status(500)
      .send({ success: false, message: "An error occurred." });
  }
};

exports.NgoYearData = async (req, res) => {
  try {
    if (req.userType !== "ngo" && req.userType !== "Beneficiary") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }

    const ngoId = new mongoose.Types.ObjectId(req.user._id);
    let match = {};
    if (ngoId && req.userType === "ngo") {
      match = {
        "donations.amount": { $exists: true },
        date: { $exists: true },
        "donations.ngo": new mongoose.Types.ObjectId(req.user._id),
        "donations.status": "approved",
      };
    } else {
      match = {
        "donations.amount": { $exists: true },
        states: { $exists: true },
        "donations.status": "approved",
      };
    }

    const results = await RFP.aggregate([
      { $unwind: "$donations" },
      { $match: match },
      {
        $group: {
          _id: { $year: "$date" },
          totalAmount: { $sum: "$donations.amount" },
        },
      },
    ]);
    if (results.length === 0) {
      return res
        .status(404)
        .send({ success: false, message: "No results found." });
    }

    return res.status(200).send({ success: true, result: results });
  } catch (error) {
    console.error("Error:", error);
    return res
      .status(500)
      .send({ success: false, message: "An error occurred." });
  }
};

exports.couroselData = async (req, res) => {
  try {
    const data = {};
    data.companies = await Company.countDocuments({});
    data.ngos = await NGO.countDocuments({});
    data.rfps = await RFP.countDocuments({});
    res.status(200).json({ success: true, data });
  } catch (error) {
    console.error("Failed to retrieve carousel data:", error);
    res.status(500).json({ success: false, error: "Internal Server Error" });
  }
};