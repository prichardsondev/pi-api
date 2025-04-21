#!/bin/bash
echo "📦 [AfterInstall] Installing NPM packages and setting up environment..."

cd /home/rat/pi-api || exit 1

# Install all runtime dependencies
npm install --no-audit --no-fund

# Safety net: ensure dotenv is there
if ! npm list dotenv >/dev/null 2>&1; then
  echo "⛑ Installing missing dotenv..."
  npm install dotenv
fi

# Ensure PM2 exists
if ! command -v pm2 &> /dev/null; then
  echo "🚀 Installing PM2 globally..."
  sudo npm install -g pm2
fi

chmod +x /home/rat/.aws-bootstrap/refresh-creds.sh
chmod +x start.sh
mkdir -p logs

echo "✅ AfterInstall complete."

