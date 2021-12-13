FROM node:16.13.1-alpine AS node
FROM ruby:3.0.3-alpine

ENV HOME="/backend" \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    YARN_VERSION=1.22.15 \
    RUNTIME_PACKAGES="alpine-sdk git mysql-client mysql-dev tzdata bash less vim" \
    DEV_PACKAGES="build-base curl-dev"

RUN mkdir -p /opt && \
    mkdir $HOME

COPY --from=node /opt/yarn-v$YARN_VERSION /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn && \
    ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg && \
    ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

WORKDIR $HOME

RUN gem install bundler -v '2.2.33'
COPY ./Gemfile ./Gemfile.lock $HOME/
RUN bundle config set --local path 'vendor/bundle' && \
    bundle install --jobs=4 && \
    apk del build-dependencies

COPY . $HOME
