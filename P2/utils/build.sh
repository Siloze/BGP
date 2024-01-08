#!/bin/bash

sudo docker build -t host -f Dockerfile.host .
sudo docker build -t router -f Dockerfile.router .