FROM golang:alpine as build
RUN apk add --no-cache git
RUN go get github.com/golang/gddo/gddo-server

FROM alpine:latest
MAINTAINER Joshua Rubin <jrubin@zvelo.com>
RUN apk add --no-cache ca-certificates
ENTRYPOINT ["gddo-server"]
COPY --from=build /go/bin/gddo-server /usr/local/bin/
