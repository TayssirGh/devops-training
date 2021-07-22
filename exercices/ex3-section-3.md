# Exercice 3, Section 3

In this exercice, you need to configure the automatic deployment of your application as follows :

* Create a new runner with on your machine with the following tag `t<your-number>-deploy`. This runner should only build
  on **_protected_** branches. It also should be specific to your project.
* Configure automatic the deployment of the `docker-compose-D.yml` created
  in [the previous exercice](ex3-section-2.md#section-2b) on push to your `prod` branch.

## Turning in results

In order to run in the results of this exercice, please update the `.gitlab-ci.yml` file under the project root with the
newly created job for deploying your applications.

Additionally, update the markdown file under the path `ci-scripts/gitlab-runners.md` with the command you used for
creating the deployment runner. (please remember to sensor out the Gitlab Token from it).