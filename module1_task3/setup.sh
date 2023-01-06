#!/bin/bash
# Run a disposable Ubuntu 18.04 environment with Docker
sudo docker run --rm --tty --interactive --volume=$(pwd):/app --workdir=/app ubuntu:18.04 /bin/bash

# Install necessary packages
apt-get update && apt-get install -y hugo make

# Run the build command from the Makefile
make build

# Exit
exit
