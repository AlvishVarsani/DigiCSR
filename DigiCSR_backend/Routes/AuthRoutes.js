const {
  CompanySignup,
  VerifyCompany,
} = require("../Controllers/AuthController");
const { NGOSignup, VerifyNGO } = require("../Controllers/AuthNGOController");
const { CompanyLogin, CompanyLoginVerify } = require("../Controllers/AuthController");
const { NGOLogin, NGOLoginVerify } = require("../Controllers/AuthNGOController");
const { BeneficiarySignup, VerifyBeneficiary } = require("../Controllers/AuthBeneficiaryController");
const {BeneficiaryLogin, BeneficiaryLoginVerify} = require("../Controllers/AuthBeneficiaryController");

const AuthRoutes = (app) => {
  app.post("/company/signup", CompanySignup);
  app.post("/company/verify", VerifyCompany);
  app.post("/ngo/signup", NGOSignup);
  app.post("/ngo/verify", VerifyNGO);
  app.post("/company/login", CompanyLogin);
  app.post("/company/login/verify", CompanyLoginVerify);
  app.post("/NGO/login", NGOLogin);
  app.post("/NGO/login/verify", NGOLoginVerify);
  app.post("/Beneficiary/signup", BeneficiarySignup);
  app.post("/Beneficiary/verify", VerifyBeneficiary);
  app.post("/Beneficiary/login", BeneficiaryLogin);
  app.post("/Beneficiary/login/verify", BeneficiaryLoginVerify);
};
module.exports = AuthRoutes;
