# Exercice 2, Section 3

After having containerized the applications and pushed the images locally, you are to automate the build and push of
each image through the use of `Gitlab CI`. The build needs to happen on two different environments :

- The `dev` environment of your personal branch
- The `prod` environment of your personal branch

## Turning in results

In order to run in the results of this exercice, please create a `.gitlab-ci.yml` file under the project root that
consists of CI definition. As well as bash file under `ci-scripts` for any additional scripts.