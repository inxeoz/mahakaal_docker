#!/usr/bin/env bash

# Ask for frontend port (default: 8881)
read -p "Enter FRONTEND_PORT [8881]: " FRONTEND_PORT
FRONTEND_PORT=${FRONTEND_PORT:-8881}

docker compose -f mapit_pwd.yml down --volumes

export FRONTEND_PORT

export APPS_JSON_BASE64=$(base64 -w 0 apps_mapit.json)

echo -e "############# APPS_JSON_BASE64 ################\n"
echo "$APPS_JSON_BASE64"
echo -e "\n############# APPS_JSON_BASE64 ################\n"

docker compose -f mapit_pwd.yml build
docker compose -f mapit_pwd.yml up -d

echo "Visit this URL:"
echo "http://localhost:$FRONTEND_PORT/"
