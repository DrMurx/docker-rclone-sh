# Copyright 2017 Valentine C

FROM alpine:3.7

MAINTAINER Valentine C

ENV GOPATH /go

RUN apk add --no-cache go git musl-dev ca-certificates \
	&& go get github.com/ncw/rclone \
	&& cp /go/bin/rclone /usr/bin \
	&& rm -rf /go /tmp/* \
	&& apk del go git musl-dev

ENTRYPOINT ["/usr/bin/rclone"]
