const mongoose = require("mongoose");

const reviewSchema = new mongoose.Schema({
  ngo: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "NGO",
    required: true,
  },
  companyReviewer: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Company",
  },
  beneficiaryReviewer: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Beneficiary",
  },
  rating: {
    type: Number,
    required: true,
  },
  review: {
    type: String,
    required: true,
  },
});

const NGOReview = mongoose.model("NGOReview", reviewSchema);
module.exports = NGOReview;
