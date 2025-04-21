#!/bin/bash
echo "🔧 [AfterInstall] Installing dependencies and setting permissions..."
cd /home/rat/pi-api || exit 1

if [ -f package.json ]; then
  echo "📦 Installing NPM packages..."
  npm install --production
fi

# Permissions on start + refresh (for safety)
chmod +x /home/rat/.aws-bootstrap/refresh-creds.sh
chmod +x start.sh

mkdir -p logs
echo "✅ AfterInstall complete."
