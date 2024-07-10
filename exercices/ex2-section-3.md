# Exercice 2, Section 3

After having containerized the applications and pushed the images locally, you are to automate the build and push of
each image through the use of `Gitlab CI`. The build must occur on the two following environments :

- The `dev` environment of your personal branch
- The `prod` environment of your personal branch

Additionally, you can configure the build on your other branches. For further details on the docker
tags, [please consult the following section](outlines.md#docker-image-names-and-tags)

Lastly, you need to create two `gitlab-runners` on your machine that have the following configurations and tags :

* The first runner should have as a tag the following : `t<your-number>-build-protected`. This runner should only build
  on **_protected_** branches. It also should be specific to your project.
* The second runner should have as a tag the following : `t<your-number>-build`. This runner should only build on **_
  unprotected_** branches. It also should be specific to your project.

## Turning in results

In order to run in the results of this exercice, please create a `.gitlab-ci.yml` file under the project root that
consists of CI definition, a markdown file under the following path `ci-scripts/gitlab-runners.md` that contains the
commands you used for creating the runners. (__Please remember to sensor out your gitlab token form the command. The
value of the token must not be committed to Git!__). 
Lastly, under `ci-scripts`, you can add any additional scripts.