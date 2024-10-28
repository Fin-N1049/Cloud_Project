const express = require('express');
const router = express.Router();
const Content = require('../models/Content');

// Get limited data for homepage (current happenings)
router.get('/homepage', async (req, res) => {
    try {
        const announcements = await Content.find({ category: 'announcements' }).sort({ date: 1 }).limit(5);
        const events = await Content.find({ category: 'events' }).sort({ date: 1 }).limit(5);
        const clubs = await Content.find({ category: 'clubs' }).sort({ date: 1 }).limit(5);

        res.json({
            announcements,
            events,
            clubs,
        });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Get all entries for a specific category (announcements, events, clubs)
router.get('/:category', async (req, res) => {
    const category = req.params.category;
    try {
        const content = await Content.find({ category });
        res.json(content);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Add new entry for any category
router.post('/:category', async (req, res) => {
    const category = req.params.category;
    const { title, description,contents } = req.body;

    try {
        const newContent = new Content({
            title,
            category,
            description,
            contents
        });

        const savedContent = await newContent.save();
        res.json(savedContent);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;
