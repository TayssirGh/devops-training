# Exercice 3, Section 2

This exercice is divided into two subsections that are as follows :

## Section 2.A

For this subsection of the exercice, you will be required to create a file called `docker-compose-C.yml` under
the [applications folder](../applications) that does the following :

1. Deploy the `backend` application with a replication factor of `2`
2. Deploy the `website` application with a replication factor of `2`
3. Deploy and configure a `minio` image inside `docker-compose` with persistent volume that allows it to serve as the
   local `s3`
4. Deploy the `qr` application with a replication factor of `2` wil a configuration that allows it to store data on `s3`
   .
5. Load environment variables from `.env` files
6. Deploy an Nginx Load Balancer/Reverse Proxy that allows for external users to access the following applications :
    * `website`
    * `backend`
    * `minio`

The `Nginx` should be the only application that is bound to the host machine's ports. It should be accessible on
port `80`

## Section 2.B

For this subsection of the exercice, you will be required to create a file called `docker-compose-D.yml` under
the [applications folder](../applications) that does the same thing as the `docker-compose-C.yml` except for Nginx that
needs to do the following :

1. Be exposed on ports `80` and `443`
2. Redirect `HTTP` traffic to `HTTPS`

You will also be required to provide a script called `configure-tls.sh` [applications folder](../applications) under
that :

1. Installs `letsencypt` on your machine
2. Secures your domain name with TLS

## Turning in results

In order to run in the results of this exercice, you need to be able to provide the following files under their
appropriate paths (mentioned above) :

* `docker-compose-C.yml`
* `docker-compose-D.yml`

Additionally, you need to provide the following bash scripts under the [applications folder](../applications) that
contain the commands to launch the docker-compose projects :

* `launch-C.sh`
* `launch-D.sh`

As well as the `configure-tls.sh` file specified in [the section 2.B](#section-2b)