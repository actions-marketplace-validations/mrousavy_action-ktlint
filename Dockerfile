FROM alpine:latest

RUN apk --no-cache --update add git curl wget openjdk11 \
    && rm -rf /var/cache/apk/*

RUN curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin

RUN curl -sSLO https://github.com/pinterest/ktlint/releases/download/0.40.0/ktlint \
    && chmod a+x ktlint \
    && mv ktlint /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
