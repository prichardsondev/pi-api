#!/bin/bash
echo "🔧 [AfterInstall] Installing dependencies and setting permissions..."
cd /home/rat/pi-api || exit 1

if [ -f package.json ]; then
  echo "📦 Installing NPM packages..."
  npm install --production --no-audit --no-fund --omit=dev
fi

# Install PM2 globally if not present
if ! command -v pm2 &> /dev/null; then
  echo "🚀 Installing PM2 globally..."
  sudo npm install -g pm2
fi

# Permissions
chmod +x /home/rat/.aws-bootstrap/refresh-creds.sh
chmod +x start.sh
mkdir -p logs

echo "✅ AfterInstall complete."

