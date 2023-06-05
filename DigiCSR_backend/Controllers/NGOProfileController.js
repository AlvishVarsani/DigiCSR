const NGO = require("../Models/NGO");
const fs = require("fs");

exports.getNGOProfile = async (req,res) => {
  try {
    const NGOId = req.params.id;

    // Retrieve the NGO document by its ID
    const ngo = await NGO.findById(NGOId).populate("profile.board_members");

    if (!ngo) {
      return res
        .status(404)
        .json({ success: false, message: "NGO not found." });
    }

    // Prepare the response data
    const responseData = {
      NGO_name : ngo.ngo_name,
      email : ngo.email,

      profile : {
        summary : ngo.profile.summary,
        board_members : ngo.profile.board_members,
        csr_budget : ngo.profile.csr_budget,
        operation_area : ngo.profile.operation_area,
        sectors : ngo.profile.sectors,
      },
    };

    res.status(200).json({
      success: true,
      data: responseData,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};

// exports.getNGOCertificate = async (req,res) => {};

exports.AddNGOProfile = async (req,res) => {
  try {
    const NGOId = req.params.id;
    const {
      NGO_name,
      summary,
      board_members,
      csr_budget,
      operation_area,
      sectors,
    } = req.body;

    let updatedFields = {
      ngo_name : NGO_name,
      "profile.summary" : summary,
      "profile.board_members" : board_members,
      "profile.csr_budget" : csr_budget,
      "profile.operation_area" : operation_area,
      "profile.sectors" : sectors,
    };

    const ngo = await NGO.findByIdAndUpdate(
      NGOId,
      { $set: updatedFields },
      { new: true }
    );

    if (!ngo) {
      return res
        .status(404)
        .json({ success: false, message: "NGO not found." });
    }

    res.status(200).json({
      success: true,
      message: ngo,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};