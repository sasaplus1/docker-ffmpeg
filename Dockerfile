FROM alpine:3.20

RUN apk --update add --no-cache bash ffmpeg

WORKDIR /tmp

ENTRYPOINT ["ffmpeg"]
