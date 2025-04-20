#!/bin/bash
echo "🛑 [ApplicationStop] Stopping app with PM2..."
pm2 stop vet-api || echo "⚠️ App not running"
