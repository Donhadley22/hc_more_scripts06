# This script creates all dependencies and deploy web app with the deployment source as a Git Repository

#!/bin/bash

# Create Azure Resources 
RESOURCE_GROUP_NAME=DON-RG
APPSERVICE_PLAN_NAME=don-app-plan$RANDOM
WEBAPP_NAME=don-app$RANDOM
DEPLOYMENT_SOURCE=https://github.com/Azure-Samples/html-docs-hello-world
LOCATION=eastus

# Create an App Service Plan
az appservice plan create --name $APPSERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION --sku f1

# Create a Web App
az webapp create --name $WEBAPP_NAME --plan $APPSERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP_NAME 

# Deploy a Web App from GitHub to Azure App Service
az webapp deployment source config --repo-url $DEPLOYMENT_SOURCE --branch --manual-integration --name $WEBAPP_NAME --resource-group $RESOURCE_GROUP_NAME