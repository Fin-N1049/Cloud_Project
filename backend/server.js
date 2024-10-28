const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const cors = require('cors');

// Environment configuration
dotenv.config();

// Initialize express app
const app = express();

// Middleware to handle JSON and CORS
app.use(express.json());
app.use(cors());

// MongoDB connection
mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
.then(() => console.log('MongoDB connected'))
.catch((err) => console.error(err));

// Import routes
const contentRoutes = require('./routes/contentRoutes'); // For homepage data
const authRoutes = require('./routes/authRoutes'); // For signup/signin

// Route Middleware
app.use('/api/auth', authRoutes); // User Authentication Routes
app.use('/api/homepage', contentRoutes); // Routes for announcements, events, clubs, and workshops

// Start the server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
