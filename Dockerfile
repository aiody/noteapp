FROM ruby:2.6.7

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

RUN mkdir /noteapp
WORKDIR /noteapp

ADD Gemfile /noteapp/Gemfile
ADD Gemfile.lock /noteapp/Gemfile.lock

RUN bundle install

ADD . /noteapp
RUN yarn install
