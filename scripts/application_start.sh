#!/bin/bash
echo "🚀 [ApplicationStart] Refreshing STS credentials and starting app..."
cd /home/rat/pi-api || exit 1

# Refresh credentials
/home/rat/.aws-bootstrap/refresh-creds.sh

# Kill old instance (if any), start fresh
pm2 delete vet-api || echo "⚠️ vet-api not previously running"
pm2 start start.sh --name vet-api

echo "✅ PM2 process 'vet-api' started clean"
