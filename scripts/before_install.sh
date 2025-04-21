#!/bin/bash
echo "🧹 [BeforeInstall] Cleaning up old files..."

APP_DIR="/home/rat/pi-api"

if [ -d "$APP_DIR" ]; then
  cd "$APP_DIR"
  rm -f .env
  echo "✅ Cleaned .env"
else
  echo "⚠️ $APP_DIR not found — skipping cleanup"
fi
