FROM ruby:2.4-alpine

RUN apk add --no-cache \
  build-base \
  g++ \
  gcc \
  gnupg \
  libgcc \
  linux-headers \
  make

RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app

COPY Gemfile* *.gemspec /usr/src/app/
COPY lib/mongoid_rails_migrations/version.rb /usr/src/app/lib/mongoid_rails_migrations/version.rb
RUN bundle install

ENV IS_DOCKER "YES"

CMD sh
