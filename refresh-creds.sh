#!/bin/bash

#!/bin/bash

CONFIG_FILE="./aws-config.json"

ROLE_ARN=$(jq -r '.role_arn' "$CONFIG_FILE")
SESSION_NAME=$(jq -r '.session_name' "$CONFIG_FILE")

CREDS_JSON=$(aws sts assume-role \
  --role-arn "$ROLE_ARN" \
  --role-session-name "$SESSION_NAME" \
  --profile bootstrap)

ACCESS_KEY=$(echo $CREDS_JSON | jq -r .Credentials.AccessKeyId)
SECRET_KEY=$(echo $CREDS_JSON | jq -r .Credentials.SecretAccessKey)
SESSION_TOKEN=$(echo $CREDS_JSON | jq -r .Credentials.SessionToken)

cat > .env <<EOF
AWS_ACCESS_KEY_ID=$ACCESS_KEY
AWS_SECRET_ACCESS_KEY=$SECRET_KEY
AWS_SESSION_TOKEN=$SESSION_TOKEN
EOF

echo "[✔] Temporary credentials saved to .env"

