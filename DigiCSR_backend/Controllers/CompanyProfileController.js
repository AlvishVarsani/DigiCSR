const Company = require("../Models/Company");
const fs = require("fs");
const {
  CompanyProfileValidator,
} = require("../Services/Validators/companyValidator");

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


exports.uploadCertificate = async (req, res) => {

  console.log(req.userType);
  if (req.userType !== "company") {
    return res.status(401).json({ success: false, message: "Not Authorized." });
  }

  if (!req.fileUrl) {
    return res
      .status(400)
      .json({ success: false, message: "No file uploaded" });
  }

  const fileUrl = req.fileUrl;

  try {

    const companyId = req.user._id;
    const company = await Company.findById(companyId);

    if (!company) {
      return res.status(404).json({ success: false, message: "Company not found" });
    }

    // Check if the company already has an existing certificate
    if (company.profile.registration_certificate) {
      // Delete the old certificate file

      const oldCertificatePath = company.profile.registration_certificate;
      const filePath = oldCertificatePath.replace('http://localhost:4000', '');
      // Construct the full file path on the server
      const fullPath = `D:\\digiCSR_backend${filePath}`;

      fs.unlink(fullPath, (err) => {
        if (err) {
          console.error(err);
        }
      });
    }
    // Update the certificate path in the company's profile
    company.profile.registration_certificate = fileUrl;
    await company.save();

    return res.status(200).json({
      success: true,
      message: "Certificate uploaded successfully",
      certificateURL: fileUrl,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      success: false,
      message: "Failed to upload certificate",
      error: error.message,
    });
  }
}

exports.getCertificate = async (req, res) => {
  try {
    const { id } = req.params;
    const company = await Company.findById(id);
    if (!company) {
      return res
        .status(404)
        .json({ success: false, message: "Company not found." });
    }
    const certificatePath = company.profile.registration_certificate;
    if (!certificatePath) {
      return res.status(404).json({
        success: false,
        message: "Registration certificate not found.",
      });
    }

    res.status(200).json({
      success: true,
      message: "Registration certificate found.",
      certificateURL: certificatePath,
    });

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

    const { error } = CompanyProfileValidator.validate({
      ...req.body,
      tax_comp: tax_comp,
      sectors: sectors,
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


exports.uploadLogo = async (req, res) => {

  console.log(req.userType);
  if (req.userType !== "company") {
    return res.status(401).json({ success: false, message: "Not Authorized." });
  }

  if (!req.fileUrl) {
    return res
      .status(400)
      .json({ success: false, message: "No file uploaded" });
  }

  const fileUrl = req.fileUrl;

  try {

    const companyId = req.user._id;
    const company = await Company.findById(companyId);

    if (!company) {
      return res.status(404).json({ success: false, message: "Company not found" });
    }

    // Check if the company already has an existing logo
    if (company.profile.company_logo) {
      // Delete the old logo file

      const oldLogoPath = company.profile.company_logo;
      const filePath = oldLogoPath.replace('http://localhost:4000', '');
      // Construct the full file path on the server
      const fullPath = `D:\\digiCSR_backend${filePath}`;

      fs.unlink(fullPath, (err) => {
        if (err) {
          console.error(err);
        }
      });
    }
    // Update the logo path in the company's profile
    company.profile.company_logo = fileUrl;
    await company.save();

    return res.status(200).json({
      success: true,
      message: "Company logo uploaded successfully",
      LogoURL: fileUrl,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      success: false,
      message: "Failed to upload Company logo",
      error: error.message,
    });
  }
}

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

    const LogoPath = company.profile.company_logo;
    if (!LogoPath) {
      return res.status(404).json({
        success: false,
        message: "Company logo not found.",
      });
    }


    res.status(200).json({
      success: true,
      message: "Company logo found.",
      LogoURL: LogoPath,
    });

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
      { "profile.registration_certificate": 0 }
    );
    return res.status(200).json({ success: true, companies });
  } catch (error) {
    console.log(error);
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
