FROM golang:1.15.8-buster

# Install the correct versions of required tools
RUN apt-get update && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.50.1
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb && apt-get install -y ./hugo.deb
RUN apt-get install -y zip
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - &&\ 
apt-get install -y nodejs
RUN npm install -g markdownlint-cli

# Set the working directory
WORKDIR /app
