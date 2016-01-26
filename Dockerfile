FROM rails:4.1

# Use labels so queries images and containers can be filtered
LABEL mge=""
LABEL environment="production"

MAINTAINER https://github.com/MeinGrundeinkommen

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Install bundles to /tmp so that they are properly cached and they won't be
# pulled every time the image is rebuilt
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --without development test

RUN mkdir -p /usr/src/app
COPY . /usr/src/app
WORKDIR /usr/src/app

ENV SECRET_KEY_BASE="${SECRET_KEY_BASE}"
RUN RAILS_ENV=production bundle exec rake assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
