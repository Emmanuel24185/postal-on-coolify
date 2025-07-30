#!/bin/bash

if [ ! -f /opt/postal/config/postal.yml ]; then
  echo "===> Initializing Postal configuration..."
  postal initialize
fi

exec bundle exec rails server -b 0.0.0.0 -p 5000
