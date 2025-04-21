echo "🚀 Starting application..."
cd /home/rat/pi-api || exit 1
pm2 start ./start.sh --name vet-api