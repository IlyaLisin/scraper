FROM ruby:2.6.5

ENV WD /var/www/scraper
ENV HOME /root
WORKDIR ${WD}

RUN apt update && \
    gem install bundler && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile $WD
COPY Gemfile.lock $WD

RUN bundle install --without development test --jobs 4

COPY . $WD

CMD rackup --host 0.0.0.0
