FROM ruby:3.1

RUN apt-get update && apt-get install -y \
  build-essential \
  libmysqlclient-dev \
  libpq-dev \
  nodejs \
  git \
  curl \
  vim \
  tzdata \
  imagemagick \
  libsqlite3-dev

RUN gem install bundler

WORKDIR /opt/postal

RUN git clone https://github.com/postalserver/postal.git . && \
    bundle install

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
