#!/bin/bash -e

PINGER_DIR="$(dirname $(cd $(dirname $0) && pwd))/pinger"
cd "$PINGER_DIR"
go run server.go

