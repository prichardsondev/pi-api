#!/bin/bash
echo "🧹 [BeforeInstall] Cleaning up old files..."

APP_DIR="/home/rat/pi-api"

if [ -d "$APP_DIR" ]; then
  echo "📁 Removing entire app directory at $APP_DIR"
  rm -rf "$APP_DIR"
  echo "✅ Old app folder completely removed"
else
  echo "⚠️ $APP_DIR not found — skipping cleanup"
fi

