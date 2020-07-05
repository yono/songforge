FROM ruby:2.6.2
ENV LANG C.UTF-8
# prerequisites
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev unzip

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# chrome && chromedriver
RUN CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/
RUN unzip ~/chromedriver_linux64.zip -d ~/
RUN rm ~/chromedriver_linux64.zip
RUN chown root:root ~/chromedriver
RUN chmod 755 ~/chromedriver
RUN mv ~/chromedriver /usr/bin/chromedriver
RUN sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update && apt-get install -y google-chrome-stable

# bundle install
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
