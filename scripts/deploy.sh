#!/bin/bash

set -e
echo "Starting deployment to Azure Static Web Apps..."

export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
export PROFILE="/dev/null"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install 24
nvm use 24

node -v
npm -v

npm install -g @azure/static-web-apps-cli

swa --print-config

swa deploy ./public \
  --deployment-token "$AZURE_STATIC_WEB_APPS_TOKEN" \
  --env production

echo "Deployment complete."
