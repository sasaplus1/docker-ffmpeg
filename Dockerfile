FROM alpine:3.13

RUN apk --update add --no-cache bash ffmpeg

WORKDIR /tmp

ENTRYPOINT ["ffmpeg"]
