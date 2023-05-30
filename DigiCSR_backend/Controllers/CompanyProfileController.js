const Company = require("../Models/Company");
const fs = require("fs");

// Route to fetch data from the Company schema
exports.getCompanyProfile = async (req, res) => {
  try {
    const companyId = req.params.id;

    // Retrieve the company document by its ID
    const company = await Company.findById(companyId);

    if (!company) {
      return res
        .status(404)
        .json({ success: false, message: "Company not found." });
    }

    // Prepare the response data
    const responseData = {
      company_name: company.company_name,
      email: company.email,
      profile: {

        summary : company.profile.summary,

        location: {
          city: company.profile.location.city,
          state: company.profile.location.state,
          pincode: company.profile.location.pincode,
        },
        establishment_year: company.profile.establishment_year,
        comunication_person: {
          cp_name: company.profile.comunication_person.cp_name,
          cp_email: company.profile.comunication_person.cp_email,
          cp_designation: company.profile.comunication_person.cp_designation,
          cp_phone: company.profile.comunication_person.cp_phone,
        },
        tax_comp: company.profile.tax_comp,
        sectors: company.profile.sectors,
      },
    };

    res.status(200).json({
      success: true,
      data: responseData,
    });
  } catch (error) {
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};

exports.getCertificate = async (req, res) => {
  try {
    const { id } = req.params;
    const company = await Company.findById(id);
    if (!company) {
      return res
        .status(404)
        .json({ success: false, message: "Company not found." });
    }

    const certificateBuffer = company.profile.registration_certificate;
    if (!certificateBuffer) {
      return res.status(404).json({
        success: false,
        message: "Registration certificate not found.",
      });
    }

    res.set("Content-Type", "application/pdf");
    res.send(certificateBuffer);
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};

exports.AddCompanyProfile = async (req, res) => {
  try {
    const companyId = req.params.id;
    const {
      company_name,
      summary,
      city,
      state,
      pincode,
      establishment_year,
      cp_name,
      cp_email,
      cp_designation,
      cp_phone,
      tax_comp,
      sectors,
    } = req.body;

    let updatedFields = {
      company_name,
      "company.profile.summary" : summary,
      "profile.location.city": city,
      "profile.location.state": state,
      "profile.location.pincode": pincode,
      "profile.establishment_year": establishment_year,
      "profile.comunication_person.cp_name": cp_name,
      "profile.comunication_person.cp_email": cp_email,
      "profile.comunication_person.cp_designation": cp_designation,
      "profile.comunication_person.cp_phone": cp_phone,
      "profile.tax_comp": tax_comp,
      "profile.sectors": sectors,
    };

    if (req.file && req.file.path) {
      const fileData = fs.readFileSync(req.file.path);
      updatedFields["profile.registration_certificate"] = fileData;
    }

    const company = await Company.findByIdAndUpdate(
      companyId,
      { $set: updatedFields },
      { new: true }
    );

    if (!company) {
      return res
        .status(404)
        .json({ success: false, message: "Company not found." });
    }

    res.status(200).json({
      success: true,
      message: company,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};
