FROM ruby:2.1

RUN mkdir -p /usr/src/app

VOLUME /usr/src/app
WORKDIR /usr/src/app

CMD ["ruby", "bin/suggest"]