# Exercice 3, Section 4

This exercice is divided into three subsections that are as follows :

## Section 4.A

For this subsection of the exercice, you will be required to provide a bash script that launches a `k3d` cluster on your
local machine with the following specifications :

* Has a single master node
* Has a single worker node
* Has a load balancer
* Must bind the port `80` of the cluster's load balancer to the port `80` of the machine
* Must bind the port `443` of the cluster's load balancer to the port `443` of the machine
* Must have a volume binding between the cluster, and the host machine for data persistance.

## Section 4.B

For this subsection of the exercice, you are to create your first Kubernetes deployment. The deployment should have the
following specifications :

* All the `backend`, and the `qr` applications should be deployed in the following namespace : `training-app-backed-prod`
* All the `website` application should be deployed in the following namespace : `training-app-frontend-prod`
* For each application, you need to create its own deployment
* Configurations for the database should be kept in a secret
* Configurations for the S3 should be kept in a secret
* Configurations for website should be kept in ConfigMap
* Each application should have its service
* You need to create an Ingress for the `backend` application, and an Ingress for the `website`
* You need to configure a Cluster Issuer in order to secure your domain names with HTTPS
* The `backend` should be accessible on the following URL : `https://app.<your-provided-domain-name>/api`
* The `website` should be accessible on the following URL : `https://app.<your-provided-domain-name>`
* You should configure the Docker images pull from Comwork's private registry
* All the applications should be deployed through the use of a Kustomization file

:warning: For the purposes of this exercice, you may create an account on, and
use [the publicly available Minio playground](https://play.minio.io/) for your S3 storage.

## Section 4.C

For this subsection of the exercice, you are to :

* Install SealedSecret on inside the Kubernetes cluster
* Install Kubeseal on your machine
* Create a script that "seals" your secrets and deletes them from the Git tree after having generated the SealedSecret
  files.

## Turning in results

In order to run in the results of this exercice, you need to be able to provide the following files
under [applications folder](../applications) :

* `init-k3d-cluster.sh` : A bash script containing the commands that
  creates [the k3d cluster mentioned in the above section](#section-4a)
* `training-app-deployment` : A folder containing all the files that configure and deploy the applications inside the
  Kubernetes cluster [as specified in the above section](#section-4b)

For turning in the results of [section 4.C](#section-4c), you need to :

* Update the files created `training-app-deployment` for the purposes of the [section 4.B](#section-4b)
* Provide the demanded bash script under `training-app-deployment/seal-secrets.sh`
* update the `init-k3d-cluster.sh` script with the commands that install SealedSecrets inside your Kubernetes cluster.

:warning: For the purposes of [section 4.B](#section-4b) and for this exercice only, the created secrets may be
committed to Git.