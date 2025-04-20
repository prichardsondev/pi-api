const express = require('express');
const router = express.Router();
const si = require('systeminformation');

router.get('/', async (req, res) => {
  try {
    const uptime = await si.time();
    res.json({ uptime: uptime.uptime });
  } catch (err) {
    res.status(500).json({ error: 'Unable to fetch uptime' });
  }
});

module.exports = router;
