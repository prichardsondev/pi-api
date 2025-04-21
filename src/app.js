const express = require('express');
const app = express();

const homeRoute = require('./routes/home');
const healthRoute = require('./routes/health');
const tempRoute = require('./routes/temp');
const imageRoute = require('./routes/image');

app.use('/', homeRoute);
app.use('/health', healthRoute);
app.use('/temp', tempRoute);
app.use('/image', imageRoute);

module.exports = app;

