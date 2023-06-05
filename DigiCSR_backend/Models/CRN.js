const mongoose = require("mongoose");

const CRNSchema = mongoose.Schema({
  cin: {
    type: String,
    unique: true,
  },
  csr: {
    type: String,
    unique: true,
  },
  email: {
    type: String,
    unique: true,
  },
});

const CRN = mongoose.model("CRN", CRNSchema);
module.exports = CRN;
