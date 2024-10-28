const mongoose = require('mongoose');

// Schema for content (announcements, events, clubs, workshops)
const contentSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    category: {
        type: String,
        enum: ['announcements', 'event', 'club'], // Category
        required: true
    },
    description: {
        type: String,
        required: true
    },
    date: { type: Date, 
        default: Date.now }, 
    contents: {
        type: String,
        required: true
    }
});

module.exports = mongoose.model('Content', contentSchema);
