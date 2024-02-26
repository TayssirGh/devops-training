# Exercice 3, Section 5

After having created your Kubernetes deployment in [this section of the training](ex3-section-4.md#section-4c), you need to configure its deployment through `Gitlab CI/CD` by :
* Removing the `docker-compose` deployment
* Updating the deployment job inside your `.gitlab-ci.yml` to deploy Kubernetes configurations instead of `docker-compose`

For this exercice, you should only deploy upon pushes on the `prod` branch 

## Turning in results

In order to run in the results of this exercice, please update the `.gitlab-ci.yml` file under the project root.