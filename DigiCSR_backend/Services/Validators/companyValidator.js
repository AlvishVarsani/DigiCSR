const Joi = require("joi");

exports.CompanySignupValidator = Joi.object({
  cin: Joi.string().required(),
  email: Joi.string().email().required(),
});

exports.CompanyProfileValidator = Joi.object({
  company_name: Joi.string().required(),
  summary: Joi.string().required(),
  city: Joi.string().required(),
  state: Joi.string().required(),
  pincode: Joi.string().required(),
  establishment_year: Joi.number().required(),
  cp_name: Joi.string().required(),
  cp_email: Joi.string().email().required(),
  cp_designation: Joi.string().required(),
  cp_phone: Joi.string().required(),
  tax_comp: Joi.array().items(Joi.string()).required(),
  sectors: Joi.array().items(Joi.string()).required(),
  registration_certificate: Joi.binary(),
  company_logo: Joi.binary(),
});

exports.CompanyLoginValidator = Joi.object({
  email: Joi.string().email().required(),
});
