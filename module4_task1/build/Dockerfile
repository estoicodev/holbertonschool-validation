FROM golang:1.15.8-buster

# Install the correct versions of required tools
RUN apt-get update && apt-get install -y zip=3.0-11+b1 xz-utils=5.2.4-1+deb10u1 -y
# RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.50.1
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb && \
    dpkg -i hugo_extended_0.109.0_linux-amd64.deb && \
    rm -f hugo_extended_0.109.0_linux-amd64.deb
# RUN wget https://nodejs.org/dist/v16.13.0/node-v16.13.0-linux-x64.tar.xz && \
#     tar -xf node-v16.13.0-linux-x64.tar.xz && \
#     rm -f node-v16.13.0-linux-x64.tar.xz && \
#     mv node-v16.13.0-linux-x64 /usr/local/node && \
#     ln -s /usr/local/node/bin/node /usr/local/bin/node && \
#     ln -s /usr/local/node/bin/npm /usr/local/bin/npm
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR /root/.nvm
RUN . $NVM_DIR/nvm.sh &&\ 
    nvm install 16.13.0 &&\
    nvm use 16.13.0
ENV PATH $NVM_DIR/versions/node/v16.13.0/bin:$PATH
RUN npm install -g markdownlint-cli@0.33.0 -y &&\
    which markdownlint
RUN markdownlint --version &&\
    hugo version &&\
    node --version &&\
    npm --version

# Set the working directory
WORKDIR /app
