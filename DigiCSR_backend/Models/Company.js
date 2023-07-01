const mongoose = require("mongoose");

const CompanySchema = mongoose.Schema({
  cin: {
    type: String,
    required: true,
    unique: true,
  },
  company_name: {
    type: String,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  profile: {
    summary: {
      type: String,
    },

    location: {
      city: String,
      state: String,
      pincode: String,
    },
    establishment_year: {
      type: Number,
    },
    comunication_person: {
      cp_name: {
        type: String,
      },
      cp_email: {
        type: String,
      },
      cp_designation: {
        type: String,
      },
      cp_phone: {
        type: String,
      },
    },
    registration_certificate: {
      type: String,
    },
    company_logo: {
      type: String,
    },
    tax_comp: [{ type: String }],
    sectors: [{ type: String }],
  },
  initial_data: [
    {
      year: {
        type: Number,
      },
      sector: {
        type: String,
      },
      amount: {
        type: Number,
      },
    },
  ],
});

const Company = mongoose.model("Company", CompanySchema);
module.exports = Company;
