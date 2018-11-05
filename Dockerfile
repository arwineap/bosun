FROM golang:1-alpine

# https://github.com/krise3k/bosun/tree/fixInfluxdbNestedFunctions
RUN apk add --no-cache git make gcc libc-dev && \
    # go get bosun.org/cmd/bosun && \
    mkdir -p /go/src/bosun.org && \
    git clone https://github.com/krise3k/bosun.git /go/src/bosun.org && \
    cd /go/src/bosun.org && \
    git checkout fixInfluxdbNestedFunctions && \
    cd /go/src/bosun.org/cmd/bosun && \
    go build && \
    mv ./bosun /usr/local/bin && \
    apk del git make gcc libc-dev && \
    rm -rf /go/pkg && \
    rm -rf /go/src

