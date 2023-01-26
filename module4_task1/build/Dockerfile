FROM golang:1.15.8-buster

# Install the correct versions of required tools
RUN apt-get update && apt-get install --no-install-recommends -y zip=3.0-11+b1 xz-utils=5.2.4-1+deb10u1 -y &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR /root/.nvm
RUN . $NVM_DIR/nvm.sh &&\ 
    nvm install 16.13.0 &&\
    nvm use 16.13.0
ENV PATH $NVM_DIR/versions/node/v16.13.0/bin:$PATH
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb && \
    dpkg -i hugo_extended_0.109.0_linux-amd64.deb && \
    rm -f hugo_extended_0.109.0_linux-amd64.deb
RUN npm install -g markdownlint-cli@0.33.0 -y &&\
    which markdownlint
RUN markdownlint --version &&\
    hugo version &&\
    node --version &&\
    npm --version

# Set the working directory
WORKDIR /app
