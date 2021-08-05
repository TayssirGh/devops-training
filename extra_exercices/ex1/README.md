# Complementary Exercice 1

The objective of this exercice is to enhance your understanding of Dockerfiles and Docker images.

For this exercice, you have [the following script](runner.sh) that "pings" a website to check if it's functioning
correctly or not.

The script takes in the following environment variables :

* `WEBSITE_URL` : The website to test the uptime on.
* `SLEEP_DURATION` : The interval between pings on the website.

## Tasks

You are to containerize the script in a couple of different ways :

* Through the use of a `debian` base image
* Through the use of an `alpine` base image
* Through the use of an `alpine` base image in addition of an environment variables validator before container launch

## Turning in results

Under [this folder](.), you are to provide the following files :

* `debian.Dockerfile` : The Dockerfile of the debian-based image
* `alpine.Dockerfile` : The Dockerfile of the alpine-based image
* `Dockerfile` : The Dockerfile of the alpine-based image wil environment variables validation script
* `builder.sh` : A shell script that allows for the building of your Docker Images