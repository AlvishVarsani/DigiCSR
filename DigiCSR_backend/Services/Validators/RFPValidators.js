const Joi = require("joi");
exports.RFPValidator = Joi.object({
  title: Joi.string().required(),
  amount: Joi.number().required(),
  sectors: Joi.array().items(Joi.string().required()).required(),
  states: Joi.array().items(Joi.string().required()).required(),
  timeline: Joi.string().required(),
});
