#!/bin/bash

# Update
apt-get update && apt-get install -y make

# Install curl to get latest release of hugo
apt-get install curl

# Install markdownlint
sudo npm install -g markdownlint-cli

# Uninstall go
sudo apt-get remove golang-go
sudo apt-get remove --auto-remove golang-go
sudo rm -rf /usr/local/go || true

# Clean environment
rm -rf dist/ 2> /dev/null
rm -f awesome-api || true
rm -f coverage-units.out || true
rm -f coverage-integrations.out || true