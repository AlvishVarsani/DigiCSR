const {
  AddRfp,
  getAllRfps,
  getRFPDetails,
  acceptRFP,
  getRfpOfCompany,
} = require("../Controllers/RFPControllers");
const RFPRoutes = (app) => {
  app.post("/add-rfp", AddRfp);
  app.get("/rfps", getAllRfps);
  app.get("/rfp-details/:id", getRFPDetails);
  app.put("/accept-rfp", acceptRFP);
  app.get("/company/rfp", getRfpOfCompany);
};

module.exports = RFPRoutes;
