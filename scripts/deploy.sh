#!/bin/bash

set -e
echo "Starting deployment to Azure Static Web Apps..."

# Install nvm
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
export PROFILE="/dev/null"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install and use Node.js 24
nvm install 24
nvm use 24

# Confirm Node version
node -v
npm -v

# Install Azure Static Web Apps CLI if not already installed
npm install -g @azure/static-web-apps-cli

# Print config
swa --print-config

# Deploy
swa deploy ./public \
  --deployment-token "$AZURE_STATIC_WEB_APPS_TOKEN" \
  --env production

echo "Deployment complete."
