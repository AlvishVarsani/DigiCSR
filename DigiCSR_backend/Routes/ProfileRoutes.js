const multer = require("multer");

const {
  getCompanyProfile,
  AddCompanyProfile,
  getCertificate,
} = require("../Controllers/CompanyProfileController");

const {
  getNGOProfile,
  AddNGOProfile,
} = require("../Controllers/NGOProfileController");

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
  app.get("/company/profile/:id", getCompanyProfile);
  app.get("/company/certificate/:id", getCertificate);
  app.post(
    "/company/add-profile/:id",
    upload.fields([
      { name: "registration_certificate", maxCount: 1 },
      { name: "company_logo", maxCount: 1 },
    ]),
    AddCompanyProfile
  );
  app.get("/NGO/profile/:id", getNGOProfile);
  // app.get("/NGO/certificate/:id" , getNGOCertificate);
  app.post(
    "/NGO/add-profile/:id",
    upload.fields([
      { name: "NGO_certificate", maxCount: 1 },
      { name: "company_logo", maxCount: 1 },
    ]),
    AddNGOProfile
  );
};
module.exports = ProfileRoutes;
