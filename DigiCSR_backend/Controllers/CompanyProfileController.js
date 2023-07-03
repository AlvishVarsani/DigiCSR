const Company = require("../Models/Company");
const fs = require("fs");
const {
  CompanyProfileValidator,
} = require("../Services/Validators/companyValidator");

// Route to fetch data from the Company schema
exports.
getCompanyProfile = async (req, res) => {
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
        summary: company.profile.summary,

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
    if (req.userType !== "company") {
      return res
        .status(400)
        .send({ success: false, message: "Not Authorized." });
    }
    const companyId = req.user.id;
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
    console.log(req.body);
    let fileData, imageData;
    // console.warn(tax_comp);
    let updatedFields = {
      company_name,
      "profile.summary": summary,
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

    if (req.files) {
      if (req.files.registration_certificate) {
        fileData = fs.readFileSync(req.files.registration_certificate[0].path);
        updatedFields["profile.registration_certificate"] = fileData;
      }
      if (req.files.company_logo) {
        imageData = fs.readFileSync(req.files.company_logo[0].path);
        updatedFields["profile.company_logo"] = imageData;
      }
    }
    const { error } = CompanyProfileValidator.validate({
      ...req.body,
      tax_comp: tax_comp,
      sectors: sectors,
      registration_certificate: fileData,
      company_logo: imageData,
    });
    console.warn({
      ...req.body,
      tax_comp: tax_comp,
      sectors: sectors,
    });
    if (error) {
      console.warn(error.details);
      return res
        .status(400)
        .json({ success: false, message: error.details[0].message });
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

exports.getCompanyLogo = async (req, res) => {
  try {
    const { id } = req.params;
    const company = await Company.findOne(
      { _id: id },
      {
        "profile.company_logo": 1,
      }
    );
    if (!company) {
      return res
        .status(404)
        .json({ success: false, message: "Company not found." });
    }

    const logoBuffer = company.profile.company_logo;
    if (!logoBuffer) {
      return res.status(404).json({
        success: false,
        message: "Registration certificate not found.",
      });
    }

    res.set("Content-Type", "image");
    res.send(logoBuffer);
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};

exports.getAllCompany = async (req, res) => {
  try {
    const userType = req.userType;
    if (userType !== "Admin") {
      return res
        .status(403)
        .send({ success: false, message: "Not Authorized." });
    }
    const companies = await Company.find(
      {},
      { "profile.registration_certificate": 0, "profile.company_logo": 0 }
    );
    return res.status(200).send({ success: true, companies });
  } catch (error) {
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};

exports.deleteCompany = async (req, res) => {
  try {
    const userType = req.userType;
    if (userType !== "Admin") {
      return res
        .status(403)
        .send({ success: false, message: "Not Authorized." });
    }
    const _id = req.body._id;
    const company = await Company.findOne({ _id });
    if (!company) {
      return res
        .status(404)
        .json({ success: false, message: "Company not found." });
    }
    const result = await Company.findByIdAndDelete(_id);
    if (!result) {
      return res
        .status(500)
        .json({ success: false, message: "Failed to delete company." });
    }
    return res.status(200).send({ success: true, message: "Company Deleted." });
  } catch (error) {
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};
