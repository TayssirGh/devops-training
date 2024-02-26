const mongoose = require('mongoose');

const accessSchema = new mongoose.Schema(
    {
        qr_id: {type: String, required: true},
        qr_content: {type: String, required: true},
        qr_url: {type: String, required: false},
        access_date: {type: Date, default: Date.now},
        is_s3: {type: Boolean, default: false},
    },
    {
        timestamps: true,
        toObject: {
            versionKey: false,
        },
    },
);

module.exports = mongoose.model('Access', accessSchema);
