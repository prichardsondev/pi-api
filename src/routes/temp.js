const express = require('express');
const router = express.Router();
const { readTemperature } = require('../services/sensorService');

router.get('/', async (req, res) => {
  try {
    const temp = await readTemperature();
    res.json(temp);
  } catch (err) {
    res.status(500).json({ error: 'Temperature read failed' });
  }
});

module.exports = router;
