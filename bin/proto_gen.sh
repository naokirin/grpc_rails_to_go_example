#!/bin/bash -e

# Generate Go code
protoc \
  --go_out=./pinger \
  --go_opt=paths=source_relative \
  --go-grpc_out=require_unimplemented_servers=false:./pinger \
  --go-grpc_opt=paths=source_relative \
  proto/pinger.proto


# Generate Ruby code
RAILS_DIR="$(dirname $(cd $(dirname $0) && pwd))/server"
cd "$RAILS_DIR"
bundle exec grpc_tools_ruby_protoc \
  -I ../proto \
  --ruby_out=lib \
  --grpc_out=lib \
  ../proto/pinger.proto

