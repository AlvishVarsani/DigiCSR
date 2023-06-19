const multer = require("multer");

const {
  getCompanyProfile,
  AddCompanyProfile,
  getCertificate,
  getCompanyLogo,
  getAllCompany,
} = require("../Controllers/CompanyProfileController");

const {
  getNGOProfile,
  AddNGOProfile,
  getNgoLogo,
  getAllNgo,
} = require("../Controllers/NGOProfileController");
const AuthMiddleware = require("../Middlewares/AuthMiddleware");
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
  app.get("/company", AuthMiddleware, getAllCompany);
  app.get("/NGO", AuthMiddleware, getAllNgo);
  app.get("/company/profile/:id", getCompanyProfile);
  app.get("/company/certificate/:id", getCertificate);
  app.get("/company/logo/:id", getCompanyLogo);
  app.post(
    "/company/add-profile",
    upload.fields([
      { name: "registration_certificate", maxCount: 1 },
      { name: "company_logo", maxCount: 1 },
    ]),
    AuthMiddleware,
    AddCompanyProfile
  );
  app.get("/NGO/profile/:id", getNGOProfile);
  app.get("/NGO/logo/:id", getNgoLogo);
  app.post(
    "/NGO/add-profile",
    upload.fields([{ name: "ngo_logo", maxCount: 1 }]),
    AuthMiddleware,
    AddNGOProfile
  );
};
module.exports = ProfileRoutes;
