#!/bin/bash
# =====================
# 🔧 before_install.sh
# =====================
echo "🧹 Cleaning old code..."
APP_DIR="/home/rat/pi-api"

if [ -d "$APP_DIR" ]; then
  pm2 delete vet-api || true
  rm -rf "$APP_DIR"
fi

mkdir -p "$APP_DIR"
echo "✅ Clean slate ready at $APP_DIR"

# =====================
# 📦 after_install.sh
# =====================
echo "📦 Installing node modules..."
cd /home/rat/pi-api || exit 1

npm install --no-audit --no-fund || exit 1
npm rebuild || exit 1

chmod +x /home/rat/.aws-bootstrap/refresh-creds.sh
chmod +x start.sh

echo "✅ Dependencies installed"