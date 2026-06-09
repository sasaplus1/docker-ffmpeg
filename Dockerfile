FROM alpine:3.24

RUN apk --update add --no-cache bash ffmpeg

WORKDIR /tmp

ENTRYPOINT ["ffmpeg"]
