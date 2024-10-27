const Content = require('../models/Content');

// Fetch content for the homepage (sliding sections)
exports.getHomepageContent = async (req, res) => {
    try {
        // Fetch latest announcements, events, clubs, and workshops
        const announcements = await Content.find({ category: 'announcement' }).sort({ date: 1 }).limit(3);
        const events = await Content.find({ category: 'event' }).sort({ date: 1 }).limit(3);
        const clubs = await Content.find({ category: 'club' }).sort({ date: 1 }).limit(3);
        const workshops = await Content.find({ category: 'workshop' }).sort({ date: 1 }).limit(3);

        // Send response with the data for each category
        res.status(200).json({
            announcements,
            events,
            clubs,
            workshops
        });
    } catch (err) {
        res.status(500).json({ message: 'Server error', error: err.message });
    }
};

// Fetch all content for a specific category (e.g., all events)
exports.getAllContent = async (req, res) => {
    const { category } = req.params;

    try {
        const content = await Content.find({ category }).sort({ date: 1 });
        if (!content) {
            return res.status(404).json({ message: 'No content found for this category' });
        }

        res.status(200).json(content);
    } catch (err) {
        res.status(500).json({ message: 'Server error', error: err.message });
    }
};
