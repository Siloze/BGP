#!/bin/bash

# $1: folder name
# $2: mounting dest

mkdir -p $2 && sudo mount -t vboxsf $1 $2