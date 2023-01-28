#!/bin/bash

# Update
apt-get update && apt-get install -y make

# Install curl to get latest release of hugo
apt-get install curl

# Install markdownlint
sudo npm install -g markdownlint-cli

# Install hadolint
curl https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 -o hadolint
mv hadolint /usr/local/bin
chmod +x /usr/local/bin/hadolint

# Install container-structure-test
curl -L https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 -o container-structure-test
chmod +x container-structure-test
mv container-structure-test /usr/local/bin

# Uninstall go
sudo apt-get remove golang-go
sudo apt-get remove --auto-remove golang-go
sudo rm -rf /usr/local/go || true

# Clean environment
rm -rf dist/ 2> /dev/null
rm -f awesome-api || true
rm -f coverage-units.out || true
rm -f coverage-integrations.out || true