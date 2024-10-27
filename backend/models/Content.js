const mongoose = require('mongoose');

// Schema for content (announcements, events, clubs, workshops)
const contentSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    type: {
        type: String,
        enum: ['social', 'tech', 'art', 'sports'], // Example types
        required: true
    },
    date: {
        type: Date,
        required: true
    },
    time: {
        type: String,
        required: true
    },
    location: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    image: {
        type: String, // URL of the image
        required: true
    },
    category: {
        type: String,
        enum: ['announcement', 'event', 'club', 'workshop'], // Category
        required: true
    },
});

module.exports = mongoose.model('Content', contentSchema);
