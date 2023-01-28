FROM alpine:3.13

# Install the correct versions of required tools
RUN apk update && apk add --no-cache zip=3.0-r9 make=4.3-r0 &&\
    rm -rf /var/cache/apk/*
# Install nodejs, npm and make tools
RUN apk add --no-cache nodejs=14.20.1-r0 npm=14.20.1-r0 hugo=0.79.1-r0
# Install markdownlint
RUN npm install -g markdownlint-cli@0.33.0 -y &&\
    which markdownlint
# Install hadolint
RUN wget -O /usr/local/bin/hadolint -q -nv https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 &&\
    chmod +x /usr/local/bin/hadolint
# Install container-structure-test
RUN wget -O /usr/local/bin/container-structure-test -q -nv https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 &&\
    chmod +x /usr/local/bin/container-structure-test
# Check tools install correctly
RUN markdownlint --version &&\
    hugo version &&\
    node --version &&\
    npm --version &&\
    hadolint --version &&\
    container-structure-test version

# Set the working directory
WORKDIR /app
