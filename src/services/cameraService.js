const path = require('path');
const { exec } = require('child_process');
const fs = require('fs');
const {
  S3Client,
  PutObjectCommand
} = require('@aws-sdk/client-s3');

const imagePath = path.join(__dirname, '../../image.jpg');
const bucketName = 'pi-field-uploads';

// Create S3 client with temporary credentials
const s3 = new S3Client({
  region: 'us-east-1',
  credentials: {
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
    sessionToken: process.env.AWS_SESSION_TOKEN,
  },
});

async function takePhoto() {
  return new Promise((resolve, reject) => {
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    const key = `images/image-${timestamp}.jpg`;

    const command = `libcamera-still -o ${imagePath} --width 640 --height 480 --nopreview`;

    exec(command, async (err) => {
      if (err) return reject(`Camera error: ${err.message}`);

      try {
        const fileContent = fs.readFileSync(imagePath);

        const uploadCommand = new PutObjectCommand({
          Bucket: bucketName,
          Key: key,
          Body: fileContent,
          ContentType: 'image/jpeg',
          ACL: 'private', // or 'public-read' if testing
        });

        const uploadResult = await s3.send(uploadCommand);
        const imageUrl = `https://${bucketName}.s3.amazonaws.com/${key}`;

        resolve(imageUrl); // You could return just `key` if you prefer
      } catch (uploadErr) {
        reject(`S3 Upload Error: ${uploadErr.message}`);
      }
    });
  });
}

module.exports = { takePhoto };
