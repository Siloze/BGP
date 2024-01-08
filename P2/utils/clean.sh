#!/bin/bash

sudo docker system prune -af
sudo docker rm -f $$(docker ps -aq)