FROM golang:1.15.8-buster

# Install the correct versions of required tools
RUN apt-get update && apt-get install -y zip=3.0-11+b1
# RUN wget https://curl.haxx.se/download/curl-7.70.0.zip && unzip curl-7.70.0.zip
# RUN cd curl-7.70.0 && ./configure --prefix=$HOME/curl && make && make install
# RUN echo "export PATH=$HOME/curl/bin:$PATH" >> ~/.bash_profile && ~/.bash_profile &&\
#     which curl
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.50.1
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb && apt-get install -y ./hugo.deb
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - &&\ 
    apt-get install -y nodejs
RUN npm install -g -y markdownlint-cli@0.33.0
RUN markdownlint --version &&\
    hugo version &&\
    node --version &&\
    npm --version

# Set the working directory
WORKDIR /app
