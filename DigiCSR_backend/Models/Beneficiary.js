const mongoose = require("mongoose");

const BeneficiarySchema = mongoose.Schema({
    name : {
        type : String,
        required : true,
    },

    email : {
        type : String,
        required : true,
    },

    mobile_no : {
        type : String,
        required : true,
    },

    aadhar_no : {
        type : String,
        required : true,
    },
});

const Beneficiary = mongoose.model("Beneficiary", BeneficiarySchema);
module.exports = Beneficiary;