const Joi = require("joi");

exports.BenfValidators = Joi.object({
  name: Joi.string().required(),
  email: Joi.string().email().required(),
  mobile_no: Joi.string().required(),
  aadhar_no: Joi.number()
    .integer()
    .min(1e11)
    .max(1e12 - 1)
    .required(),
});
