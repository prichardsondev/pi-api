#!/bin/bash
echo "🚀 [ApplicationStart] Refreshing STS credentials and starting app..."
cd /home/pi/pi-api || exit 1

# Run STS credential refresh
./refresh-creds.sh

# Start or restart with PM2
pm2 start server.js --name vet-api || pm2 restart vet-api

echo "✅ App started via PM2."
