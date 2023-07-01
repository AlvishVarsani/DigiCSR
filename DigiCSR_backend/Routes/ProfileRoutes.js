const multer = require("multer");

const fileUploaderMiddleware = require("../Middlewares/fileUploaderMiddleware");
const logoUploaderMiddleware = fileUploaderMiddleware("logo");
const certificateUploaderMiddleware = fileUploaderMiddleware("certificate");

const {
  getCompanyProfile,
  AddCompanyProfile,
  getCertificate,
  getCompanyLogo,
  getAllCompany,
  deleteCompany,
  uploadLogo,
  uploadCertificate,
} = require("../Controllers/CompanyProfileController");

const {
  getNGOProfile,
  AddNGOProfile,
  getNgoLogo,
  getAllNgo,
  deleteNgo,
  uploadNgoLogo,
} = require("../Controllers/NGOProfileController");
const AuthMiddleware = require("../Middlewares/AuthMiddleware");
const {
  deleteBeneficiary,
  getAllBeneficiaries,
} = require("../Controllers/AuthBeneficiaryController");
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  filename: function (req, file, cb) {
    // Set the filename of the uploaded file
    cb(null, file.originalname);
  },
});
const upload = multer({ storage: storage });

const ProfileRoutes = (app) => {
  // company
  app.get("/company/profile/:id", getCompanyProfile);
  app.get("/company/certificate/:id", getCertificate);
  app.get("/company/logo/:id", getCompanyLogo);
  app.post("/company/add-profile", AuthMiddleware, upload.none(), AddCompanyProfile);

  app.post(
    "/company/upload-logo",
    AuthMiddleware,
    logoUploaderMiddleware,
    uploadLogo
  );
  app.post(
    "/company/upload-certificate",
    AuthMiddleware,
    certificateUploaderMiddleware,
    uploadCertificate
  );

  // Ngo
  app.get("/NGO", AuthMiddleware, getAllNgo);
  app.get("/NGO/profile/:id", getNGOProfile);
  app.get("/NGO/logo/:id", getNgoLogo);
  app.post("/NGO/add-profile", AuthMiddleware, upload.none(), AddNGOProfile);

  app.post(
    "/ngo/upload-logo",
    AuthMiddleware,
    logoUploaderMiddleware,
    uploadNgoLogo
  );

  // Admin
  app.delete("/company/delete", AuthMiddleware, deleteCompany);
  app.delete("/NGO/delete", AuthMiddleware, deleteNgo);
  app.delete("/Beneficiary/delete", AuthMiddleware, deleteBeneficiary);
  app.get("/Beneficiaries", AuthMiddleware, getAllBeneficiaries);
  app.get("/companies", AuthMiddleware, getAllCompany);
};
module.exports = ProfileRoutes;
