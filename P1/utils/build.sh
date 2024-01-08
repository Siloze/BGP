#!/bin/bash

sudo docker build -t frr -f Dockerfile.frr .
sudo docker build -t busy -f Dockerfile.busy .