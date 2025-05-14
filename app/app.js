// app.js
const express = require('express');
const path = require('path');
const app = express();

// Serve static files from the 'public' folder
app.use(express.static(path.join(__dirname, 'public')));

// Route to handle requests to the home page (optional)
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Start the server on port 4000
const port = 4000;
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
