FROM digitalspacestudio/linuxbrew:latest
LABEL maintainer="Sergey Cherepanov <sergey@digitalspace.studio>"
LABEL name="digitalspacestudio/php"
ARG DEBIAN_FRONTEND=noninteractive
ARG BREW_FORMULA=digitalspacestdio/php/php72
ARG HOMEBREW_NO_INSTALL_CLEANUP=1
ARG HOMEBREW_NO_AUTO_UPDATE=1
ARG HOMEBREW_NO_ANALYTICS=1
ARG HOMEBREW_FORCE_BREWED_CURL=1
ARG HOMEBREW_FORCE_BREWED_GIT=1

## Install gcc
USER root
RUN apt update && apt install -yqq build-essential systemtap-sdt-dev make uuid-runtime
USER linuxbrew

# Install php
RUN brew tap digitalspacestdio/common && brew tap digitalspacestdio/php
RUN brew install ${BREW_FORMULA}-common
RUN brew install ${BREW_FORMULA}-xhprof ${BREW_FORMULA}-xdebug
RUN brew install composer
RUN brew install composer@1.10
RUN brew install msmtp
RUN brew install node@12
RUN brew install python@2
RUN brew link -f node@12 && npm install --global yarn
RUN npm install pm2@latest -g

# Cleanup
RUN brew cleanup \
    && rm -rf /home/linuxbrew/.cache/Homebrew \
    && rm -rf /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby

USER root
RUN apt autoremove -y \
    && apt-get clean \
    && rm -rf /var/cache/apt \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHON=/home/linuxbrew/.linuxbrew/opt/python@2/bin/python

USER linuxbrew