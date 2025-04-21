echo "📦 Installing node modules..."
cd /home/rat/pi-api || exit 1

npm install --no-audit --no-fund || exit 1
npm rebuild || exit 1

chmod +x /home/rat/.aws-bootstrap/refresh-creds.sh
chmod +x start.sh

echo "✅ Dependencies installed"