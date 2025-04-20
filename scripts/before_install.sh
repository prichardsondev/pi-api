#!/bin/bash
echo "🧹 [BeforeInstall] Cleaning up old files..."
cd /home/pi/pi-api || exit 1
rm -f .env
echo "✅ Cleanup complete."
