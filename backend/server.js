const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const cors = require('cors');
const http = require('http');
const socketIo = require('socket.io');

// Environment configuration
dotenv.config();

// Initialize express app
const app = express();
const server = http.createServer(app); // Create server for Socket.IO
const io = socketIo(server); // Initialize Socket.IO

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

// Import Message model
const Message = require('./models/Message'); // Import the Message model

// Import routes
const contentRoutes = require('./routes/contentRoutes'); // For homepage data
const authRoutes = require('./routes/auth'); // For signup/signin

// Route Middleware
app.use('/api/auth', authRoutes); // User Authentication Routes
app.use('/api/homepage', contentRoutes); // Routes for announcements, events, clubs, and workshops

// Socket.IO connection
io.on('connection', (socket) => {
    console.log('A user connected');

    // Load previous messages when a user connects
    Message.find().sort({ timestamp: -1 }).limit(50).exec((err, messages) => {
        if (err) return console.error(err);
        socket.emit('previousMessages', messages.reverse()); // Send messages to the user
    });

    // Listen for incoming messages
    socket.on('sendMessage', (data) => {
        const newMessage = new Message(data); // Create a new message instance
        newMessage.save((err) => {
            if (err) return console.error(err);
            io.emit('newMessage', newMessage); // Broadcast new message to all users
        });
    });

    socket.on('disconnect', () => {
        console.log('A user disconnected');
    });
});

// Start the server
const PORT = process.env.PORT || 5000;
server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
