FROM alpine:3.19

RUN apk --update add --no-cache bash ffmpeg

WORKDIR /tmp

ENTRYPOINT ["ffmpeg"]
