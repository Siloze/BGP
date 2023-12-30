#!/bin/bash

mkdir -p /home/$USER/Desktop/shared && sudo mount -t 9p -o trans=virtio share /home/$USER/Desktop/shared -oversion=9p2000.L