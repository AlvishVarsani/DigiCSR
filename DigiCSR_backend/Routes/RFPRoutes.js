const {
  AddRfp,
  getAllRfps,
  getRFPDetails,
  acceptRFP,
  getRfpOfCompany,
  getRFP,
  manageDonation,
  deleteRFP,
} = require("../Controllers/RFPControllers");
const AuthMiddleware = require("../Middlewares/AuthMiddleware");

const RFPRoutes = (app) => {
  app.post("/add-rfp", AuthMiddleware, AddRfp);
  app.get("/rfps", AuthMiddleware, getAllRfps);
  app.get("/rfp-details/:id", AuthMiddleware, getRFPDetails);
  app.put("/accept-rfp", AuthMiddleware, acceptRFP);
  app.get("/company/rfp", AuthMiddleware, getRfpOfCompany);
  app.get("/rfp/:id", AuthMiddleware, getRFP);
  app.put("/rfp/manage", AuthMiddleware, manageDonation);
  app.delete("/rfp/delete/:id", AuthMiddleware, deleteRFP);
};

module.exports = RFPRoutes;
