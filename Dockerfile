FROM golang:1.15-alpine AS builder
RUN apk update && apk add git
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
