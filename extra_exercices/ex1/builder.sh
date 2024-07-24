#!/bin/bash

#building with debian.Dockerfile 
docker build --tag debian-shell -f debian.Dockerfile . 

#building with alpine.Dockerfile
docker build --tag alpine-shell -f alpine.Dockerfile .

#building with Dockerfile
docker build --tag alpine-validated -f Dockerfile .