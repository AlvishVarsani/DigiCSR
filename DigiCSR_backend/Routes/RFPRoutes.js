const {
  AddRfp,
  getAllRfps,
  getRFPDetails,
} = require("../Controllers/RFPControllers");
const RFPRoutes = (app) => {
  app.post("/add-rfp", AddRfp);
  app.get("/rfps", getAllRfps);
  app.get("/rfp-details/:id", getRFPDetails);
};

module.exports = RFPRoutes;
