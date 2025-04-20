#!/bin/bash
echo "🔧 [AfterInstall] Installing dependencies and setting permissions..."
cd /home/pi/pi-api || exit 1

# Install Node.js dependencies if package.json exists
if [ -f package.json ]; then
  echo "📦 Installing NPM packages..."
  npm install --production
fi

# Make sure STS refresh script is executable
chmod +x refresh-creds.sh

# Create log dir if needed
mkdir -p logs

echo "✅ AfterInstall complete."
