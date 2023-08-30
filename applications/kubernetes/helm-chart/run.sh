#! /bin/env/bash
sudo kubectl wait --namespace  \
 --for= condition=ready  \
 --timeout=-1s

sudo helm install demochart . --dry-run

sudo helm install demochart .
