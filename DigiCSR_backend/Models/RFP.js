const mongoose = require("mongoose");
const RFPSchema = mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  amount: {
    type: Number,
    required: true,
  },
  remaining_amount: {
    type: Number,
  },
  sectors: [
    {
      type: String,
      required: true,
    },
  ],
  states: [
    {
      type: String,
      required: true,
    },
  ],
  timeline: {
    type: String,
    required: true,
  },
  company: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Company",
    required: true,
  },
  donations: [
    {
      ngo: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "NGO",
      },
      amount: {
        type: Number,
      },
      date: {
        type: Date,
      },
      status: {
        type: String,
        default: "Pending",
      },
    },
  ],
  date: {
    type: Date,
    required: true,
  },
});

const RFP = mongoose.model("RFP", RFPSchema);
module.exports = RFP;
