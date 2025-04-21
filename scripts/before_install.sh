#!/bin/bash
echo "🧹 [BeforeInstall] Cleaning up old files..."

APP_DIR="/home/rat/pi-api"

if [ -d "$APP_DIR" ]; then
  cd "$APP_DIR"
  rm -f .env
  rm -rf logs
  echo "✅ Cleaned old environment and logs"
else
  echo "⚠️ $APP_DIR not found — skipping cleanup"
fi
