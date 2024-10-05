const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const authRoutes = require('./routes/auth'); // Import authentication routes

dotenv.config();
const app = express();

// Middleware to parse JSON
app.use(express.json());

// Connect to MongoDB
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log('MongoDB connected'))
    .catch((err) => console.log(err));

// Use authentication routes
app.use('/api/auth', authRoutes); // Add this line
console.log("auth called")
app.listen(5000, () => {
    console.log('Server running on port 5000');
});
