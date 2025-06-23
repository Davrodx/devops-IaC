const express = require('express');
const app = express();

const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.json({ message: 'Welcome to your Azure DevOps Demo API!' });
});

app.get('/health', (req, res) => {
  res.send('Healthy');
});

app.listen(PORT, () => {
  console.log(`API running on http://localhost:${PORT}`);
});
