#!/bin/bash
echo "📦 [AfterInstall] Installing NPM packages and setting up environment..."
cd /home/rat/pi-api || exit 1

# Always install all deps, not just production
npm install --no-audit --no-fund

# Ensure PM2 is globally installed
if ! command -v pm2 &> /dev/null; then
  echo "🚀 Installing PM2 globally..."
  sudo npm install -g pm2
fi

# Ensure refresh script is executable
chmod +x /home/rat/.aws-bootstrap/refresh-creds.sh
chmod +x start.sh

mkdir -p logs
echo "✅ AfterInstall complete."
