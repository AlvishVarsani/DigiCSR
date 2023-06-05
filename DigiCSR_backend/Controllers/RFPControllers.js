const Company = require("../Models/Company");
const RFP = require("../Models/RFP");

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
