#!/bin/bash

# Step 1: Run the credential refresher from secure location
/home/rat/.aws-bootstrap/refresh-creds.sh

# Step 2: Start your Node.js app (assumes it's in the same folder)
node server.js
