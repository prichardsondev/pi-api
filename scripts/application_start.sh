#!/bin/bash
echo "🚀 [ApplicationStart] Refreshing STS credentials and starting app..."
cd /home/rat/pi-api || exit 1

# Run STS credential refresh from bootstrap folder
/home/rat/.aws-bootstrap/refresh-creds.sh

# Start or restart with PM2
pm2 start start.sh --name vet-api || pm2 restart vet-api

echo "✅ App started via PM2."
