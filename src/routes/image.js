const express = require('express');
const router = express.Router();
const { takePhoto } = require('../services/cameraService');
const path = require('path');

router.get('/', async (req, res) => {
  try {
    const imageUrl = await takePhoto();
    console.log("Image uploaded to:", imageUrl);
    res.json({ imageUrl });
  } catch (err) {
    console.error("Camera or upload failed:", err);
    res.status(500).json({ error: err.toString() });
  }
});


module.exports = router;
