# #!/bin/bash
# echo "📦 [AfterInstall] Installing NPM packages..."

# cd /home/rat/pi-api || exit 1

# npm install --no-audit --no-fund || {
#   echo "❌ NPM install failed!"
#   exit 1
# }

# # 🔒 Force install dotenv always
# npm install dotenv || {
#   echo "❌ Failed to install dotenv!"
#   exit 1
# }

# # 🧠 Confirm it's installed
# npm list dotenv || echo "⚠️ dotenv still missing after install!"

# # 🛠 Rebuild native modules (especially node-dht-sensor)
# echo "🔧 Rebuilding node-dht-sensor for Pi hardware..."
# npm rebuild node-dht-sensor || {
#   echo "❌ Failed to rebuild node-dht-sensor!"
#   exit 1
# }

# # 🛠 Ensure PM2 exists
# if ! command -v pm2 &> /dev/null; then
#   sudo npm install -g pm2
# fi

# chmod +x /home/rat/.aws-bootstrap/refresh-creds.sh
# chmod +x start.sh
# mkdir -p logs

# echo "✅ AfterInstall complete."


#!/bin/bash
echo "📦 [AfterInstall] Installing NPM packages..."

cd /home/rat/pi-api || exit 1

# Install Node.js dependencies
npm install --no-audit --no-fund || {
  echo "❌ NPM install failed!"
  exit 1
}

# Force reinstall and rebuild node-dht-sensor
npm rebuild node-dht-sensor || {
  echo "❌ Failed to rebuild node-dht-sensor!"
  exit 1
}

# Always install dotenv
npm install dotenv || {
  echo "❌ Failed to install dotenv!"
  exit 1
}

# Ensure PM2 is installed
if ! command -v pm2 &> /dev/null; then
  sudo npm install -g pm2
fi

# Make scripts executable
chmod +x /home/rat/.aws-bootstrap/refresh-creds.sh
chmod +x start.sh

# Create logs directory if missing
mkdir -p logs

echo "✅ AfterInstall complete."
