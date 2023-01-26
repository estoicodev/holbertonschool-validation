#!/bin/bash

# Update
apt-get update && apt-get install -y make

# Install curl to get latest release of hugo
apt-get install curl

# Use curl to download latest release of hugo
curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb

# Install hugo
apt-get install ./hugo.deb

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