# Training outline

## Machines

All along your training, you will be provided with a Raspberry Pi onto which you will deploy your applications and
expose them to the internet. The Raspberry Pi you will be provided with will have a domain name configured onto it
through the use of a `DDNS` service that will allow you to access your machine remotely.

The domain name that will be provided to you is what you will use for configuring access to your applications in
subsequent exercices.

## Branch Names

When you start the training, please create the following branches inside the current repository that have the following
names :

- `t-<your-number>-dev` : This is the branch that inside of which you will be making progress before merging changes to
  your production branch.
- `t-<your-number>-prod` : This is the branch that will represent your accepted, turned-in work. Accepted results of
  each exercice will be merged from the development branch into this one upon completion and validation.

`<your-number` represents, well... your number. If you are the first to start the training, your number should be `01`.
After which, each and every subsequent trainee should increment this number to get theirs.

## Turning in the work

When working on a particular exercice, you should always develop on your `t-<your-number>-dev` branch, create a merge
request from `t-<your-number>-dev` to `t-<your-number>-prod` and send it to your trainer for validation. You should
never push to the `master` branch, nor to the branch of a fellow trainee. If you ever have the need to create a branch,
it should have the following prefix `t-<your-number>-` to distinguish your work form that of the others.

## Environment variables inside the CI

If you ever have to add global environment variables inside the `Gitlab CI`, they should always be prefixed the
following pattern : `T<YOUR-NUMBER>_` in order to distinguish your variables from those of others.

## Docker Registry

When pushing images, you need to push on the following registries :

* Docker Hub
* Comwork's private registry

The access for these registries will be provided for you upon starting the [containerization exercice](ex2-section-2.md)
.

### Docker Image Names and Tags

The names of the docker images need to follow the next pattern : `<docker-registry>/t<your-number>-<app-name>`

The tags for your docker images, should be one of the following :

* `dev` : Corresponds to your `dev` branch
* `prod` : Corresponds to your `prod` branch
* `latest` : Corresponds to your `prod` branch
* `<branch-name>-<commit-hash>` : For any additional branches

## Database

In order to be able to have a persistent and reliable database for your application, under the Gitlab Environment file,
your will find an environment variable called `MONGODB_ATLAS_URI` that contains the URI for connecting to the database.

The `MONGODB_ATLAS_URI` variable is the same value to use for the `MONGO_URI` variable for configuring the `backend`
application.

The `MONGO_DB` inside the configuration of your `backend` application should adhere to the following pattern : 
* `t<your-number>Dev`: for local tests and deployment
* `t<your-number>Prod`: for production deployments on the Raspberry Pi