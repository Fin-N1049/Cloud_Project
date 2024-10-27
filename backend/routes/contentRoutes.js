const express = require('express');
const router = express.Router();
const { getHomepageContent, getAllContent } = require('../controllers/contentController');

// Route to get homepage content (sliding sections)
router.get('/homepage', getHomepageContent);

// Route to get all content for a specific category
router.get('/:category', getAllContent);

module.exports = router;
