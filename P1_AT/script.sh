#!/usr/bin/env sh

set -e

docker system prune -fa
docker build -t host ./host
docker build -t router ./router
