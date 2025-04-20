const sensor = require('node-dht-sensor').promises;

async function readTemperature() {
  const result = await sensor.read(22, 4); // DHT22 on GPIO 4
  return {
    temperature: result.temperature.toFixed(1),
    humidity: result.humidity.toFixed(1),
  };
}

module.exports = { readTemperature };
