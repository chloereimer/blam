FROM ruby:3.0.1-alpine3.13

WORKDIR /usr/src/blam

RUN apk add --upgrade build-base tzdata postgresql-dev
RUN bundle config --global frozen 1

COPY Gemfile* ./
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
