#!/bin/bash

# Install necessary packages
apt-get update && apt-get install -y hugo make

# Run the build command from the Makefile
make build
