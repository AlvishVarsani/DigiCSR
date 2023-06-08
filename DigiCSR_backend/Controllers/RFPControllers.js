require("dotenv").config({ path: "../.env" });
const mongoose = require("mongoose");
const NGO = require("../Models/NGO");
const RFP = require("../Models/RFP");
const Notification = require("../Models/Notification");
const Company = require("../Models/Company");
const sendMail = require("../Services/mailService");

exports.AddRfp = async (req, res) => {
  try {
    if (req.userType !== "company") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }
    const { title, amount, timeline, sectors, states } = req.body;
    const company = req.user._id;
    const newRFP = new RFP({
      title,
      amount,
      timeline,
      sectors,
      states,
      company,
      date: new Date(),
    });

    const addedRFP = await newRFP.save();
    if (addedRFP) {
      NotifyNgo(sectors, states, newRFP);
      return res.status(200).json({
        success: true,
        RFP: addedRFP,
      });
    }

    return res
      .status(400)
      .json({ success: false, message: "Failed to create RFP." });
  } catch (error) {
    return res.status(400).json({
      success: false,
      message: "Error creating RFP.",
    });
  }
};

exports.getAllRfps = async (req, res) => {
  try {
    if (req.userType !== "ngo") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }
    const page = parseInt(req.query.page) || 1;
    const limit = 10;
    const skip = (page - 1) * limit;

    const rfps = await RFP.find(
      {},
      { title: 1, sectors: 1, states: 1, company: 1 }
    )
      .populate({ path: "company", select: "company_name" })
      .sort({ date: -1 })
      .skip(skip)
      .limit(limit);

    let response = rfps.map((rfp) => ({
      _id: rfp._id,
      title: rfp.title,
      sectors: rfp.sectors,
      states: rfp.states,
      company_name: rfp.company.company_name,
    }));

    res.status(200).json(response);
  } catch (error) {
    console.warn(error);
    res.status(500).json({ error: "Internal server error" });
  }
};

exports.getRFPDetails = async (req, res) => {
  try {
    if (req.userType !== "ngo") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }

    const id = req.params.id;

    const rfp = await RFP.findOne({ _id: id }, { donations: 0, __v: 0 });

    if (!rfp) {
      return res
        .status(404)
        .json({ success: false, message: "RFP not found." });
    }

    const companyId = rfp.company;
    const company = await Company.findOne(
      { _id: companyId },
      {
        company_name: 1,
        "profile.comunication_person.cp_name": 1,
        "profile.comunication_person.cp_email": 1,
        "profile.location": 1,
        "profile.summary": 1,
        "profile.sectors": 1,
      }
    );

    if (!company) {
      return res
        .status(404)
        .json({ success: false, message: "Company not found." });
    }
    const resp = {
      rfp,
      company,
    };
    return res.status(200).json({ success: true, data: resp });
  } catch (error) {
    console.error(error);
    return res
      .status(500)
      .json({ success: false, message: "Internal server error." });
  }
};

exports.acceptRFP = async (req, res) => {
  try {
    const { rfpID, amount } = req.body;
    if (req.userType !== "ngo") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }
    const ngoId = req.user._id;
    console.warn(ngoId);
    let rfp = await RFP.findById(rfpID);
    let ngo = await NGO.findById(ngoId);

    if (!rfp) {
      return res.status(404).json({ success: false, message: "RFP not found" });
    }
    if (!ngo) {
      return res.status(404).json({ success: false, message: "NGO not found" });
    }
    if (
      rfp.amount -
        rfp.donations.reduce((total, donation) => total + donation.amount, 0) <
      amount
    ) {
      return res.status(400).json({
        success: false,
        message: "RFP does not have sufficient amount.",
      });
    }

    rfp.donations.push({
      ngo: ngoId,
      amount: amount,
      date: Date.now(),
    });

    await rfp.save();

    NotifyCompanyAcceptedRFP(rfp, ngo.ngo_name, amount);
    return res
      .status(200)
      .json({ success: true, message: "Donation successful" });
  } catch (error) {
    console.error("Error donating to RFP:", error);
    return res.status(500).json({ success: false, message: "Server error" });
  }
};

exports.getRFP = async (req, res) => {
  try {
    if (req.userType !== "company") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }
    const id = req.params.id;
    const rfp = await RFP.findOne({ _id: id }).populate(
      "donations.ngo",
      "ngo_name"
    );
    if (!rfp) {
      return res
        .status(404)
        .json({ success: false, message: "RFP not found." });
    }
    if (!rfp.company.equals(req.user._id)) {
      return res
        .status(403)
        .json({ success: false, message: "Unauthorized to see this RFP." });
    }
    // to replace _id with ngo_name
    const transformedDonations = rfp.donations.map((donation) => ({
      nogId: donation.ngo._id,
      ngo: donation.ngo.ngo_name,
      amount: donation.amount,
      date: donation.date,
    }));

    // Replace the donations array in the response with the transformedDonations
    const response = {
      ...rfp.toObject(),
      donations: transformedDonations,
    };

    return res.status(200).json({ success: true, rfp: response });
  } catch (error) {
    console.warn(error);
    return res
      .status(500)
      .json({ success: false, message: "Internal server error." });
  }
};

exports.getRfpOfCompany = async (req, res) => {
  try {
    if (req.userType !== "company") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }
    const page = parseInt(req.query.page) || 1;
    const limit = 10;
    const skip = (page - 1) * limit;

    const companyId = req.user._id;
    const rfps = await RFP.find(
      { company: companyId },
      { _id: 1, title: 1, sectors: 1, states: 1 }
    )
      .sort({ date: -1 })
      .skip(skip)
      .limit(limit);

    res.status(200).json(rfps);
  } catch (error) {
    console.error("Error retrieving RFPs:", error);
    res.status(500).json({ error: "An error occurred while retrieving RFPs." });
  }
};

const NotifyNgo = async (sectors, states, rfp) => {
  try {
    const ngos = await NGO.find({
      "profile.sectors": { $in: sectors },
      "profile.operation_area": { $in: states },
    });

    CreateNotification(ngos, rfp);

    for (const ngo of ngos) {
      const text = `Dear ${
        ngo.ngo_name
      }, a new RFP is available in your operation area.\nTitle: ${
        rfp.title
      }\nAmount: ${rfp.amount}\nSectors: ${rfp.sectors.join(",")} `;
      try {
        const mailRes = await sendMail(ngo.email, "New RFP Available", text);
      } catch (error) {
        console.error("Error sending email:", error);
      }
    }
  } catch (error) {
    console.error("Error sending emails to NGOs:", error);
  }
};

const CreateNotification = async (ngos, rfp) => {
  try {
    let recipients = [];
    for (const ngo of ngos) {
      recipients.push({ recipient: ngo._id });
    }
    const newNotification = new Notification({
      content: `A new RFP ${
        rfp.title
      } is available in your operation area.Title: ${rfp.title}\nAmount: ${
        rfp.amount
      }\nSectors: ${rfp.sectors.join(",")}`,
      recipients: recipients,
    });

    await newNotification.save();
  } catch (error) {
    console.log("Some error in creating notification ", error);
  }
};

const NotifyCompanyAcceptedRFP = async (rfp, ngo, amount) => {
  try {
    const company = await Company.findById(rfp.company);
    const text = `Dear ${company.company_name},
      An NGO ${ngo} has accepted your RFP. 
      Below are the details of the RFP:
      Title: ${rfp.title}
      Accepted Amount: ${amount}
      Sectors: ${rfp.sectors.join(", ")}`;

    try {
      const mailRes = await sendMail(
        company.email,
        "NGO Accepted the RFP.",
        text
      );
    } catch (error) {
      console.error("Error sending email:", error);
    }

    // creating notification for comapany
    const newNotification = new Notification({
      content: `
      An NGO ${ngo} has accepted your RFP. 
      Below are the details of the RFP:
      
      Title: ${rfp.title}
      Accepted Amount: ${amount}
      Sectors: ${rfp.sectors.join(", ")}
      `,
      recipients: [
        {
          recipient: rfp.company,
          read: false,
        },
      ],
    });

    await newNotification.save();
  } catch (error) {
    console.error("Error notifying to Company:", error);
  }
};
