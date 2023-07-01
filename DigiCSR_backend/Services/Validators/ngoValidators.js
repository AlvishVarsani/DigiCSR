const Joi = require("joi");

exports.NgoSingupValidator = Joi.object({
  csr: Joi.string().required(),
  email: Joi.string().required(),
});

exports.NgoProfileValidator = Joi.object({
  ngo_name: Joi.string().required(),
  summary: Joi.string().required(),
  board_members: Joi.array()
    .items(
      Joi.object({
        bm_name: Joi.string(),
        bm_gender: Joi.string(),
        bm_din: Joi.string(),
        bm_phone: Joi.string(),
        bm_designation: Joi.string(),
      })
    )
    .required(),
  csr_budget: Joi.number().required(),
  operation_area: Joi.array().items(Joi.string()).required(),
  sectors: Joi.array().items(Joi.string()).required(),
  ngo_logo: Joi.string(),
  phone: Joi.string().required(),
  city: Joi.string().required(),
  state: Joi.string().required(),
  pincode: Joi.number().required(),
  establishment_year: Joi.number().required(),
});
