FROM golang:1.15-buster AS builder
RUN apt-get update && apt-get install -y gcc
RUN mkdir -p /tmp/src
WORKDIR /tmp/src
RUN git clone https://github.com/gohugoio/hugo.git
WORKDIR /tmp/src/hugo
RUN CGO_ENABLED=1 go install --tags extended

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/bin/hugo /bin
WORKDIR /mnt/site
