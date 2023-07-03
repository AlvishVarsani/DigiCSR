const NGO = require("../Models/NGO");
const fs = require("fs");
const { NgoProfileValidator } = require("../Services/Validators/ngoValidators");

exports.getNGOProfile = async (req, res) => {
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
      ngo_name: ngo.ngo_name,
      email: ngo.email,

      profile: {
        summary: ngo.profile.summary,
        board_members: ngo.profile.board_members,
        csr_budget: ngo.profile.csr_budget,
        operation_area: ngo.profile.operation_area,
        sectors: ngo.profile.sectors,
        location: ngo.profile.location,
        phone: ngo.profile.phone,
        establishment_year: ngo.profile.establishment_year,
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

exports.AddNGOProfile = async (req, res) => {
  try {
    if (req.userType !== "ngo") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }
    const NGOId = req.user.id;
    const {
      ngo_name,
      summary,
      board_members,
      csr_budget,
      operation_area,
      sectors,
      city,
      state,
      pincode,
      establishment_year,
      phone,
    } = req.body;

    let updatedFields = {
      ngo_name: ngo_name,
      "profile.summary": summary,
      "profile.board_members": board_members,
      "profile.csr_budget": csr_budget,
      "profile.operation_area": operation_area,
      "profile.sectors": sectors,
      "profile.location.city": city,
      "profile.location.state": state,
      "profile.location.pincode": pincode,
      "profile.establishment_year": establishment_year,
      "profile.phone": phone,
    };

    // console.warn(req.body);
    const { error } = NgoProfileValidator.validate({
      ...req.body,
    });
    if (error) {
      console.warn(error.details);
      return res
        .status(400)
        .json({ success: false, message: error.details[0].message });
    }

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

exports.uploadNgoLogo = async (req, res) => {
  console.log(req.userType);
  if (req.userType !== "ngo") {
    return res.status(401).json({ success: false, message: "Not Authorized." });
  }

  if (!req.fileUrl) {
    return res
      .status(400)
      .json({ success: false, message: "No file uploaded" });
  }

  const fileUrl = req.fileUrl;

  try {
    const ngoId = req.user._id;
    const ngo = await NGO.findById(ngoId);

    if (!ngo) {
      return res
        .status(404)
        .json({ success: false, message: "NGO not found!!" });
    }

    // Check if the ngo already has an existing logo
    if (ngo.profile.ngo_logo) {
      // Delete the old logo file

      const oldLogoPath = ngo.profile.ngo_logo;
      const filePath = oldLogoPath.replace("http://192.168.155.94:4000", "");
      // Construct the full file path on the server
      const fullPath = `D:\\digiCSR_backend${filePath}`;

      fs.unlink(fullPath, (err) => {
        if (err) {
          console.error(err);
        }
      });
    }
    // Update the logo path in the ngo's profile
    ngo.profile.ngo_logo = fileUrl;
    await ngo.save();

    return res.status(200).json({
      success: true,
      message: "NGO logo uploaded successfully",
      LogoURL: fileUrl,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      success: false,
      message: "Failed to upload NGO logo",
      error: error.message,
    });
  }
};

exports.getNgoLogo = async (req, res) => {
  try {
    const { id } = req.params;
    const ngo = await NGO.findOne(
      { _id: id },
      {
        "profile.ngo_logo": 1,
      }
    );
    if (!ngo) {
      return res
        .status(404)
        .json({ success: false, message: "NGO not found." });
    }

    const LogoPath = ngo.profile.ngo_logo;
    if (!LogoPath) {
      return res.status(404).json({
        success: false,
        message: "NGO logo not found.",
      });
    }

    res.status(200).json({
      success: true,
      message: "NGO logo found.",
      LogoURL: LogoPath,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};

exports.getAllNgo = async (req, res) => {
  try {
    const userType = req.userType;
    if (userType === "ngo") {
      return res
        .status(403)
        .send({ success: false, message: "Not Authorized." });
    }
    const ngos = await NGO.find(
      {},
      {
        _id: 1,
        email: 1,
        ngo_name: 1,
        "profile.phone": 1,
        "profile.location": 1,
        "profile.operation_area": 1,
        "profile.sectors": 1,
        "profile.ngo_logo": 1,
        "profile.summary": 1,
        "profile.establishment_year": 1,
      }
    );
    return res.status(200).send({ success: true, ngos });
  } catch (error) {
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};

exports.deleteNgo = async (req, res) => {
  try {
    const userType = req.userType;
    if (userType !== "Admin") {
      return res
        .status(403)
        .send({ success: false, message: "Not Authorized." });
    }
    const _id = req.body._id;
    const ngo = await NGO.findOne({ _id });
    if (!ngo) {
      return res
        .status(404)
        .json({ success: false, message: "NGO not found." });
    }
    const result = await NGO.findByIdAndDelete(_id);
    if (!result) {
      return res
        .status(500)
        .json({ success: false, message: "Failed to delete ngo." });
    }
    return res.status(200).send({ success: true, message: "Ngo Deleted." });
  } catch (error) {
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};
