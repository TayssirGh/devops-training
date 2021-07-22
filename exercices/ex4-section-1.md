# Exercice 4, Section 1

In the previous exercices, we have deployed the application suite only on the `prod` branch. For this exercice, you are
to change the deployment in such a way that, the application will deploy on both `dev` and `prod` branches/environments
with the following configurations :

* The current configurations in the `prod` branch :
    * Database name : [refer to __'Database'__ section of the outlines file](outlines.md#database)
    * Public URLs :
        * `backend` app : `https://app.<your-provided-domain-name>/api`
        * `website` app : `https://app.<your-provided-domain-name>`
    * Namespaces :
        * For the `backend` and `qr` apps : `training-app-backed-prod`
        * For the `website` app : `training-app-frontend-prod`

* The required configurations for the `dev` branch :
    * Database name : [refer to __'Database'__ section of the outlines file](outlines.md#database)
    * Public URLs :
        * `backend` app : `https://app-dev.<your-provided-domain-name>/api`
        * `website` app : `https://app-dev.<your-provided-domain-name>`
    * Namespaces :
        * For the `backend` and `qr` apps : `training-app-backed-dev`
        * For the `website` app : `training-app-frontend-dev`

In order to be able to change the deployment of each environment whilst keeping a single config Kubernetes source, this
exercice is divided into two subsections.

## Section 1.A

For this subsection of the exercice, you are required to :

- copy the contents of `training-app-deployment` into `training-app-deployment-templated` under
  the [applications folder](../applications)
- Replace the key values with temporary ones
- Create a shell script for replacing the temporary values of the yaml files with their corresponding values in the CI

For reference, please
check [the following project on Comwork's private gitlab](https://gitlab.comwork.io/inovshop/devops/kube-config-central/-/tree/master/ipt/ipt-prod)

## Section 1.B

For this subsection of the exercice, you are to create a Helm chart for the application suit's deployment.

## Turning in results

In order to run in the results of this exercice, you need to be able to provide the following files
under [applications folder](../applications) :

* `training-app-deployment-templated` : folder containing the templated deployment from [the section 1.A](#section-1a)
* `training-app-deployment-chart` : folder containing the templated deployment from [the section 1.B](#section-1b)