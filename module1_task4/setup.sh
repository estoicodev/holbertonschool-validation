#!/bin/bash

# Install 'Hugo' and 'make'
apt-get update && apt-get install -y hugo make

# Install curl to get latest release
apt-get install curl

# Use curl to download latest release
curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb

# Install hugo version
apt-get install ./hugo.deb

# Build website
make build
