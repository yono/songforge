FROM ruby:2.5.1
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN gem install bundler
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
ENV SONGFORGE /songforge
ENV BASIC_AUTH_USERNAME user
ENV BASIC_AUTH_PASSWORD password
RUN mkdir -p $SONGFORGE
WORKDIR $SONGFORGE
ADD . $SONGFORGE