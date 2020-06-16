FROM ruby:2.5-alpine

LABEL maintainer="Caius Durling <dev@caius.name>"

WORKDIR /usr/src/app
RUN adduser -u 9000 -D app
COPY . /usr/src/app

RUN gem install bundler -v '~> 2.0' && \
      bundle config set system 'true' && \
      bundle config set frozen 'true' && \
      bundle install --retry=4

RUN chown -R app:app /usr/src/app

USER app

VOLUME /code
WORKDIR /code

CMD ["/usr/src/app/bin/codeclimate-standardrb"]
