#!/bin/bash

# Use curl to download latest release
curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb

# Install hugo version
apt-get install ./hugo.deb
