#!/bin/bash

echo "🚀 Installing dependencies..."
sudo apt update
sudo apt install -y nodejs npm jq awscli

echo "📦 Installing PM2 globally..."
sudo npm install -g pm2

echo "🔐 Running initial credential refresh..."
/home/pi/pi-api/refresh-creds.sh

echo "🧠 Setting up PM2 to manage app..."
cd /home/pi/pi-api
pm2 start server.js --name vet-api
pm2 save
pm2 startup | tee /tmp/pm2-startup.sh
bash /tmp/pm2-startup.sh

echo "🕒 Adding cron job to refresh creds every hour..."
(crontab -l ; echo "0 * * * * /home/pi/pi-api/refresh-creds.sh >> /home/pi/pi-api/creds.log 2>&1") | crontab -

echo "✅ Deployment complete. App is live and secured with temp STS credentials."
