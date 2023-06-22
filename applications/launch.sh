#!/bin/bash
docker-compose -f applications/docker-compose-C.yml build 
docker-compose -f applications/docker-compose-C.yml push