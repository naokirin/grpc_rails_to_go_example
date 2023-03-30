#!/bin/bash -e

# Generate Go code
protoc \
  --go_out=./ping_server \
  --go_opt=paths=source_relative \
  --go-grpc_out=require_unimplemented_servers=false:./ping_server \
  --go-grpc_opt=paths=source_relative \
  proto/ping.proto


# Generate Ruby code
RAILS_DIR="$(dirname $(cd $(dirname $0) && pwd))/server"
cd "$RAILS_DIR"
bundle exec grpc_tools_ruby_protoc \
  -I ../proto \
  --ruby_out=lib \
  --grpc_out=lib \
  ../proto/ping.proto

