#!/bin/bash
echo "🧹 [BeforeInstall] Cleaning up old files..."
cd /home/rat/pi-api || exit 1
rm -f .env
echo "✅ Cleanup complete."
