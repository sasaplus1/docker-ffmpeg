FROM alpine:3.10

RUN apk --update add --no-cache bash ffmpeg

WORKDIR /root
