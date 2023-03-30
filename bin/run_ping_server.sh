#!/bin/bash -e

PING_SERVER_DIR="$(dirname $(cd $(dirname $0) && pwd))/ping_server"
cd "$PING_SERVER_DIR"
go run server.go

