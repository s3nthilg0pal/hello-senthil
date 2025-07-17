#!/bin/bash

set -e 
echo "Starting deployment to Azure Static Web Apps..."

echo "Using token: ${AZURE_STATIC_WEB_APPS_TOKEN:0:5}******"  # For debug (optional)

export NVS_HOME="$HOME/.nvs"
source "$NVS_HOME/nvs.sh"

nvs use 24

swa deploy ./public \
  --deployment-token "$AZURE_STATIC_WEB_APPS_TOKEN" \
  --env production

echo "Deployment complete."
