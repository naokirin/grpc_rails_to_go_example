#!/bin/bash -e

RAILS_DIR="$(dirname $(cd $(dirname $0) && pwd))/server"
cd "$RAILS_DIR"
bundle exec rails s

