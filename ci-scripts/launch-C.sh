#!/bin/bash

cd applications
docker compose -f docker-compose-C.yml up -d --build
