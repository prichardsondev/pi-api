#!/bin/bash
echo "🚀 [ApplicationStart] Refreshing STS credentials and starting app..."

cd /home/rat/pi-api || exit 1

# Ensure correct ownership before writing anything
sudo chown -R rat:rat /home/rat/pi-api

# Refresh temporary credentials
/home/rat/.aws-bootstrap/refresh-creds.sh

# Restart clean with PM2
pm2 delete vet-api || echo "⚠️ vet-api not previously running"
pm2 start start.sh --name vet-api

echo "✅ App started via PM2."
