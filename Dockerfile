FROM golang:1.14-alpine AS builder
RUN apk update && apk add git
RUN mkdir -p /tmp/src
WORKDIR /tmp/src
RUN git clone https://github.com/gohugoio/hugo.git
WORKDIR /tmp/src/hugo
RUN go install

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/bin/hugo /bin
ENV url=url
WORKDIR /mnt/site
ENTRYPOINT hugo server --baseURL $url --bind "0.0.0.0" --renderToDisk
