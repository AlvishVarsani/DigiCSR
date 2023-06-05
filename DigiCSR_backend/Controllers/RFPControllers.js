require("dotenv").config({ path: "../.env" });
const NGO = require("../Models/NGO");
const RFP = require("../Models/RFP");
const Notification = require("../Models/Notification");
const Company = require("../Models/Company");

exports.AddRfp = async (req, res) => {
  try {
    const { title, amount, timeline, sectors, states, company } = req.body;
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
  /**
   * company name
   * date of raise
   * expiry date
   * cp name
   * cp email
   * states of rfp
   * sectors of rfp
   * about company
   * location of company in one
   * sectors of company
   */
  try {
    const id = req.params.id;
    const rfp = await RFP.findById(id);
    if (!rfp) {
      return res
        .status(404)
        .json({ success: false, message: "RFP not found." });
    }
    return res.status(200).json({ success: true, rfp });
  } catch (error) {
    return res
      .status(500)
      .json({ success: false, message: "Internal server error." });
  }
};

exports.acceptRFP = async (req, res) => {
  const { rfpID, amount, ngoId } = req.body;

  try {
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

exports.getRfpOfCompany = async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = 10;
    const skip = (page - 1) * limit;

    const companyId = req.body.id;
    const rfps = await RFP.find(
      { company: companyId },
      { title: 1, sectors: 1, states: 1 }
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

    // const transporter = nodemailer.createTransport({
    //   host: "smtp.gmail.com",
    //   port: 587,
    //   secure: false,
    //   requireTLS: true,
    //   auth: {
    //     user: process.env.MAILER,
    //     pass: process.env.EMAILPASS,
    //   },
    // });

    CreateNotification(ngos, rfp);

    ngos.forEach(async (ngo) => {
      // const mailOptions = {
      //   from: process.env.MAILER,
      //   to: ngo.email,
      //   subject: "New RFP Available",
      //   text: `Dear ${
      //     ngo.ngo_name
      //   }, a new RFP is available in your operation area.\nTitle: ${
      //     rfp.title
      //   }\nAmount: ${rfp.amount}\nSectors: ${rfp.sectors.join(",")} `,
      // };

      // transporter.sendMail(mailOptions, function (error, info) {
      //   if (error) {
      //     console.log(error);
      //   } else {
      //     // console.log("Email sent: " + info.response);
      //   }
      // });


      const text = `Dear ${ngo.ngo_name}, a new RFP is available in your operation area.\nTitle: ${rfp.title}\nAmount: ${rfp.amount}\nSectors: ${rfp.sectors.join(",")} `;

      try {
        const mailRes = await sendMail(ngo.email, "New RFP Available", text);
        console.log('Email response:', mailRes);
        res.status(200).send({ success: true, message: 'OTP sent' });
      } catch (error) {
        console.error('Error sending email:', error);
        res.status(500).json({ success: false, message: 'Error sending Mail' });
      }

    });
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
      content: `A new RFP ${rfp.title
        } is available in your operation area.Title: ${rfp.title}\nAmount: ${rfp.amount
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

    // const transporter = nodemailer.createTransport({
    //   host: "smtp.gmail.com",
    //   port: 587,
    //   secure: false,
    //   requireTLS: true,
    //   auth: {
    //     user: process.env.MAILER,
    //     pass: process.env.EMAILPASS,
    //   },
    // });
    // // CreateNotification(ngos, rfp);

    // const mailOptions = {
    //   from: process.env.MAILER,
    //   to: company.email,
    //   subject: "NGO Acceptance of RFP.",
    //   text: `Dear ${company.company_name},

    //   An NGO ${ngo} has accepted your RFP. 
    //   Below are the details of the RFP:

    //   Title: ${rfp.title}
    //   Accepted Amount: ${amount}
    //   Sectors: ${rfp.sectors.join(", ")}
    //   `,
    // };

    // transporter.sendMail(mailOptions, function (error, info) {
    //   if (error) {
    //     console.log(error);
    //   } else {
    //     console.log("Email sent: " + info.response);
    //   }
    // });

    const text = `Dear ${company.company_name},
      An NGO ${ngo} has accepted your RFP. 
      Below are the details of the RFP:
      Title: ${rfp.title}
      Accepted Amount: ${amount}
      Sectors: ${rfp.sectors.join(", ")}`;

    try {
      const mailRes = await sendMail(company.email, "NGO Accepted the RFP.", text);
      console.log('Email response:', mailRes);
      res.status(200).send({ success: true, message: 'OTP sent' });
    } catch (error) {
      console.error('Error sending email:', error);
      res.status(500).json({ success: false, message: 'Error sending Mail' });
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
