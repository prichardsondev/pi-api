const express = require('express');
const router = express.Router();
const pkg = require('../../package.json');

router.get('/', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html>
      <head>
        <title>Vet Pi API Landing</title>
        <style>
          body { font-family: Arial, sans-serif; padding: 2rem; line-height: 1.6; background: #f9f9f9; color: #333; }
          h1 { color: #2d6a4f; }
          table { border-collapse: collapse; width: 100%; margin-top: 1rem; }
          th, td { padding: 0.5rem; border: 1px solid #ccc; text-align: left; }
          th { background: #eee; }
          a { color: #1d3557; text-decoration: none; }
        </style>
      </head>
      <body>
        <h1>🐾 Vet Pi API</h1>
        <p><strong>Version:</strong> ${pkg.version}</p>
        <p><strong>Deployed:</strong> ${new Date().toLocaleString()}</p>

        <h2>🔗 API Endpoints</h2>
        <table>
          <tr><th>Route</th><th>Method</th><th>Description</th><th>Test</th></tr>
          <tr><td><code>/health</code></td><td>GET</td><td>Returns Pi health info (uptime, memory)</td><td><a href="/health" target="_blank">Open</a></td></tr>
          <tr><td><code>/temp</code></td><td>GET</td><td>Reads current DHT22 temperature</td><td><a href="/temp" target="_blank">Open</a></td></tr>
          <tr><td><code>/image</code></td><td>GET</td><td>Captures photo, uploads to S3, returns URL</td><td><a href="/image" target="_blank">Open</a></td></tr>
        </table>

        <p style="margin-top: 2rem;">Built with 💻 and ☕ by Oddly True AI</p>
      </body>
    </html>
  `);
});

module.exports = router;
