const mongoose = require('mongoose');

// Message Schema for MongoDB
const messageSchema = new mongoose.Schema({
    username: { type: String, required: true },
    text: { type: String, required: true },
    timestamp: { type: Date, default: Date.now },
});

const Message = mongoose.model('Message', messageSchema); // Create model

module.exports = Message; // Export the Message model
