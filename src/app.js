const express = require('express');
const app = express();

const healthRoute = require('./routes/health');
const tempRoute = require('./routes/temp');
const imageRoute = require('./routes/image');

app.use('/health', healthRoute);
app.use('/temp', tempRoute);
app.use('/image', imageRoute);

module.exports = app;
