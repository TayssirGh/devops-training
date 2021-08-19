#!/bin/bash
docker-compose -f docker-compose-A.yml -f docker-compose-B.yml build
docker-compose -f docker-compose-A.yml -f docker-compose-B.yml up -d