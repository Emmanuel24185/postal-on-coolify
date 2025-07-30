FROM ruby:3.1-slim

# Variables de entorno
ENV DEBIAN_FRONTEND=noninteractive

# Instala dependencias esenciales
RUN apt-get update && apt-get install -y \
    build-essential \
    libmysqlclient-dev \
    libpq-dev \
    nodejs \
    git \
    curl \
    tzdata \
    imagemagick \
    libsqlite3-dev \
    gnupg2 \
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instala bundler
RUN gem install bundler

# Clona Postal
WORKDIR /opt/postal
RUN git clone https://github.com/postalserver/postal.git . && \
    bundle install

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
