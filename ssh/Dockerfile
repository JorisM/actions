# vim:set ft=dockerfile:
FROM alpine:latest

LABEL "name"="SSH"
LABEL "maintainer"="alexzeitgeist <alex@zeitgeist.se>"
LABEL "repository"="https://github.com/pixel-plus-lab/actions"
LABEL "version"="1.0.1~pp"

LABEL "com.github.actions.name"="SSH for GitHub Actions"
LABEL "com.github.actions.description"="Runs a command via SSH"
LABEL "com.github.actions.icon"="server"
LABEL "com.github.actions.color"="orange"

COPY LICENSE README.md /

RUN \
  apk add --no-cache \
  bash \
  openssh-client

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
